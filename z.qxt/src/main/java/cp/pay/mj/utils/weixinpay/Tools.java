package cp.pay.mj.utils.weixinpay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletInputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

public class Tools {
	public  static String getContent(HttpResponse response) {
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
	public static String inputStream2String(ServletInputStream in) throws IOException{
			BufferedReader br = new BufferedReader(new InputStreamReader(in));  
            String line = null;  
            StringBuilder sb = new StringBuilder();  
            while ((line = br.readLine()) != null) {  
                sb.append(line);  
            }  
          return sb.toString();
    }
}
