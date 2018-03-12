package cp.pay.mj.action;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.service.account.ILogService;
@Controller
@RequestMapping("/log")
public class LogController extends BaseController {
    @Autowired
    private ILogService logService;
  
    @RequiresAuthentication
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
    	return "log/list";
	}
	
    @RequiresAuthentication
	@RequestMapping(value = "/list", params = "json")
	@ResponseBody
	public Map<String, Object> queryList(DataGridModel page, HttpServletRequest request) throws Exception {
	    return logService.findLogPageList(page);
	}
    
}
