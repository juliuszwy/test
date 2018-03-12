package cp.pay.mj.service.account.impl;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import cp.pay.mj.cache.UserKeyCache;
import cp.pay.mj.dao.IUserDao;
import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.domain.common.PropertyFilter;
import cp.pay.mj.service.account.IUserService;
import cp.pay.mj.utils.BeanMapper;
import cp.pay.mj.utils.CollectionUtil;
import cp.pay.mj.utils.Convert;
import cp.pay.mj.utils.Encodes;
import cp.pay.mj.utils.StringUtil;
import cp.pay.mj.vo.AjaxCommon;
import cp.pay.mj.vo.SelectVo;
import cp.pay.mj.vo.UserForm;
@Service("userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	private IUserDao  userDao;
	@Autowired
	private  HttpServletRequest request;
	@Override
	public User save(UserForm userForm) throws Exception{
		User user = null;
		if(!StringUtil.isEmpty(userForm.getId())){
			synchronized (userForm.getId()) {
				user = userDao.get(userForm.getId());
				String md5Key = user.getMd5Key();
				String desKey  = user.getDesKey();
				String token = user.getToken();
				if(!user.getPassword().equals(userForm.getPassword()))
				userForm.setPassword(Encodes.encodeMd5(userForm.getPassword()));
				BeanMapper.copy(userForm, user);
				user.setToken(token);
				user.setMd5Key(md5Key);
				user.setDesKey(desKey);
				user = userDao.saveOrUpdate(user);
			}
		}else{
			user = BeanMapper.map(userForm, User.class);
			user.setPassword(Encodes.encodeMd5(user.getPassword()));
			user.setId(null);
			user.setCreateDate(new Date());
			if(user.getProperty()==1){
				user.setDesKey(Encodes.createPassword(8));
				user.setMd5Key(Encodes.createPassword(20));
				user.setToken(Encodes.createPassword(15));
			}else{
			}
			user = userDao.saveOrUpdate(user);
		}
		System.out.println(user+"0000000");
		flushCache(user); 
		return user;
	}
	
	public void flushCache(User u){
		UserKeyCache.getInstance().addKey(u.getToken(), u);
	}
	@Override
	public User findByName(String name) throws Exception{
		List<User> users = userDao.findByProperty("loginName", name);
		if(CollectionUtil.isNotBlank(users))
			return users.get(0);
		return null;
	}
	@Override 
	public UserForm findFormByName(String name) throws Exception{
		List<User> users = userDao.findByProperty("loginName", name);
		if(CollectionUtil.isNotBlank(users)){
			User user = users.get(0);
			UserForm userForm = BeanMapper.map(user, UserForm.class);
			return userForm;
		}
		return null;
	}
	
	@Override
	public UserForm findRoleFormById(User form) throws Exception {
		return null;
	}
	
	@Override
	public User findUniqueResultByProperty(String name, String value)
			throws Exception {
		return userDao.findUniqueResultByProperty(name, value);
	}
	
	@Transactional
	@Override
	public User deleteUser(User form) throws Exception {
		return userDao.delete(form);
	}
	
	

	@Override
	public UserForm findById(String id) throws Exception {
		return BeanMapper.map(userDao.get(id), UserForm.class);
	}


	@Override
	public Map<String, Object> findUserPageList(DataGridModel page, User form) throws Exception {
		form = (form == null ? new User() : form);
	    Map<String, Object> results = new HashMap<String, Object>();
	    List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
	    System.out.println(filters.size());
	    results.put("total", userDao.getTotalCount(filters));
	    List<User> users = userDao.findByConditionWithPage(filters, page);
		List<UserForm> groupForms = BeanMapper.mapList(users, new Convert<UserForm>() {
			@Override
			public void convert(Object source, UserForm userForm) {
//				User user = (User) source;
//				userForm.setCardCount(user.getAgentAccount().getCardCount());
			}
		});
	    results.put("rows", groupForms);
	    return results;
	}
	public static void main(String[] args) {
		System.out.println(Encodes.encodeMd5("mj123456"));
	}

	@Override
	public User findByAgentId(Integer id) throws Exception {
		List<User> lists = userDao.findByProperty("agentId", id);
		if(lists==null||lists.size()<=0)
			return null;
		
		return lists.get(0);
	}

	@Override
	public Integer getAgentCount(Integer id) {
			List<Long> list = userDao.findByHql("select count(*) from User where status=0 and property !=0 and parent=0");
			if(list.size()<=0)return 0;
			return Integer.parseInt(list.get(0)+"");
	}

	

	@Override
	public List<SelectVo> findByParent(Integer parent) {
		
		List<User> lists = userDao.findByProperty("parent", parent);
		List<SelectVo> vos = Lists.newArrayListWithCapacity(lists.size());
		for(User u:lists){
			SelectVo vo = new SelectVo();
			vo.setText(u.getName());
			vos.add(vo);
		}
		return vos;
	}

	@Override
	public void updatePwd(User user) {
		userDao.hqlExecute("update User set password=? where id=?", user.getPassword(),user.getId());
	}

	@Override
	public UserForm findByGameId(String gameId) throws Exception {
		List<User> list = userDao.findByProperty("gameId", gameId);
		if(list!=null&&list.size()>0)return BeanMapper.map(list.get(0), UserForm.class);
		return null;
	}

	@Override
	public void addCard(String agentId, Integer cardCount) {
		Integer aid = Integer.parseInt(agentId);
		List<User> list = userDao.findByProperty("agentId",aid);
		User u = list.get(0);
		synchronized (u.getId()) {
			userDao.executeUpdateByHql("update User set cardCount = cardCount+? where id=?", cardCount ,u.getId());
		}
	}
	@Override
	public int reduceCard(String agentId, Integer cardCount) {
		Integer aid = Integer.parseInt(agentId);
		List<User> list = userDao.findByProperty("agentId",aid);
		User u = list.get(0);
		synchronized (u.getId()) {
			userDao.executeUpdateByHql("update User set cardCount = cardCount-? where id=?", cardCount ,u.getId());
			return 2;
		}
	}

	@Override
	public User save(User userForm) throws Exception {
		return userDao.saveOrUpdate(userForm);
	}

	@Override
	public String getVoice(String id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<User> findMasterAll() {
		
		return userDao.findByProperty("property", 1);
	}

	@Override
	public List<AjaxCommon> findnameWithToken() {
		
		List<User> list = userDao.findAll();
		List<AjaxCommon> map = Lists.newArrayListWithCapacity(list.size());
		for(User u :list){
			AjaxCommon a = new AjaxCommon(u.getToken(), u.getName());
			map.add(a);
		}
		return map;
	}

}
