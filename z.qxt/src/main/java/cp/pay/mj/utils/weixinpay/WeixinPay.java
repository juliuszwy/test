package cp.pay.mj.utils.weixinpay;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.methods.CloseableHttpResponse;

import com.alibaba.fastjson.JSONObject;

import cp.pay.mj.utils.Encodes;
import cp.pay.mj.utils.HttpUtils;
import cp.pay.mj.utils.StringUtil;

public class WeixinPay{
	 private static final String DELIVERNOTIFY_URL = "https://api.weixin.qq.com/pay/delivernotify?access_token=";  
	    /** 
	     * 构造签名 
	     * @param params 
	     * @param encode 
	     * @return 
	     * @throws UnsupportedEncodingException  
	     */  
	    public static String createSign(Map<String, String> params, boolean encode) throws UnsupportedEncodingException {  
	        Set<String> keysSet = params.keySet();  
	        Object[] keys = keysSet.toArray();  
	        Arrays.sort(keys);  
	        StringBuffer temp = new StringBuffer();  
	        boolean first = true;  
	        for (Object key : keys) {  
	            if (key == null || StringUtil.isEmpty(params.get(key))) // 参数为空参与签名  
	               continue;  
	            if (first) {  
	                first = false;  
	            } else {  
	                temp.append("&");  
	            }  
	            temp.append(key).append("=");  
	            Object value = params.get(key);  
	            String valueString = "";  
	            if (null != value) {  
	                valueString = value.toString();  
	            }  
	            if (encode) {  
	                temp.append(URLEncoder.encode(valueString, "UTF-8"));  
	            } else {  
	                temp.append(valueString);  
	            }  
	        }  
	        return temp.toString();  
	    }  
	  
	    /** 
	     * @param params 
	     * @param paternerKey 
	     * @return 
	     * @throws UnsupportedEncodingException  
	     */  
	    private static String packageSign(Map<String, String> params, String paternerKey) throws UnsupportedEncodingException {  
	        String string1 = createSign(params, false);  
	        String stringSignTemp = string1 + "&key=" + paternerKey;  
	        String signValue = DigestUtils.md5Hex(stringSignTemp).toUpperCase();  
	        String string2 = createSign(params, true);  
	        return string2 + "&sign=" + signValue;  
	    }  
	   
}
