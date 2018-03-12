package cp.pay.mj.action;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import com.google.code.kaptcha.Producer;
import cp.pay.mj.service.account.IUserService;
import cp.pay.mj.utils.Encodes;
@Controller
public class LoginController extends BaseController{

  private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
  @Autowired
  private Producer            captchaProducer;
  @Autowired
  private IUserService        userService;

  @RequestMapping("/captchaImage")
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

    response.setDateHeader("Expires", 0);
    // Set standard HTTP/1.1 no-cache headers.
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
    // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    // Set standard HTTP/1.0 no-cache header.
    response.setHeader("Pragma", "no-cache");
    // return a jpeg
    response.setContentType("image/jpeg");
    // create the text for the image
    String capText = captchaProducer.createText();
    // store the text in the session
    request.getSession().setAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY, capText);
    // create the image with the text
    BufferedImage bi = captchaProducer.createImage(capText);
    ServletOutputStream out = response.getOutputStream();
    // write the data out
    ImageIO.write(bi, "jpg", out);
    try {
      out.flush();
    } finally {
      out.close();
    }
    return null;
  }

  @RequestMapping(value = { "/login" }, method = RequestMethod.GET)
  public String  login() {
	  return "login";
  }


  @RequestMapping(value = { "/login.do" }, method = RequestMethod.POST)
  public String login(@RequestParam(value="loginName") String loginName, @RequestParam(value="loginPwd") String loginPwd,
		  @RequestParam(value="code") String code,HttpServletResponse response, HttpServletRequest request, HttpSession session, RedirectAttributes ra) {
	  session.setMaxInactiveInterval(60*20);
	  String checkCode = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
	  if (StringUtils.isEmpty(code) || !StringUtils.equalsIgnoreCase(code, checkCode)) {
	      // 1验证码不正确
		  ra.addFlashAttribute("msg", "验证码不正确");
	     return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/login";
	  }
	  Subject currentUser = SecurityUtils.getSubject();
      UsernamePasswordToken token = new UsernamePasswordToken(loginName, Encodes.encodeMd5(loginPwd));
      token.setRememberMe(true);
      try {
    	  currentUser.login(token);
      } catch (AuthenticationException e) {
    	  e.printStackTrace();
	      logger.error(e.getMessage(), e);
	      ra.addFlashAttribute("msg", "账户或者密码错误");
		  return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/login";
      }
      boolean validUser = currentUser.isAuthenticated();
      if (validUser) {
//    	try{
//	    	UserForm user = userService.findFormByName(loginName);
//	    	user.setPassword(null);
//	    	session.setAttribute("admin", user);
//    	}catch(Exception e){
//    		
//    	}
        return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/user/index";
	  } else {
	      ra.addFlashAttribute("msg", "当前帐号没有访问系统的权限");
	      return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/login";
	  }
  }

  @RequestMapping(value = { "/error/nopermission" })
  public String noPermission() {
    return "common/noPermission";
  }
 

	@RequestMapping(value = { "/error/explore" })
	  public String noexplore() {
	    return "common/explore";
	  }
	@RequestMapping(value = { "/error/login" })
	public String errorLogin() {
	  return "common/login";
	}
	public static void main(String[] args) {
	}
}
