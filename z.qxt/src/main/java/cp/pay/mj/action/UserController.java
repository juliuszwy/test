package cp.pay.mj.action;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.service.account.IUserService;
import cp.pay.mj.utils.Constants;
import cp.pay.mj.utils.Encodes;
import cp.pay.mj.utils.apk.ApkInfo;
import cp.pay.mj.utils.apk.ApkUtils;
import cp.pay.mj.vo.AjaxCommon;
import cp.pay.mj.vo.UserForm;
import net.sf.json.JSONObject;
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
  @Autowired
  private IUserService userService;
  @RequiresAuthentication
  @RequestMapping(value = "/index")
  public String index(HttpServletRequest request, Model model,HttpSession session) {
	  User user = (User)session.getAttribute("admin");
	  if(user==null||user.getProperty()==null)
		  return "redirect:/login ";
	  ApkInfo info = ApkUtils.generateApkInfo("/mnt/tt.apk", "/usr/bin/");
	  System.out.println(info+"------");
    return "user/index";
  }
  
    @RequiresAuthentication
    @RequestMapping(value = "/home")
    public String home(HttpServletRequest request) {
     return "user/home/home";
    }
  
    @RequiresAuthentication
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
    	return "user/list";
	}
    
    @RequiresAuthentication
   	@RequestMapping(value = "/master/list", method = RequestMethod.GET)
   	public String Masterlist(Model model) {
       	return "user/master_list";
   	}
    
    @RequiresAuthentication
	@RequestMapping(value = "/rePwd")
	public String rePwd(Model model) {
    return "user/rePwd";
	}
	
    @RequiresAuthentication
	@RequestMapping(value = "/list", params = "json")
	@ResponseBody
	public Map<String, Object> queryList(DataGridModel page, User form, HttpServletRequest request) throws Exception {
	    return userService.findUserPageList(page, form);
	}
	
    @RequiresAuthentication
	@RequestMapping(value = "/{id}/edit")
	public String edit(@PathVariable String id,Model model) throws Exception{
		UserForm user  = userService.findById(id);
	 	model.addAttribute("user", user);
	    return "user/input";
	}
	
    @RequiresAuthentication
	@RequestMapping(value = "/add")
	public String add() throws Exception{
	    return "user/input";
	}
    
    @RequiresAuthentication
   	@RequestMapping(value = "/master/{id}/edit")
   	public String Masteredit(@PathVariable String id,Model model) throws Exception{
   		UserForm user  = userService.findById(id);
   	 	model.addAttribute("user", user);
   	    return "user/master_input";
   	}
   	
       @RequiresAuthentication
   	@RequestMapping(value = "/master/add")
   	public String Masteradd() throws Exception{
   	    return "user/master_input";
   	}
	
    @RequiresAuthentication
	@RequestMapping(value = "/repeat")
	@ResponseBody
	public String repeat(@RequestParam String id,@RequestParam String loginName) throws Exception{
		boolean  valid=false;
		User user = userService.findByName(loginName);
		if(user==null||(id!=null&&user.getId().equals(id)))
			valid = true;
	    return "{\"valid\":"+valid+"}";
	}
    
    @RequiresAuthentication
   	@RequestMapping(value = "/pwdRepeat")
   	@ResponseBody
   	public String pwdRepeat(@RequestParam("oldPassword")String oldPassword,HttpSession session) throws Exception{
    	User user = (User)session.getAttribute("admin");
   		boolean  valid=false;
   		if(Encodes.encodeMd5(oldPassword).equals(user.getPassword()))
   			valid = true;
   	    return "{\"valid\":"+valid+"}";
   	}
    
    @RequiresAuthentication
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public String save(UserForm pojo) {
		try{
			userService.save(pojo);
		 }catch(Exception e){
				JSONObject msg = JSONObject.fromObject(Constants.ERROR);
				msg.put("msg", e.toString());
				return  msg.toString();
		 }
	    return Constants.SUCCESS;
	}
    
    @RequiresAuthentication
	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	@ResponseBody
	public String updatePwd(UserForm pojo,HttpSession session) {
		try{
			User user = (User)session.getAttribute("admin");
			user.setPassword(Encodes.encodeMd5(pojo.getPassword()));
			userService.updatePwd(user);
		 }catch(Exception e){
			 e.printStackTrace();
			 JSONObject msg = JSONObject.fromObject(Constants.ERROR);
			 msg.put("msg", e.toString());
			 return  msg.toString();
		 }
	    return Constants.SUCCESS;
	}
   
    @RequiresAuthentication
    @RequestMapping(value = "/info")
    public String info(HttpSession session) {
    	return"user/info";
    }
   
    @RequiresAuthentication
    @RequestMapping(value = "/token")
    public void token(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
	        response.setContentType("application/force-download");// 设置强制下载不打开
	        response.addHeader("Content-Disposition",
                          "attachment;fileName=token" );// 设置文件名
	        try {
	        	  User user = (User)session.getAttribute("admin");
                  PrintWriter pw = response.getWriter();
                  pw.println("token:"+user.getToken());
                  pw.println("deskey:"+user.getDesKey());
              } catch (Exception e) {
                  // TODO: handle exception
                 e.printStackTrace();
              } finally {
                 
              }
		}
    @RequiresAuthentication
    @RequestMapping(value = "/token_name")
    @ResponseBody
    public List<AjaxCommon> token_name() {
	      return userService.findnameWithToken();
	}
}
