package cp.pay.mj.action;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cp.pay.mj.cache.UserKeyCache;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.service.account.IUserService;
@Controller
@RequestMapping("/common")
public class CommonControler extends BaseController {
	@Value("#{configProperties['down.mj.apk.file']}")
	public String realPath;
	@Value("#{configProperties['down.mj.apk.fileName']}")
	public String fileName;
	@Autowired
	private IUserService userService;
	/**
	 2      * 文件下载
	 3      * @Description: 
	 4      * @param fileName
	 5      * @param request
	 6      * @param response
	 7      * @return
	 8      */
	 @RequestMapping("/download/mjapk")
	 public String downloadFile(HttpServletRequest request, HttpServletResponse response) {
	             File file = new File(realPath, fileName);
	            if (file.exists()) {
	                 response.setContentType("application/force-download");// 设置强制下载不打开
	                 response.addHeader("Content-Disposition",
	                         "attachment;fileName=" + fileName);// 设置文件名
	                byte[] buffer = new byte[1024];
	                FileInputStream fis = null;
	                BufferedInputStream bis = null;
	                 try {
	                    fis = new FileInputStream(file);
	                    bis = new BufferedInputStream(fis);
	                    OutputStream os = response.getOutputStream();
	                    int i = bis.read(buffer);
	                    while (i != -1) {
	                        os.write(buffer, 0, i);
	                         i = bis.read(buffer);
	                     }
	                } catch (Exception e) {
	                    // TODO: handle exception
	                     e.printStackTrace();
	                } finally {
	                    if (bis != null) {
	                         try {
	                            bis.close();
	                        } catch (IOException e) {
	                           // TODO Auto-generated catch block
	                             e.printStackTrace();
	                         }
	                    }
                    if (fis != null) {
	                        try {
	                            fis.close();
	                         } catch (IOException e) {
	                             // TODO Auto-generated catch block
	                             e.printStackTrace();
	                        }
	                     }
	                 }
	             }
	         return null;
	     }
    @PostConstruct
    public void init(){
    	System.out.println("1111");
    	
    	List<User> users = userService.findMasterAll();
    	for(User u:users){
    		UserKeyCache.getInstance().addKey(u.getToken(), u);
    	}
    	System.out.println("22222");
    }
}
