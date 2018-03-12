package cp.pay.mj.action;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import cp.pay.mj.cache.UserKeyCache;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.domain.log.RequestLog;
import cp.pay.mj.service.account.ILibraryService;
import cp.pay.mj.service.account.ILogService;
import cp.pay.mj.utils.qxt.Des;
import cp.pay.mj.utils.qxt.QxtUtil;
import net.rubyeye.xmemcached.MemcachedClient;
@Controller
@RequestMapping("/business")
public class BusinessControler extends BaseController {
  @Autowired
  private MemcachedClient memcachedClient;
  @Autowired
  private ILibraryService libraryService;
  @Autowired
  private ILogService logService;
  
  @RequestMapping(value = "/api" ,method=RequestMethod.POST)
  @ResponseBody
  public String api(HttpServletRequest request, Model model,HttpSession session) throws Exception {
	  Long startTime = System.currentTimeMillis();
	  int result = 0;
	  String wr = "0";
	  String spCode = "";
	  RequestLog log = new RequestLog();
	  JSONObject returnData = new JSONObject();
	  String deskey="";
	  try { 
		    ServletInputStream in = request.getInputStream();
		    StringBuilder content = new StringBuilder();
			byte[] b = new byte[1024];
			int lens = -1;
			while ((lens = in.read(b)) > 0) {
				content.append(new String(b, 0, lens));
			}
			String data = content.toString();// 内容	
			//System.out.println(data+"000000000");
			if(!data.contains("Token")||!data.contains("Content"))
				return"";
			String[] sss = data.split(";");
			String token="";
			String dataDes = "";
			for(String s:sss){
				String[] ss = s.split(":");
				if(ss[0].equals("Token")){
					token = ss[1];
				}else if(ss[0].equals("Content")){
					dataDes = ss[1];
				}
			}
			//System.out.println(token);
			//System.out.println(dataDes);
			
			log.setToken(token);
			User user = UserKeyCache.getInstance().getKeyByToken(token);
			if(user==null){
				result = 101;
				return "{\"result\":101}";
			}
			deskey = user.getDesKey();
			//System.out.println(deskey);
			String d1 = Des.decryptDES(dataDes,deskey);
			JSONObject json = JSONObject.parseObject(d1);
			String imsi = json.getString("imsi");
			String imei = json.getString("imei");
			String cpmid = json.getString("cpmid");
			String yl = json.getString("yl");	
			log.setCpmid(cpmid);
			log.setYl(yl);
			log.setImsi(imsi);
			log.setImei(imei);
			
			if(user.getApiStatus()==1){
				result = 102;
				return "{\"result\":102}";
			}
			if(imsi==null||imsi.length()!=15||!imsi.startsWith("460")){
				result = 103;
				return "{\"result\":103}";
			}
			String tel = memcachedClient.get(imsi);
			//System.out.println(tel+"l");
			if(tel==null||tel.length()!=11){
				tel = libraryService.getTelByImsi(imsi);
				System.out.println(tel+"ll");
				if(tel==null||tel.length()!=11){
					if(memcachedClient.get("NO_IMSI_"+imsi)==null){
						wr = "1";
						tel = QxtUtil.getQxtString(imsi,imei);
						System.out.println(tel+"lll");
						if(tel==null||tel.length()!=11){
							result=105;
							spCode = tel;
							if("-5".equals(spCode)){
								addNoTelInMemcache(imsi);
							}
						}else{
							//System.out.println("3");
							spCode = "0";
							returnData.put("tel", tel);
							addTelInMemcache(imsi,tel);
							libraryService.inserData(imsi,tel,0);
						}	
					}else{
						result=106;
					}
				}else{
					//System.out.println("2");
					returnData.put("tel", tel);
					addTelInMemcache(imsi,tel);
				}
			}else{
				System.out.println("1");
				returnData.put("tel", tel);
			}
		} catch (Exception e) {
			if(result==0)result =  100;
		}
	  returnData.put("result", result);
	  if(result == 0||result>101){
		  log.setSpCode(spCode);
		  log.setStatus(result);
		  log.setCode(wr);
		  log.setPhone(returnData.getString("tel")==null?"":returnData.getString("tel"));
		  log.setHandleTime(System.currentTimeMillis()-startTime);
		  
		  try{
			  logService.insertLog(log);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  return Des.encryptDES(returnData.toJSONString(), deskey);
	  }else
		  return "";
	 
	  
	 
  }
  public void addTelInMemcache(String imsi,String tel){
	  try {
		memcachedClient.set(imsi, 0, tel);
	  } catch (Exception e) {
		// TODO: handle exception
	  }
   }
  public void addNoTelInMemcache(String imsi){
	  try {
		memcachedClient.set("NO_IMSI_"+imsi,24*60*60, 0);
	  } catch (Exception e) {
		// TODO: handle exception
	  }
   }
}
