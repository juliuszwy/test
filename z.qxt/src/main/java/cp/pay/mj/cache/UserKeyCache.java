package cp.pay.mj.cache;

import java.util.HashMap;
import java.util.Map;

import cp.pay.mj.domain.account.User;

public class  UserKeyCache{
    private static  UserKeyCache instance = null;  
    static {  
        instance = new UserKeyCache();  
    }  
    private UserKeyCache (){}
    public static UserKeyCache getInstance() {  
        return UserKeyCache.instance;  
    }  
	private Map<String,User> auth = new HashMap<String, User>();
	public User getKeyByToken(String token){
		return auth.get(token);
	}
	public void addKey(String token,User key){
		 auth.put(token, key);
	}
}
