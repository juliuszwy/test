package cp.pay.mj.action;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;

import cp.pay.mj.utils.weixinpay.WeixinPay;

public  class BaseController {
  @SuppressWarnings("unused") 
  private static final long           serialVersionUID = -6717429260246106572L;

  private String                      message;                                                      
  
  @Value("#{configProperties['realm.name']}")
  public  String realName ;
  
  @Value("#{configProperties['md5.key']}")
  public String md5Key ;
  
  @Value("#{configProperties['md5.key1']}")
  public String md5Key1 ;
  
  @Value("#{configProperties['aes.key']}")
  public String aes ;
  
  @Value("#{configProperties['aes.key1']}")
  public String aes1 ;
  
  
  public  boolean judgeMd5(Map<String, String> params, String paternerKey) throws UnsupportedEncodingException {  
	  boolean flag = false;
	  try{
		  String sign = params.remove("sign");
		  System.out.println(sign+"-------");
		  if(sign!=null) {
			  String string1 = WeixinPay.createSign(params, false)+"&key=" + paternerKey;  
			  String v = DigestUtils.md5Hex(string1); 
			  System.out.println(v);
			  if(sign.equals(v)) flag = true;
		  }
	  }catch(Exception e){
		  
	  }
      return flag;  
  }
  public String getServerAddress(HttpServletRequest re) {
	return createServerString(re);
}
  
  public static String createServerString(HttpServletRequest request) {
	    return createServerString(request.getScheme(), request.getServerName(), request.getServerPort());
	  }

	  public static String createServerString(String scheme, String server, int port)
	  {
	    StringBuilder url = new StringBuilder();

	    if (port < 0) {
	      port = 80;
	    }

	    url.append(scheme);
	    url.append("://");
	    url.append(server);

	    if (((scheme.equals("http")) && (port != 80)) || ((scheme.equals("https")) && (port != 443))) {
	      url.append(":");
	      url.append(port);
	    }

	    return url.toString();
	  }
  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
    
  }
  
  
  
//  public void setPageInfo(DataGridModel pageInfo) {
//    this.pageInfo = pageInfo;
//  }
//  void initPage(DataGridModel page,int totalRows){
//	  page = (page == null ? new DataGridModel() : page);
//	  page.setCurrentRow(0);
//	  page.setPage(1);
//  }
}
