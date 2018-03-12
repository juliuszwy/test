package cp.pay.mj.utils;

import java.io.File;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * 封装各种格式的编码解码工具类.
 * 
 * 1.Commons-Codec的 hex/base64 编码
 * 2.自行编写的，将long进行base62编码以缩短其长度
 * 3.Commons-Lang的xml/html escape
 * 4.JDK提供的URLEncoder
 * 
 */
public class CommonUtil {
	//发送邮件
	public static void sendMail( 
            String[] toMail,  
            String mailTitle,  
            String mailContent,File[] files) throws Exception {  
	    	Properties properties = new Properties();
	    	properties.put("mail.smtp.host", "smtp.163.com");//发送邮件协议
	    	properties.put("mail.smtp.port", 25);  
	    	properties.put("mail.transport.protocol", "smtp");//发送邮件协议
	    	properties.put("mail.smtp.auth", "true");//需要验证
	    	Session session = Session.getInstance(properties);
	    	session.setDebug(true);//debug模式
			MimeMessage message = new MimeMessage(session);//由邮件会话新建一个消息对象  
			message.setFrom(new InternetAddress("18621319734@163.com"));//设置发件人的地址  
			Address[] ads = new InternetAddress[toMail.length];
			for(int i=0;i<toMail.length;i++){
				ads[i] = new InternetAddress(toMail[i]);
			}
			
			message.setRecipients(Message.RecipientType.TO, ads);
			//message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));//设置收件人,并设置其接收类型为TO  
			message.setSubject(mailTitle);//设置标题  
			Multipart multipart = new MimeMultipart();
			 for (int i = 0; i < files.length; i++) {  
				 BodyPart messageBodyPart = new MimeBodyPart();  
					DataSource source = new FileDataSource(files[i]);
					//DataSource source = new 
					messageBodyPart.setDataHandler(new DataHandler(source));
					         //附件中文显示编码
					sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
					messageBodyPart.setFileName("=?UTF-8?B?"+enc.encode("test".getBytes())+"?=");
					multipart.addBodyPart(messageBodyPart);
		        }  
			//设置信件内容  
			//message.setText(mailContent); //发送 纯文本 邮件 todo  
			message.setContent(multipart); //发送HTML邮件，内容样式比较丰富  
			message.setSentDate(new Date());//设置发信时间  
			message.saveChanges();//存储邮件信息  
			//发送邮件  
			//Transport transport = session.getTransport("smtp");  
			Transport transport = session.getTransport();  
			transport.connect("18621319734@163.com", "vhposlnhdlseltyg");
			transport.sendMessage(message, message.getAllRecipients());//发送邮件,其中第二个参数是所有已设好的收件人地址  
			transport.close();  
    }  
}
