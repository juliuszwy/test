package cp.pay.mj.dao.impl;
import org.springframework.stereotype.Repository;
import cp.pay.mj.dao.IUserDao;
import cp.pay.mj.domain.account.User;
@Repository("userDao")
public class UserDaoImpl extends BaseHibernateDaoImpl<User, String> implements IUserDao{
	
}
