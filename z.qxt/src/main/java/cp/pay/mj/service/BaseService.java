package cp.pay.mj.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cp.pay.mj.domain.account.User;

@Service("baseService")
public class  BaseService {
	@Autowired
	protected  HttpServletRequest request;
	
	protected User getUser(){
		return (User)request.getSession().getAttribute("admin");
	}


}
