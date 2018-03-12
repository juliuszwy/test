package cp.pay.mj.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class MyExceptionHandler implements HandlerExceptionResolver {  
  
     public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,  
             Exception ex) {  
    	 ex.printStackTrace();
    	 Map<String, Object> model = new HashMap<String, Object>();  
         model.put("ex", ex);  
        // 根据不同错误转向不同页面  
         if(ex instanceof ServiceException) {  
             return new ModelAndView("redirect:/error/explore", model);  
         }else if(ex instanceof UnauthorizedException){  
        	 return new ModelAndView("redirect:/error/nopermission", model);  
         } else if(ex instanceof AuthorizationException){
        	 ModelAndView mv = new ModelAndView("redirect:/error/login", model);
        	 return mv;
         }else{
        	 return new ModelAndView("common/noPermission", model);  
         }
       } 
 }
