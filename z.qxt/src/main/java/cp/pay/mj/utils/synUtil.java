package cp.pay.mj.utils;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.SocketConfig;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;

public class synUtil {
	private static CloseableHttpClient httpclient=null;
	static {
		PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
		cm.setDefaultMaxPerRoute(10);
		cm.setMaxTotal(10);
		cm.closeExpiredConnections();
		cm.closeIdleConnections(2, TimeUnit.SECONDS);
		SocketConfig cc = SocketConfig.custom().setSoTimeout(3000).build();  
		cm.setDefaultSocketConfig(cc);
		httpclient =HttpClients.custom().setConnectionManager(cm).build();
	}
public static String syn(String str,String http){
	CloseableHttpResponse response=null;
	String lines ="";
	try{
			HttpPost httppost=new HttpPost(http);
			StringEntity entity = new StringEntity(str, "UTF-8");
			httppost.setEntity(entity);
			response=httpclient.execute(httppost);
			lines= getContent(response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(response!=null)
				try {
					response.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	return lines;
}
public static  String getContent(HttpResponse response) {
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
}