package cp.pay.mj.action;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.service.account.ICountLogService;
@Controller
@RequestMapping("/countLog")
public class CountLogController extends BaseController {
    @Autowired
    private ICountLogService logService;
  
    @RequiresAuthentication
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model,HttpSession session) {
    	User user =(User)session.getAttribute("admin");
    	if(user.getProperty()==1)
    	    return "log/count_agent_list";
    	else
    		return "log/count_list";
	}
	
    @RequiresAuthentication
	@RequestMapping(value = "/list", params = "json")
	@ResponseBody
	public Map<String, Object> queryList(DataGridModel page, HttpServletRequest request) throws Exception {
	    return logService.findLogPageList(page);
	}
    
}
