package cp.pay.mj.utils.qxt;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.util.EntityUtils;
import net.sf.json.JSONObject;
public class QxtUtil {
      public static String getQxtString(String imsi,String imei) {
    	  String mobile = "";
    	  String key="fkuVMcRf";
    	 
    	  String token = "D6YNkM";
    	  String pack = "szhy";
    	  String url="http://cid.rntd.cn/api3";
    	  String param = "Token:"+ token+"; Pack:"+pack+";Content:"; 
    	  JSONObject json = new JSONObject();
    	  json.put("SIM",imsi);
    	  json.put("SDKID", "");
    	  json.put("APPID", imei);
    	  json.put("PType","3");
    	  json.put("Pre", "");
    	  CloseableHttpResponse response = null;
    	  try{
    		  param = param+Des.encryptDES(json.toString(), key);
    		  response  = HttpUtils.post(url, param);
    		  String s = getContent(response);
    		 
    		  if(s!=null&&s.startsWith("Content:")){
    			  s= Des.decryptDES(s.substring(8), key);
    		  }
    		  JSONObject returnJson = JSONObject.fromObject(s);
    		  System.out.println(returnJson+"llllllllllll");
    		  if("0".equals(returnJson.getString("Result"))){
    			  mobile = returnJson.getString("Mobile");
    		  }else
    			  mobile = returnJson.getString("Result");
    	  }catch(Exception e){
    		  
    	  }finally {
    		  if(response!=null)
				try {
					response.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		  }
    	  
    	  return mobile;
      }
      public static String getContent(HttpResponse response) {
  		HttpEntity entity = response.getEntity();
  		byte[] bytes;
  		String content = null;
  		try {
  			bytes = EntityUtils.toByteArray(entity);
  			content = new String(bytes, "UTF8");
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
  		return content;
  	}
      public static void main(String[] args) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("imsi", "460036511132415");
		System.out.println(getQxtString("460036511132415",""));
	}
}

