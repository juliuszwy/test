package cp.pay.mj.service.aspect;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;

import cp.pay.mj.vo.UserForm;

@Aspect
@Service("monitorRealmAspect")
@DependsOn("monitorRealm")
public class MonitorRealmAspect {
	private MonitorRealm monitorRealm;
	@Autowired
	HttpSession seeSession;
	@Resource
	public void setMonitorRealm(MonitorRealm monitorRealm) {
		this.monitorRealm = monitorRealm;
	}
	
/*	@Pointcut("execution(* cp.pay.mj.test.AopTest.test(..))")
	public void userModifyMethod(){
	}*/
	
	@Pointcut("execution(* cp.pay.mj.service.account.IUserService.save(..))")
	public void userModifyMethod(){
	}
	@Pointcut("execution(* cp.pay.mj.service.account.IUserService.delete(..))")
	public void userDeleteMethod(){
		
	}
	
	/*@Before("userModifyMethod()")
	public void testAfter(){
		System.out.println("00000000000000000000000000000000");
	}*/
	@AfterReturning(pointcut="userModifyMethod() || userDeleteMethod()",returning="user")  
	public void userClearCached(UserForm user){
		System.out.println("-----------------------==================================================");
		if(user != null){
			monitorRealm.clearCachedAuthorizationInfo(user,seeSession);
		}
	}
	/*
	@Pointcut("execution(* cp.pay.mj.service.IRoleService.saveRole(..))")
	public void groupModifyMethod(){}
	
	@Pointcut("execution(* cp.pay.mj.service.IRoleService.delete(..))")
	public void groupDeleteMethod(){}
	
	@AfterReturning(pointcut="groupModifyMethod() || groupDeleteMethod()", returning="group")
	public void groupClearCached(Group group){
		System.out.println("==============");
		monitorRealm.clearAllCachedAuthorizationInfo();
	}*/
}
