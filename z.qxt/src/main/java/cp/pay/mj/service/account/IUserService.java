package cp.pay.mj.service.account;
import java.util.List;
import java.util.Map;

import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.vo.AjaxCommon;
import cp.pay.mj.vo.SelectVo;
import cp.pay.mj.vo.UserForm;
public interface IUserService {
	User save(UserForm userForm) throws Exception;
	Map<String, Object> findUserPageList(DataGridModel page, User form) throws Exception;
	List<User>  findMasterAll();
	UserForm findById(String id)throws Exception;
	List<AjaxCommon> findnameWithToken();
	
	User save(User userForm) throws Exception;
	User findByName(String name) throws Exception;
	UserForm findFormByName(String name) throws Exception;
	User findUniqueResultByProperty(String name,String value)throws Exception;
	UserForm findRoleFormById(User form)throws Exception;
	
	UserForm findByGameId(String gameId)throws Exception;
	User findByAgentId(Integer id)throws Exception;
	User deleteUser(User form)throws Exception;
	
	
	
	Integer getAgentCount(Integer id);
	String getVoice(String id);
	List<SelectVo> findByParent(Integer parent);
	void updatePwd(User user);
	
	void addCard(String userId ,Integer cardCount);
	int reduceCard(String agentId, Integer cardCount);
}
