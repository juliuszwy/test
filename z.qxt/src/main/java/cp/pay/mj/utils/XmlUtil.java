package cp.pay.mj.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLDecoder;

import org.apache.log4j.Logger;
import org.aspectj.weaver.patterns.WildAnnotationTypePattern;

import com.thoughtworks.xstream.XStream;

public class XmlUtil {
	
	private static Logger logger = Logger.getLogger(XmlUtil.class);
	
	public static Object loadFromXML(File src, Class clazz) {
		XStream xtream = XstreamUtils.getXstream(clazz);
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(src);
			return xtream.fromXML(inputStream);
		} catch (Exception e) {
			logger.error("readSynchrodataSetup loadXML", e);
//			e.printStackTrace();
		}
		return null;
	}
	
	
	public static boolean convertToXML(Writer outputStream, Object obj) {
		XStream xtream = XstreamUtils.getXstream(obj.getClass(), false);
		try {
			xtream.toXML(obj, outputStream);
			return true;
		} catch (Exception e) {
			logger.error("readSynchrodataSetup loadXML", e);
			return false;
		}
	}
	
//	<setup>
//	<avail>1</avail>
//	<rules>001001</rules>
//	<circleNum>循环次数</circleNum>
//	<dayPush>每天推送次数</dayPush>
//	<startDate>第一次推送延迟天数</startDate>
//	<safety>0-5</safety>
//	<deny_cities>不push的城市</deny_cities>
//	<deny_companies>不push的手机厂商</deny_companies>
//</setup>
//<product>
//	<type></type> url apk
//	<name></name>
//	<descr></descr>
//	<url></url>  
//	<imageUrl></imageUrl>
//	<apk-md5></md5>
//	<apk-downloadUrl></downloadUrl>
//	<apk-packageName></packageName>
//	<apk-version></version>
//</product>
	
	public static void main(String[] args) {
//		Map<String, String> products = new HashMap<String, String>();
//		Map<String, String> setup = new HashMap<String, String>();
//		setup.put("avail", "1");
//		setup.put("rules", "0001");
//		setup.put("circleNum", "20");
//		products.put("type", "apk");
//		products.put("name", "chanpin1");
//		products.put("md5", "112334");
//		products.put("url", "http://www.1.com");
//		products.put("packageName", "com.sztpad.qnm");
//		products.put("version", "v1.0.0");
//		EpushDeploy deploy = new EpushDeploy(setup, products);
//		XStream xtream = XstreamUtils.getXstream(EpushDeploy.class);
//		try {
//			System.out.println(xtream.toXML(deploy));
//		} catch (Exception e) {
//			logger.error("readSynchrodataSetup loadXML", e);
////			e.printStackTrace();
//		}
	}
	
}
