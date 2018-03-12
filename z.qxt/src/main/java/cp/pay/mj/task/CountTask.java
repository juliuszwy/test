package cp.pay.mj.task;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cp.pay.mj.domain.log.CountLog;
import cp.pay.mj.service.account.ICountLogService;
import cp.pay.mj.service.account.ILogService;
import cp.pay.mj.utils.JdbcUtil;
@Component("countTask")
public class CountTask {
	@Autowired
	private ILogService logService;
	@Autowired
	private ICountLogService countLogService;
	
    public  void telData()
    {
//    	try {
//        	userCountService.statistics();
//		}catch(Exception e){
//			e.printStackTrace();
    	
//		}
//    	System.out.println("start--------------");
//    	JdbcUtil jbpu = JdbcUtil.getInstance();  
//        Connection conn = null;
//        Connection conn1 = null;
//        PreparedStatement pst = null;  
//        PreparedStatement pst1 = null; 
//        ResultSet rs=null;
//        try {  
//       	 conn = jbpu.getConnection(); 
//       	 conn1 = jbpu.getConnection1();
//       	 int i=7300000;
//       	 pst1 = conn1.prepareStatement("insert into qxt_library(imsi,phone,pro) values(?,?,0)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
//       	 conn1.setAutoCommit(false);
//       	 while (true) {
//       		 boolean flag = false;
//       		 pst = conn.prepareStatement("select imsi,tel from imsi_tel limit "+i+",100000",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
//       		 rs = pst.executeQuery();
//       		 int count = 0;
//       		 System.out.println("ooooooooooo"+System.currentTimeMillis());
//       		 while(rs.next()){
//       			count++;
//       			flag = true;
//   		        String imsi = rs.getString(1);
//   		        String tel = rs.getString(2);
//		            pst1.setString(1, imsi);
//		            pst1.setString(2,tel);
//		            pst1.addBatch();
//		            if(count%200==0)  pst1.executeBatch();
//       		 }
//       		 if(!flag){
//       			 System.out.println("end---------------");
//       			 break;
//       		 }else{
//       			 pst1.executeBatch();  
//    	             conn1.commit();
//    	             i+=100000;
//       		 }
//       	   }
//        }catch(Exception e){
//       	 e.printStackTrace();
//        }
    	FileInputStream fis = null;
    	  InputStreamReader isr = null;
    	  BufferedReader br = null; //用于包装InputStreamReader,提高处理性能。因为BufferedReader有缓冲的，而InputStreamReader没有。
    	  try {
    	   String str = "";
    	   fis = new FileInputStream("/mnt/11.txt");// FileInputStream
    	   // 从文件系统中的某个文件中获取字节
    	    isr = new InputStreamReader(fis);// InputStreamReader 是字节流通向字符流的桥梁,
    	    br = new BufferedReader(isr);// 从字符输入流中读取文件中的内容,封装了一个new InputStreamReader的对象
    		 Connection conn = null;
           PreparedStatement pst = null;  
           JdbcUtil jbpu = JdbcUtil.getInstance();  
           conn = jbpu.getConnection1();
           conn.setAutoCommit(false);
           int count=0;
           pst = conn.prepareStatement("insert into temp(imsi,phone,pro) values(?,?,0)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	           while ((str = br.readLine().trim()) != null) {
	               count++;
	    		   try{
	    			   String imsi = str.substring(0,15);
		    		   String phone = str.substring(16).trim().substring(1).trim();
		    		   if(phone.trim().startsWith("86"))phone = phone.substring(2);
		    		   if((imsi=imsi.trim()).length()!=15||(phone=phone.trim()).length()!=11){
		    			   System.out.println("continue");
		    		 	   continue;
		    		   }
		  	    	   pst.setString(1, imsi);
		  	    	   pst.setString(2, phone);
		  	    	   pst.addBatch();
		  	    	   if(count%1000==0)  pst.executeBatch();
		  	    	   if(count%100000==0)conn.commit();
		  	    	   //pst.execute();
		  	    	   System.out.println(count);
	      	       }catch(Exception ee){
	      	    	   ee.printStackTrace();
	      	       }
	           }
	           pst.executeBatch();
	           conn.commit();
        } catch (FileNotFoundException e) {
    	   System.out.println("找不到指定文件");
    	  } catch (Exception e) {
    		  e.printStackTrace();
    	   System.out.println("读取文件失败");
    	  } finally {
    	   try {
    	     br.close();
    	     isr.close();
    	     fis.close();
    	    // 关闭的时候最好按照先后顺序关闭最后开的先关闭所以先关s,再关n,最后关m
    	   } catch (IOException e) {
    	    e.printStackTrace();
    	   }
    	  }
    }
   
    public  void CountLogDay()
    {
    	try {
    		System.out.println("start-----------------");
    		List<CountLog> list = logService.countLogByDay();
    		countLogService.saveAll(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
