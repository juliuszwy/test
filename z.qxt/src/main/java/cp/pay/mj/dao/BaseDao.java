package cp.pay.mj.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


import org.hibernate.criterion.Criterion;

import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.common.PropertyFilter;
import cp.pay.mj.domain.common.PropertyFilter.MatchType;

public interface BaseDao<E, I extends Serializable> {

	void batchExecute(String sql, List<List<Object>> objs);
	void hqlExecute(String hql,Object... values);
	void sqlExecute(String sql, Object... values);
	Criterion buildCriterion(String propertyName, Object propertyValue, MatchType matchType);

	Criterion[] buildCriterionByPropertyFilter(List<PropertyFilter> filters);

	E delete(E entity);
	
	void markDelete(Collection<E> entities);

	E markDelete(E entity);

	E markDelete(I id);

	void markDelete(I... ids);

	Integer executeUpdateByHql(String hql, List<Object> params);
	Integer executeUpdateByHql(final String hql, final Object... values);

	Integer executeUpdateBySql(String hql, List<Object> params);

	boolean exists(I id);
	
	List<E> findByCondition(List<PropertyFilter> filters);
	
	List<E> findByCondition(LinkedHashMap<String, Object> params, LinkedHashMap<String, String> orderMap);

	List<E> findByCondition(LinkedHashMap<String, Object> params, LinkedHashMap<String, String> orderMap, int startIndex, int count);

	List<E> findByConditionWithPage(List<PropertyFilter> filters, DataGridModel page);
	
	List<E> findWithPage(DataGridModel page);

	List<E> findByCriterions(Criterion...criterions);

	List<E> findByHql(String hql, List<Object> params);

	List<E> findByHql(String hql, List<Object> params, int firstResult, int maxResults);
	
	<X> List<X> findByHql(String hql, Object...values);
	<X> List<X> findByHqlNoDistinct(final String hql, final Object... values);
	
	List<E> findByProperty(String propertyName, Object value);

	List<E> findBySql(String conditionSql, List<Object> params, LinkedHashMap<String, String> orderMap);

	<X> List<X> findBySql(String hql, Object...values);

	Long findCountByHql(String hql, List<Object> params);

	Long findCountBySql(String sql, List<Object> params);
	
	Object findObjectByHql(String hql, List<Object> params);

	List<Object> findObjectsByHql(String hql, List<Object> params);

	List<Object[]> findObjectsBySql(String hql, List<Object> params);
	
	List<Object[]> findObjectsBySql(String sql, List<Object> params, int startIndex, int count);

	<X> X findUnique(String hql, Map<String, ?> values);

	<X> X findUnique(String hql, Object... values);

	<X> X findUniqueByCriterions(Criterion... criterions);
	
	List<Object> findUniqueBySql(String sql, Object... values);

	E findUniqueResultByProperty(String property, Object value);

	E get(I id);

	String getIdName();

	List<E> getPage(int startIndex, int count);
	
	Long getTotalCount();
	
//	Long getTotalCount(final LinkedHashMap<String, Object> params);

	Long getTotalCount(List<PropertyFilter> filters);

	Long getTotalCount(String hql, List<Object> params,List<PropertyFilter> filters);

	boolean isPropertyUnique(String propertyName, Object newValue,	Object oldValue);

	List<E> list();

	List<E> list(Integer status,String sort,String name);
	E load(I id);

	Map<I, E> map(Integer status) ;

	Map<String, E> map(Integer status, String propertyName) ;

	E merge(E entity);

	void save(Collection<E> entities);

	E save(E entity);

	void save(Object...array);

	Object saveObject(Object object);

	void saveOrUpdate(Collection<E> entities);

	E saveOrUpdate(E entity);

	List<String> showTables();

	E update(E entity);

	Long getTotalCount(Criterion... criterions);

	void restore(I... ids);

	E restore(I id);

	E restore(E entity);

	void markRestore(Collection<E> entities);

	void update(Object... array);

	void delete(Collection<E> entity);
	void flush();
	void evict(E e);
	List<E> findAll();
	
}