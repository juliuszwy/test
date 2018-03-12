package cp.pay.mj.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import cp.pay.mj.cache.UserKeyCache;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.service.account.IUserService;

@Component("cacheTask")
public class CacheTask {
	@Autowired
	private IUserService userService;
    public  void excute()
    {
    	List<User> users = userService.findMasterAll();
    	for(User u:users){
    		UserKeyCache.getInstance().addKey(u.getToken(), u);
    	}
    }
}
