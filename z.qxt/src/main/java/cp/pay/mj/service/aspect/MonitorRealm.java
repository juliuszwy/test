package cp.pay.mj.service.aspect;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cp.pay.mj.domain.account.User;
import cp.pay.mj.service.account.IUserService;
import cp.pay.mj.vo.UserForm;

public class MonitorRealm extends AuthorizingRealm {

  private static final Logger logger = LoggerFactory.getLogger(MonitorRealm.class);
  @Autowired
  private IUserService  userService;
  @Autowired
  private HttpSession session;
  public MonitorRealm() {
    super();
  }

  /**
   * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
   */
  
  @Override
  protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
	  ShiroUser shiroUser = (ShiroUser) principals.fromRealm(getName()).iterator().next();
		User user=null;
		try {
			user = userService.findUniqueResultByProperty("loginName", shiroUser.getLoginName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (user != null) {
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			
			return info;
		} else {
			return null;
		}
  }
  /**
   * 认证回调函数,登录时调用
   */
  @Override
  protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
	    UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
	    User currentUser = null;
	    try {
	      currentUser = userService.findByName(token.getUsername());
	      
	      session.setAttribute("admin", currentUser);
	    } catch (Exception e) {
	    	e.printStackTrace();
	      logger.error(e.getMessage(), e);
	      throw new AuthenticationException();
	    }
	    if (currentUser == null) {
	      throw new AuthenticationException();
	    }
	    return new SimpleAuthenticationInfo(new ShiroUser(currentUser.getId(), currentUser.getLoginName(), currentUser.getName(),
	    		currentUser.getProperty()), currentUser.getPassword(), getName());
  }
  
  
  public static class ShiroUser implements Serializable {
		private static final long serialVersionUID = -1748602382963711884L;
		private String id;
		private String loginName;
		private String name;
		private Integer property;

		public ShiroUser(String id, String loginName, String name,Integer property) {
			this.id = id;
			this.loginName = loginName;
			this.name = name;
			this.property = property;
		}

		public String getLoginName() {
			return loginName;
		}

		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出.
		 */
		@Override
		public String toString() {
			return loginName;
		}

		public String getName() {
			return name;
		}

		public String getId() {
			return id;
		}

		public Integer getProperty() {
			return property;
		}
	}

  /**
   * 更新用户授权信息缓存
   * 
   * @param principal
   */
  public void clearCachedAuthorizationInfo(UserForm principal,HttpSession session) {
	  SimplePrincipalCollection principals = new SimplePrincipalCollection(new ShiroUser(principal.getId(), principal.getLoginName(),principal.getName(),principal.getProperty()), getName());
	  clearCachedAuthorizationInfo(principals);
	  System.out.println(getAuthorizationCache().size());
	  session.invalidate();
  }

  /**
   * 清除所有用户授权信息缓存.
   */
  public void clearAllCachedAuthorizationInfo() {
    Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
    System.out.println(cache.size());
    if (cache != null) {
      for (Object key : cache.keys()) {
        cache.remove(key);
      }
    }
    System.out.println(cache.size());
  }
}
