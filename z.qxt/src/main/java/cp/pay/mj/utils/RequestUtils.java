package cp.pay.mj.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

public class RequestUtils {
	public static String  getPostStr(HttpServletRequest request){
		StringBuffer sb = new StringBuffer() ; 
		try{
		  InputStream is = request.getInputStream();
		  InputStreamReader isr = new InputStreamReader(is);   
		  BufferedReader br = new BufferedReader(isr); 
		  String s = "" ; 
		  while((s=br.readLine())!=null){ 
			  sb.append(s) ; 
		  } 
		  return  sb.toString();
		 }catch (Exception e) {
			 return null;
		}
	}
}
