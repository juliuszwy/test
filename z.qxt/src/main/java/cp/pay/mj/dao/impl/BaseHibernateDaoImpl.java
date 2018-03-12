package cp.pay.mj.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.transform.ResultTransformer;

import com.google.common.collect.Maps;

import cp.pay.mj.dao.BaseDao;
import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.common.PropertyFilter;
import cp.pay.mj.domain.common.PropertyFilter.MatchType;
import cp.pay.mj.exception.DaoException;
import cp.pay.mj.utils.CollectionUtil;
import cp.pay.mj.utils.Constants;
import cp.pay.mj.utils.MapUtil;
import cp.pay.mj.utils.Reflections;
import cp.pay.mj.utils.StringUtil;

public abstract class BaseHibernateDaoImpl<E, I extends Serializable> implements BaseDao<E, I> {

	protected String className;
	protected Class<E> entityClass;

	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public BaseHibernateDaoImpl() {
		entityClass = (Class<E>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		className = entityClass.getName();
	}

	private void addOrderCriterion(LinkedHashMap<String, String> orderMap,  Criteria criteria) {
		if (MapUtil.isNotBlank(orderMap)) {
			for (String key : orderMap.keySet()) {
				Object value = orderMap.get(key);
				Order order = null;
				if (StringUtils.equalsIgnoreCase(StringUtil.valueOf(value), "desc")) {
					order = Order.desc(key);
				} else {
					order = Order.asc(key);
				}
				criteria.addOrder(order);
			}
		}
	}

	private void addParaCriterion(LinkedHashMap<String, Object> params, Criteria criteria) {
		if (MapUtil.isNotBlank(params)) {
			for (String key : params.keySet()) {
				Object value = params.get(key);
				Criterion cron = null;
				if (value instanceof String
						&& StringUtils.startsWith(value.toString(), "%")
						&& StringUtils.endsWith(value.toString(), "%")) {
					cron = Restrictions.like(key, value);
				} else {
					cron = Restrictions.eq(key, value);
				}
				criteria.add(cron);
			}
		}
	}
	private void addQueryParams(Query q, List<Object> params) {
		if (!(params == null || params.size() == 0)) {
			int size = params.size();
			for (int i = 0; i < size; i++) {
				q.setParameter(i, params.get(i));
			}
		}
	}

	@Override
	public void batchExecute(final String sql, final List<List<Object>> objs) {
		if (CollectionUtil.isBlank(objs)) {
			return;
		}
		Session session = getCurrentSession();
		int count = 1;
		for (List<Object> obj : objs) {
			Query q = session.createSQLQuery(sql);
			for (int i = 0; i < obj.size(); i++) {
				q.setParameter(i, obj.get(i));
			}
			q.executeUpdate();
			count++;
			if (count % Constants.BATCH_SIZE == 0) {
				session.flush();
				session.clear();
			}
		}
		session.flush();
		session.clear();
	}

	/**
	 * 执行HQL进行批量修改/删除操作.
	 * 
	 * @param values
	 *            命名参数,按名称绑定.
	 * @return 更新记录数.
	 */
	public int batchExecute(final String hql, final Map<String, ?> values) {
		return createQuery(hql,true, values).executeUpdate();
	}
	public void hqlExecute(String hql,Object... values){
		createQuery(hql,true, values).executeUpdate();
	}
	public void sqlExecute(String sql,Object... values){
		createSqlQuery(sql, values).executeUpdate();
	}
	public Query createSqlQuery(final String queryString, final Object... values) {
		Validate.notBlank(queryString, "queryString不能为空");
		Query query = getCurrentSession().createSQLQuery(queryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return distinct(query);
	}
	/**
	 * 执行HQL进行批量修改/删除操作.
	 * 
	 * @param values
	 *            数量可变的参数,按顺序绑定.
	 * @return 更新记录数.
	 */
	public int batchExecute(final String hql, final Object... values) {
		return createQuery(hql,true, values).executeUpdate();
	}

	/**
	 * 按属性条件参数创建Criterion,辅助函数.
	 */
	@Override
	public Criterion buildCriterion(final String propertyName,
			final Object propertyValue, final MatchType matchType) {
		Validate.notBlank(propertyName, "propertyName can't be null");
		Criterion criterion = null;
		// 根据MatchType构造criterion
		switch (matchType) {
		case EQ:
			criterion = Restrictions.eq(propertyName, propertyValue);
			break;
		case LIKE:
			criterion = Restrictions.like(propertyName, (String) propertyValue,	MatchMode.ANYWHERE);
			break;
		case LE:
			criterion = Restrictions.le(propertyName, propertyValue);
			break;
		case LT:
			criterion = Restrictions.lt(propertyName, propertyValue);
			break;
		case GE:
			criterion = Restrictions.ge(propertyName, propertyValue);
			break;
		case GT:
			criterion = Restrictions.gt(propertyName, propertyValue);
		}
		return criterion;
	}
	
	
	/**
	 * 按属性条件列表创建Criterion数组,辅助函数.
	 */
	@Override
	public Criterion[] buildCriterionByPropertyFilter(final List<PropertyFilter> filters) {
		List<Criterion> criterionList = new ArrayList<Criterion>();
		for (PropertyFilter filter : filters) {
			if (!filter.hasMultiProperties()) { // 只有一个属性需要比较的情况.
				Criterion criterion = buildCriterion(filter.getPropertyName(), filter.getMatchValue(), filter.getMatchType());
				criterionList.add(criterion);
			} else {// 包含多个属性需要比较的情况,进行or处理.
				Disjunction disjunction = Restrictions.disjunction();
				for (String param : filter.getPropertyNames()) {
					Criterion criterion = buildCriterion(param,	filter.getMatchValue(), filter.getMatchType());
					disjunction.add(criterion);
				}
				criterionList.add(disjunction);
			}
		}
		return criterionList.toArray(new Criterion[criterionList.size()]);
	}
	
	
	
	private String concatSql(String conditionSql,	LinkedHashMap<String, String> orderMap) {
		StringBuilder sb = new StringBuilder(conditionSql).append(" order by ");
		for (Entry<String, String> entry : orderMap.entrySet()) {
			sb.append(entry.getKey() + " " + entry.getValue() + ",");
		}
		sb.deleteCharAt(sb.length() - 1);
		return sb.toString();
	}
	@SuppressWarnings("unchecked")
	protected long countCriteriaResult(final Criteria c) {
		CriteriaImpl impl = (CriteriaImpl) c;

		// 先把Projection、ResultTransformer、OrderBy取出来,清空三者后再执行Count操作
		Projection projection = impl.getProjection();
		ResultTransformer transformer = impl.getResultTransformer();

		List<CriteriaImpl.OrderEntry> orderEntries = null;
		try {
			orderEntries = (List) Reflections.getFieldValue(impl, "orderEntries");
			Reflections.setFieldValue(impl, "orderEntries", new ArrayList());
		} catch (Exception e) {
			// logger.error("不可能抛出的异常:{}", e.getMessage());
		}

		// 执行Count查询
		Long totalCountObject = (Long) c.setProjection(Projections.rowCount()).uniqueResult();
		long totalCount = (totalCountObject != null) ? totalCountObject : 0;

		// 将之前的Projection,ResultTransformer和OrderBy条件重新设回去
		c.setProjection(projection);

		if (projection == null) {
			c.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
		}
		if (transformer != null) {
			c.setResultTransformer(transformer);
		}
		try {
			Reflections.setFieldValue(impl, "orderEntries", orderEntries);
		} catch (Exception e) {
			// logger.error("不可能抛出的异常:{}", e.getMessage());
		}
		return totalCount;
	}

	public Criteria createCriteria(final Criterion... criterions) {
		Criteria criteria = getCurrentSession().createCriteria(entityClass);
		notDeleted(criteria);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		distinct(criteria);
		return criteria;
	}

	public Query createQuery(final String queryString,final boolean distinct, final Object... values) {
		Validate.notBlank(queryString, "queryString不能为空");
		Query query = getCurrentSession().createQuery(queryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		if(distinct)distinct(query);
		return query;
	}
	

	private Query createSQLQuery(String queryString, Object[] values) {
		Validate.notBlank(queryString, "queryString不能为空");
		Query query = getCurrentSession().createSQLQuery(queryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query;
	}

	@Override
	public void markDelete(Collection<E> entities) {
		Validate.notNull(entities, "删除对象为空.");
		for (E e : entities) {
			markDelete(e);
		}
	}

	@Override
	public E markDelete(E entity) {
		Reflections.setFieldValue(entity, "delete", true);
		getCurrentSession().update(entity);
		return entity;
	}

	@Override
	public E markDelete(I id) {
		E entity = load(id);
		markDelete(entity);
		return entity;
	}

	@Override
	public void markDelete(I... ids) {
		Validate.notNull(ids, "删除对象为空.");
		for (I i : ids) {
			markDelete(i);
		}
	}
	
	
	
	@Override
	public void markRestore(Collection<E> entities) {
		Validate.notNull(entities, "恢复对象为空.");
		for (E e : entities) {
			markDelete(e);
		}
	}

	@Override
	public E restore(E entity) {
		Reflections.setFieldValue(entity, "delete", false);
		getCurrentSession().update(entity);
		return entity;
	}

	@Override
	public E restore(I id) {
		E entity = load(id);
		markDelete(entity);
		return entity;
	}

	@Override
	public void restore(I... ids) {
		Validate.notNull(ids, "恢复对象为空.");
		for (I i : ids) {
			markDelete(i);
		}
	}

	/**
	 * 为Criteria添加distinct transformer. 预加载关联对象的HQL会引起主对象重复, 需要进行distinct处理.
	 */
	//重要 否则在用criteria.list()的时候，返回了重复的数据，这里的重复不是指单个字段相同想过滤，而是真正的重复，完全相同的2条记录
	public Criteria distinct(Criteria criteria) {
		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return criteria;
	}
	
	/**
	 * 为Query添加distinct transformer. 预加载关联对象的HQL会引起主对象重复, 需要进行distinct处理.
	 */
	public Query distinct(Query query) {
		query.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return query;
	}

	@Override
	public Integer executeUpdateByHql(final String hql, final List<Object> params) {
		Query q = createQuery(hql,true, params);
		return q.executeUpdate();
	}
	@Override
	public Integer executeUpdateByHql(final String hql, final Object... values) {
		Query q = createQuery(hql,true, values);
		return q.executeUpdate();
	}
	
	@Override
	public Integer executeUpdateBySql(final String sql, final List<Object> params) {
		Query q = getCurrentSession().createSQLQuery(sql);
		if (CollectionUtil.isNotBlank(params)) {
			for (int i = 0; i < params.size(); i++) {
				q.setParameter(i, params.get(i));
			}
		}
		return q.executeUpdate();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dao.impl.BaseDao#exists(I)
	 */
	@Override
	public boolean exists(I id) {
		Validate.notNull(id, "对象不得为空.");
		return load(id) != null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> findByCondition(final LinkedHashMap<String, Object> params,	final LinkedHashMap<String, String> orderMap) {
		Criteria criteria = getCurrentSession().createCriteria(entityClass);
		distinct(criteria);
		notDeleted(criteria);
		addParaCriterion(params, criteria);
		addOrderCriterion(orderMap, criteria);
		return criteria.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<E> findByCondition(List<PropertyFilter> filters) {
		Criterion[] criterions = buildCriterionByPropertyFilter(filters);
		Criteria criteria = createCriteria(criterions);
		return criteria.list();
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<E> findByCondition(final LinkedHashMap<String, Object> params,
			final LinkedHashMap<String, String> orderMap, final int startIndex,
			final int count) {
		Criteria criteria = getCurrentSession().createCriteria(entityClass);
		distinct(criteria);
		notDeleted(criteria);
		addParaCriterion(params, criteria);
		addOrderCriterion(orderMap, criteria);
		criteria.setFirstResult(startIndex);
		criteria.setMaxResults(count);
		return criteria.list();
	}
	@Override
	public List<E> findByConditionWithPage(List<PropertyFilter> filters, DataGridModel page) {
		Criterion[] criterions = buildCriterionByPropertyFilter(filters);
		return findPage(page, criterions);
	}
	/**
	 * 按Criteria查询对象列表.
	 * 
	 * @param criterions
	 *            数量可变的Criterion.
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<E> findByCriterions(final Criterion... criterions) {
		return createCriteria(criterions).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> findByHql(final String hql, final List<Object> params) {
		if (CollectionUtil.isBlank(params)) {
			return createQuery(hql,true, ArrayUtils.EMPTY_OBJECT_ARRAY).list();
		}
		return createQuery(hql,true, params.toArray()).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> findByHql(final String hql, final List<Object> params, 	final int startIndex, final int count) {
		Query q = null;
		if (CollectionUtil.isBlank(params)) {
			q = createQuery(hql,true, ArrayUtils.EMPTY_OBJECT_ARRAY);
		} else {
			q = createQuery(hql, true,params.toArray());
		}
		if(startIndex>=0){
			q.setFirstResult(startIndex);
			q.setMaxResults(count);
		}
		return q.list();
	}

	/**
	 * 按HQL查询对象列表.
	 * 
	 * @param values
	 *            数量可变的参数,按顺序绑定.
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <X> List<X> findByHql(final String hql, final Object... values) {
		return createQuery(hql, true,values).list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public <X> List<X> findByHqlNoDistinct(final String hql, final Object... values) {
		return createQuery(hql,false,values).list();
	}
	/**
	 * 按属性查找对象列表, 匹配方式为相等.
	 */
	@Override
	public List<E> findByProperty(final String propertyName, final Object value) {
		Validate.notBlank(propertyName, "propertyName不能为空");
		Criterion criterion = Restrictions.eq(propertyName, value);
		return findByCriterions(criterion);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> findBySql(final String conditionSql,
			final List<Object> params,
			final LinkedHashMap<String, String> orderMap) {
		String sql = concatSql(conditionSql, orderMap);
		Query q = getCurrentSession().createSQLQuery(sql)
				.addEntity(entityClass);
		addQueryParams(q, params);
		return q.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public <X> List<X> findBySql(final String hql, final Object... values) {
		return createSQLQuery(hql, values).list();
	}

	@Override
	public Long findCountByHql(final String sql, final List<Object> params) {
		Query q = getCurrentSession().createQuery(sql);
		addQueryParams(q, params);
		BigInteger num = (BigInteger) q.uniqueResult();
		return num.longValue();
	}

	@Override
	public Long findCountBySql(final String sql, final List<Object> params) {
		Query q = getCurrentSession().createSQLQuery(sql);
		addQueryParams(q, params);
		BigInteger num = (BigInteger) q.uniqueResult();
		return num.longValue();
	}

	@Override
	public Object findObjectByHql(final String hql, final List<Object> params) {
		Query q = getCurrentSession().createQuery(hql);
		addQueryParams(q, params);
		return q.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> findObjectsByHql(final String hql, final List<Object> params) {
		Query q = getCurrentSession().createQuery(hql);
		addQueryParams(q, params);
		return q.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findObjectsBySql(final String sql, final List<Object> params) {
		Query q = getCurrentSession().createSQLQuery(sql);
		addQueryParams(q, params);
		return q.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findObjectsBySql(final String sql,
			final List<Object> params, final int startIndex, final int count) {
		Query q = getCurrentSession().createSQLQuery(sql);
		addQueryParams(q, params);
		q.setFirstResult(startIndex);
		q.setMaxResults(count);
		return q.list();
	}

	@SuppressWarnings("unchecked")
	private List<E> findPage(DataGridModel page, Criterion[] criterions) {
		if (page == null ) {
			throw new DaoException("page 为空.");
		}
		Criteria c = createCriteria(criterions);
		setPageRequestToCriteria(c, page);
		List<E> result = c.list();
		return result;
	}

	/**
	 * 按HQL查询唯一对象.
	 * 
	 * @param values 命名参数,按名称绑定.
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <X> X findUnique(final String hql, final Map<String, ?> values) {
		return (X) createQuery(hql,true, values).uniqueResult();
	}

	/**
	 * 按HQL查询唯一对象.
	 * 
	 * @param values
	 *            数量可变的参数,按顺序绑定.
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <X> X findUnique(final String hql, final Object... values) {
		return (X) createQuery(hql,true, values).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public <X> X findUniqueByCriterions(Criterion...criterions){
		return (X) createCriteria(criterions).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> findUniqueBySql(final String sql, final Object...values){
		return createSQLQuery(sql, values).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public E findUniqueResultByProperty(String property, Object value) {
		Validate.notBlank(property, "propertyName不能为空");
		Criterion criterion = Restrictions.eq(property, value);
		return (E) createCriteria(criterion).uniqueResult();
	}

	/**
	 * Flush当前Session.
	 */
	@Override
	public void flush() {
		getCurrentSession().flush();
	}
	@Override
	public void evict(E e) {
		getCurrentSession().evict(e);
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dao.impl.BaseDao#get(I)
	 */
	@Override
	@SuppressWarnings("unchecked")
	public E get(I id) {
		if (StringUtils.isBlank(id.toString())) {
			return null;
		}
		
		return (E)getCurrentSession().get(entityClass, id);
		
	}
	
	@SuppressWarnings("unchecked")
	
	/**
	 * 使用list()方法代替
	 */
	public List<E> getAll() {
		Query query = getCurrentSession().createQuery("from " + className + " as c where  order by c.id asc");
		return (List<E>) query.list();
	}

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * 取得对象的主键名.
	 */
	@Override
	public String getIdName() {
		ClassMetadata meta = sessionFactory.getClassMetadata(entityClass);
		return meta.getIdentifierPropertyName();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> getPage(final int startIndex, final int count) {
		Query query = getCurrentSession().createQuery("select * from " + className + "as c order by c.id asc");
		query.setMaxResults(count);
		query.setFirstResult(startIndex);
		return query.list();
	}
	
	@Override
	public Long getTotalCount() {
//		return ((Long) getCurrentSession().createQuery(	"select count(id) from " + className).uniqueResult()).longValue();
		Criteria c = getCurrentSession().createCriteria(entityClass);
		notDeleted(c);
		return countCriteriaResult(c);
	}

	@Override
	public Long getTotalCount(Criterion...criterions){
		Criteria c = createCriteria(criterions);
		return countCriteriaResult(c);
	}

/*	@Override
	public Long getTotalCount(final LinkedHashMap<String, Object> params) {
		StringBuilder sql = new StringBuilder("select count(*) from " + entityClass.getSimpleName() + " where 1=1 ");
		if (params != null) {
			for (Entry<String, Object> e : params.entrySet()) {
				if (e.getKey() instanceof String) {
					sql.append("and " + e.getKey() + " like ? ");
				} else {
					sql.append("and " + e.getKey() + " = ? ");
				}

			}
		}
		Query q = getCurrentSession().createQuery(sql.toString());
		int i = 0;
		if (params != null && params.size() > 0) {
			for (Entry<String, Object> e : params.entrySet()) {
				q.setParameter(i, e.getValue());
				i++;
			}
		}

		return (Long) q.uniqueResult();
	}
*/
	@Override
	public Long getTotalCount(List<PropertyFilter> filters) {
		Criterion[] criterions = buildCriterionByPropertyFilter(filters);
		return getTotalCount(criterions);
	}
	
	@Override
	public Long getTotalCount( String hql,  List<Object> params,List<PropertyFilter> filters) {
		String s = "";
		for (PropertyFilter filter : filters) {
			if (!filter.hasMultiProperties()) { // 只有一个属性需要比较的情况.
				s +=filter.getPropertyName()+"=? " ;
				params.add(filter.getMatchValue());
			} else {// 包含多个属性需要比较的情况,进行or处理.
				for (String param : filter.getPropertyNames()) {
					s+=param+"=? and ";
					params.add(filter.getMatchValue());
				}
			}
		}
		if(!s.equals("")){
			if(s.endsWith("and "))
				hql+=" and "+s.substring(0, s.length()-4);
		}
		hql += buildCriterionByPropertyFilter(filters);
		Query q = getCurrentSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		return (Long) q.uniqueResult();
	}
	
	/**
	 * 判断对象的属性值在数据库内是否唯一.
	 * 
	 * 在修改对象的情景下,如果属性新修改的值(value)等于属性原来的值(orgValue)则不作比较.
	 */
	@Override
	public boolean isPropertyUnique(final String propertyName,
			final Object newValue, final Object oldValue) {
		if (newValue == null || newValue.equals(oldValue)) {
			return true;
		}
		Object object = findUniqueResultByProperty(propertyName, newValue);
		return (object == null);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dao.impl.BaseDao#list()
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<E> list() {
		Criteria c = getCurrentSession().createCriteria(entityClass);
		notDeleted(c);
		distinct(c);
		c.addOrder(Order.asc("id"));
		return c.list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<E> list(Integer status,String sort,String name) {
		if(status == null){
			return list();
		}
		Criterion criterion = Restrictions.eq("status", status);
		Criteria c = createCriteria(criterion);
		if(sort!=null&&name!=null){
			if(sort.equals("asc"))
				c.addOrder(Order.asc(name));
			else 
				c.addOrder(Order.desc(name));
		}
 		return c.list();
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dao.impl.BaseDao#load(I)
	 */
	@Override
	@SuppressWarnings("unchecked")
	public E load(I id) {// entityClass is used
		return (E) getCurrentSession().load(entityClass, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<I, E> map(Integer status) {
		List<E> list = list(status,null,null);
		if(list == null){
			return Maps.newHashMap();
		}
		String id = getIdName();
		Map<I, E> map = Maps.newHashMapWithExpectedSize(list.size());
		try {
			for(E e : list){
				Object key = PropertyUtils.getProperty(e, id);
				map.put((I)key, e);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e.getCause());
		}
		return map;
	}

	@Override
	public Map<String, E> map(Integer status, String propertyName) {
		List<E> list = list(status,null,null);
		if(list == null){
			return Maps.newHashMap();
		}
		Map<String, E> map = Maps.newHashMapWithExpectedSize(list.size());
		try {
			for(E e : list){
				Object key = PropertyUtils.getProperty(e, propertyName);
				map.put(StringUtil.valueOf(key), e);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e.getCause());
		}
		return map;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dao.impl.BaseDao#merge(E)
	 */
	@Override
	public E merge(E entity) {
		getCurrentSession().merge(entity);
		return entity;
	}

	public Criteria notDeleted(Criteria criteria){
		Criterion notDeleted = Restrictions.eq("delete", false);
		criteria.add(notDeleted);
		return criteria;
	}

	@Override
	public void save(final Collection<E> entities) {
		if (entities == null || entities.size() == 0) {
			return;
		}
		Session session = getCurrentSession();
		session.flush();
		int count = 0;
		for (E e : entities) {
			session.save(e);
			if (++count % Constants.BATCH_SIZE == 0) {
				session.flush();
				session.clear();
			}
		}
		session.flush();
		session.clear();
	}

	@Override
	public E save(E entity) {
		getCurrentSession().save(entity);
		return entity;
	}

	@Override
	public void save(Object...array) {
		Session session = getCurrentSession();
		for (int i = 0; i < array.length; ++i) {
			session.save(array[i]);
			if (i % Constants.BATCH_SIZE == 0) {
				session.flush();
				session.clear();
			}
		}
		session.flush();
		session.clear();
	}
	
	@Override
	public void update(Object...array) {
		Session session = getCurrentSession();
		for (int i = 0; i < array.length; ++i) {
			session.update(array[i]);
			if (i % Constants.BATCH_SIZE == 0) {
				session.flush();
				session.clear();
			}
		}
		session.flush();
		session.clear();
	}

	@Override
	public Object saveObject(Object object){
		return getCurrentSession().save(object);
	}

	@Override
	public void saveOrUpdate(final Collection<E> entities) {
		if (entities == null || entities.size() == 0) {
			return;
		}
		Session session = getCurrentSession();
		session.flush();
		int count = 0;
		for (E e : entities) {
			session.saveOrUpdate(e);
			if (++count % Constants.BATCH_SIZE == 0) {
				session.flush();
				session.clear();
			}
		}
		session.flush();
		session.clear();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dao.impl.BaseDao#saveOrUpdate(E)
	 */
	@Override
	public E saveOrUpdate(E entity) {
		getCurrentSession().saveOrUpdate(entity);
		return entity;
	}

	private Criteria setPageRequestToCriteria(Criteria c, DataGridModel page) {
		Validate.isTrue(page.getPageSize() > 0, "Page Size must larger than zero");
		c.setFirstResult(page.getCurrentRow());
		c.setMaxResults(page.getPageSize());
		if(!StringUtil.isEmpty(page.getSort()))
		if ("asc".equals(page.getOrder())) {
			c.addOrder(Order.asc(page.getSort()));
		} else if("desc".equals(page.getOrder())){
			c.addOrder(Order.desc(page.getSort()));
		}else{
			
		}
		return c;
	}

	@Resource(name = "sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> showTables() {
		String sql = "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA=DATABASE()";
		Query q = getCurrentSession().createSQLQuery(sql);
		return q.list();
	}
	
	/*
	 * 
	 * @see com.dao.impl.BaseDao#update(E)
	 */
	@Override
	public E update(E entity) {
		getCurrentSession().update(entity);
		return entity;
	}

	@Override
	public E delete(E entity) {
		Validate.notNull(entity, "删除对象不能够为空.");
		getCurrentSession().delete(entity);
		return entity;
	}
	
	@Override
	public void delete(Collection<E> entities) {
		Validate.notNull(entities, "删除对象不能够为空.");
		
		for(E e : entities){
			delete(e);
		}
		
	}

	@Override
	public List<E> findWithPage(DataGridModel page) {
		return findByHql("from " + entityClass.getName(), null, page.getCurrentRow(), page.getPageSize());
	}
	public List<E> findAll() {
		return findByHql("from " + entityClass.getName());
	}
}
