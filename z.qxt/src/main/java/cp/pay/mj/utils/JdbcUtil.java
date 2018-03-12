package cp.pay.mj.utils;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;  
import org.apache.log4j.Logger;
  
/** 
 *  
 */  
public class JdbcUtil {  
    private static String filePath = "jdbc.properties";   
    private static JdbcUtil instance = null;  
    private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());
    public JdbcUtil() {  
        super();  
    }  
      
    public static JdbcUtil getInstance() {  
        if (instance == null) {  
            synchronized (JdbcUtil.class) {  
                if (instance == null) {  
                    instance = new JdbcUtil();  
                }  
            }  
        }  
        return instance;  
    }  
         
    public static Properties readPropertiesFile(){  
        String realFilePath = Thread.currentThread().getContextClassLoader().getResource("").getPath()+filePath;   
        Properties pros = new Properties();    
        try {    
            InputStream is = new BufferedInputStream(new FileInputStream(realFilePath));    
            pros.load(is);   
        } catch (Exception e) {    
        	logger.error(e); 
        }  
        return pros;  
    }   
   
    static{  
        Properties pros = readPropertiesFile();  
        String className = (String) pros.get("className");  
        try {  
            Class.forName(className).newInstance();  
        } catch (Exception e) {  
        	logger.error(e); 
        }   
    }  
   
    public Connection getConnection(){  
        Properties pros = readPropertiesFile();  
        String url = (String) pros.get("url");  
        String user = (String) pros.get("user");  
        String password = (String) pros.get("password");  
        Connection conn = null;  
        try {  
            conn = DriverManager.getConnection(url,user,password);  
        } catch (Exception e) {  
        	logger.error("获取连接",e);  
        }  
        return conn;  
    } 
    public Connection getConnection1(){  
        Properties pros = readPropertiesFile();  
        String url = (String) pros.get("url1");  
        String user = (String) pros.get("user1");  
        String password = (String) pros.get("password1");  
        Connection conn = null;  
        try {  
            conn = DriverManager.getConnection(url,user,password);  
        } catch (Exception e) {  
        	logger.error("获取连接",e);  
        }  
        return conn;  
    } 
         
    public void close(ResultSet rs,Statement st,Connection conn){
    	if(rs!=null){
    		 try {  
                 rs.close();  
             } catch (SQLException e) {  
             	logger.error("关闭连接",e);    
             }
    	}
    	if(st!=null){
                try {  
                    st.close();  
                } catch (SQLException e) {  
                	logger.error("st连接",e);   
                } 
    		}
    		if(conn!=null){
    			try {  
                    conn.close();  
                } catch (SQLException e) {  
                	logger.error("conn连接",e);  
                }  
        	}
       /* if(rs != null){  
            try {  
                rs.close();  
            } catch (SQLException e) {  
            	logger.error("关闭连接",e);    
            } finally{  
                if(st != null){  
                    try {  
                        st.close();  
                    } catch (SQLException e) {  
                    	logger.error("st连接",e);   
                    } finally{  
                        if(conn != null){  
                            try {  
                                conn.close();  
                            } catch (SQLException e) {  
                            	logger.error("conn连接",e);  
                            }  
                        }  
                    }  
                }  
            }  
        }  */
    }  
  
  
    public void execute(String sql) {  
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;  
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection();  
            conn.setAutoCommit(false);  
            pst = conn.prepareStatement(sql);  
            pst.executeUpdate();  
            conn.commit();  
        } catch (Exception e) {  
            try {  
                conn.rollback();  
            } catch (SQLException e1) {  
            	  logger.error("插入渠道rollback error----------------");  
            }  
          
        } finally{ 
        	try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				
			}
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);   
        }  
    } 
    public boolean checkParms(Map<String,String> params){
    	if(params.get("chid")!=null&&
    			params.get("distro")!=null&&params.get("carrier")!=null){
		String imei = params.get("imei");
		if(imei!=null&&imei.length()>32)
			params.put("imei", imei.trim().substring(0,32));
		return true;
    	}
    	return false;
    }
    public boolean checkMoParms(Map<String,String> params){
    	if(params.get("chid")!=null&&
    			params.get("distro")!=null&&params.get("carrier")!=null&&params.get("appid")!=null){
		String imei = params.get("imei");
		if(imei!=null&&imei.length()>32)
			params.put("imei", imei.trim().substring(0,32));
		if(params.get("pkg")!=null&&params.get("pkg").length()>15){
			params.put("pkg", params.get("pkg").trim().substring(0,15));
		}
		return true;
    	}
    	return false;
    }
    public boolean checkInstallParms(Map<String,String> params){
    	if(params.get("distro")!=null&&params.get("carrier")!=null){
    		String imei = params.get("imei");
    		if(imei!=null&&imei.length()>32)
    			params.put("imei", imei.trim().substring(0,32));
    		if(params.get("pkg")!=null&&params.get("pkg").length()>15){
    			params.put("pkg", params.get("pkg").trim().substring(0,15));
    		}
        	return true;
    	}
    	return false;
    }
    
    @SuppressWarnings("finally")
    public boolean executeCpMo(String sql,List<Map<String,String>> params) {
    	SimpleDateFormat  sdf =new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;
        boolean flag = false;
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection();  
            conn.setAutoCommit(false);  
            pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            int  count=0;
            for(Map<String,String> param:params){
            	Integer pro = -1;
            	if(checkMoParms(param)){
            	count++;
	            pst.setInt(1,0);
	            pst.setString(2, param.get("chid"));
	            pst.setString(3, param.get("appid"));
	            pst.setString(4, param.get("appver")==null?"":param.get("appver"));
	            //pst.setString(4, param.get("model")==null?"":param.get("model"));
	            pst.setString(5, param.get("carrier"));
	            try{
	            	pro = Integer.parseInt(param.get("pro"));
	            }catch (Exception e) {
				}
	            //pst.setString(5, param.get("model")==null?"":param.get("model"));
	            pst.setString(6,param.get("channelid")==null?"":param.get("channelid"));
	            pst.setInt(7, 0);
	            pst.setString(8, param.get("orderNo"));
	            pst.setTimestamp(9, new Timestamp(sdf.parse(param.get("date")).getTime()));
	            pst.setString(10, param.get("distro"));
	            pst.setString(11, param.get("imei"));
	            pst.setString(12, param.get("imsi")==null?"":param.get("imsi"));
	            pst.setInt(13, 0);
	            pst.setString(14, param.get("mobile")==null?"":param.get("mobile"));
	            pst.setString(15, param.get("osbuild")==null?"":param.get("osbuild"));
	            pst.setString(16, param.get("net")==null?"":param.get("net"));
	            String linkId = param.get("linkid");
	            if(StringUtil.isEmpty(linkId)||linkId.equals("null"))
	            	linkId = String.valueOf((new Date().getTime()))+Encodes.createPassword(6);
	            pst.setString(17, linkId);
	            pst.setString(18, param.get("price")==null?"0":param.get("price"));
	            pst.setInt(19,pro);
	            pst.setString(20, param.get("res")==null?"":param.get("res"));
	            pst.setString(21, param.get("sc")==null?"":param.get("sc"));
	            pst.setInt(22, Integer.valueOf(param.get("succeed")));
	            pst.setString(23, param.get("fm")==null?"":param.get("fm"));
	            pst.setString(24, param.get("errcode")==null?"":param.get("errcode"));
	            pst.setString(25, param.get("pkg")==null?"":param.get("pkg"));
	            pst.setString(26, param.get("sdkver")==null?"":param.get("sdkver"));
	            pst.setString(27, param.get("info")==null?"":param.get("info"));
	            pst.addBatch();
	            if(count%500==0)  pst.executeBatch(); 
	            }
            }
            if(count>0){
	            pst.executeBatch();  
	            conn.commit();
	            flag=true;
            }
        } catch (Exception e) {  
        	logger.error("插入数据：",e);  
        	conn.rollback();
            e.printStackTrace();  
        } finally{
        	try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);  
            return flag;
        }  
    }
    @SuppressWarnings("finally")
    public boolean executeAppInstall(String sql,List<Map<String,String>> params) {
    	System.out.println("执行安装install-----------------");
    	SimpleDateFormat  sdf =new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;
        boolean flag = false;
       
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection();  
            conn.setAutoCommit(false);  
            pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            int  count=0;
            for(Map<String,String> param:params){
            	Integer pro = -1;
            	if(checkInstallParms(param)){
            	count++;
	            pst.setInt(1,0);
	            pst.setString(2, param.get("appid"));
	            pst.setString(3, param.get("appver")==null?"":param.get("appver"));
	            //pst.setString(4, param.get("model")==null?"":param.get("model"));
	            pst.setString(4, param.get("carrier"));
	            try{
	            	pro = Integer.parseInt(param.get("pro"));
	            }catch (Exception e) {
				}
	            //pst.setString(5, param.get("model")==null?"":param.get("model"));
	            pst.setTimestamp(5, new Timestamp(sdf.parse(param.get("date")).getTime()));
	            pst.setString(6, param.get("distro"));
	            pst.setString(7, param.get("imei"));
	            pst.setString(8, param.get("imsi")==null?"":param.get("imsi"));
	            pst.setString(9, param.get("mobile")==null?"":param.get("mobile"));
	            pst.setString(10, param.get("osbuild")==null?"":param.get("osbuild"));
	            pst.setString(11, param.get("net")==null?"":param.get("net"));
	            pst.setInt(12,pro);
	            pst.setString(13, param.get("res")==null?"":param.get("res"));
	            pst.setString(14, param.get("sc")==null?"":param.get("sc"));
	            pst.setString(15, param.get("fm")==null?"":param.get("fm"));
	            pst.setString(16, param.get("pkg")==null?"":param.get("pkg"));
	            pst.setString(17, param.get("lac")==null?"":param.get("lac"));
	            pst.setString(18, param.get("iccid")==null?"":param.get("iccid"));
	            pst.setString(19, param.get("cellid")==null?"":param.get("cellid"));
	            pst.setString(20, param.get("sdkver")==null?"":param.get("sdkver"));
	            pst.setString(21, param.get("info")==null?"":param.get("info"));
	            pst.addBatch();
	            }
	            if(count%500==0)  pst.executeBatch(); 
            }
            if(count>0){
	            pst.executeBatch();  
	            conn.commit();
	            flag=true;
            }
        } catch (Exception e) {  
        	logger.error("插入数据：",e);  
        	conn.rollback();
        	e.printStackTrace();  
        } finally{
        	try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);  
            return flag;
        }  
    }
    @SuppressWarnings("finally")
    public boolean executeCpRequest(String sql,List<Map<String,String>> params) {
    	SimpleDateFormat  sdf =new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;
        boolean flag = false;
       
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection();  
            conn.setAutoCommit(false);  
            pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            int  count=0;
            for(Map<String,String> param:params){
            	Integer pro = -1;
            	if(checkParms(param)){
            	count++;
	            pst.setInt(1,0);
	            pst.setString(2, param.get("chid"));
	            pst.setString(3, param.get("appid"));
	            pst.setString(4, param.get("appver")==null?"":param.get("appver"));
	            //pst.setString(4, param.get("model")==null?"":param.get("model"));
	            pst.setString(5, param.get("carrier"));
	            try{
	            	pro = Integer.parseInt(param.get("pro"));
	            }catch (Exception e) {
				}
	            //pst.setString(5, param.get("model")==null?"":param.get("model"));
	            pst.setString(6,param.get("channelid")==null?"":param.get("channelid"));
	            pst.setInt(7, 0);
	            pst.setTimestamp(8, new Timestamp(sdf.parse(param.get("date")).getTime()));
	            String errMsg = param.get("errMsg");
	            if(errMsg==null)errMsg="";
	            else{
	            	if(errMsg.length()>50){
	            		errMsg.substring(0,49);
	            	}
	            }
	            pst.setString(9, errMsg);
	            pst.setString(10, param.get("execCode"));
	            pst.setString(11, param.get("distro"));
	            pst.setString(12, param.get("imei"));
	            pst.setString(13, param.get("imsi")==null?"":param.get("imsi"));
	            pst.setString(14, param.get("mobile")==null?"":param.get("mobile"));
	            pst.setString(15, param.get("osbuild")==null?"":param.get("osbuild"));
	            pst.setString(16, param.get("net")==null?"":param.get("net"));
	            pst.setString(17, param.get("linkid").equals("")?String.valueOf((new Date().getTime()))+Encodes.createPassword(6): param.get("linkid"));
	            pst.setString(18, param.get("price")==null?"0":param.get("price"));
	            pst.setInt(19,pro);
	            pst.setString(20, param.get("requestCount"));
	            pst.setString(21, param.get("res")==null?"":param.get("res"));
	            pst.setString(22, param.get("sc")==null?"":param.get("sc"));
	            pst.setString(23, param.get("fm")==null?"":param.get("fm"));
	            pst.setString(24, param.get("lac")==null?"":param.get("lac"));
	            pst.setString(25, param.get("iccid")==null?"":param.get("iccid"));
	            pst.setString(26, param.get("cellid")==null?"":param.get("cellid"));
	            String command = new String(Encodes.decodeBase64(param.get("command")==null?"":param.get("command")));
	            if(command.length()>200)
	            	command = command.substring(0, 200);
	            pst.setString(27, command);
	            pst.setString(28, param.get("port"));
	            pst.setString(29, param.get("sdkver")==null?"":param.get("sdkver"));
	            pst.setString(30, param.get("bijectionSign")==null?"":param.get("bijectionSign"));
	            pst.setString(31, param.get("ip")==null?"":param.get("ip"));
	            pst.addBatch();
	            }
	            if(count%500==0)  pst.executeBatch(); 
            }
            if(count>0){
	            pst.executeBatch();  
	            conn.commit();
	            flag=true;
            }
        } catch (Exception e) {  
        	logger.error("插入数据：",e);  
        	conn.rollback();
            e.printStackTrace();  
        } finally{
        	try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);  
            return flag;
        }  
    }
    
    @SuppressWarnings("finally")
    public boolean executeAreaSubmit(String sql,List<Map<String,String>> params) {
    	SimpleDateFormat  sdf =new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;
        boolean flag = false;
       
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection();  
            conn.setAutoCommit(false);  
            pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            int  count=0;
            for(Map<String,String> param:params){
            	Integer pro = -1;
            	Integer status1 = 1;
            	Integer status2=1;
            	count++;
	            pst.setInt(1,0);
	            pst.setString(2, param.get("carrier")==null?"":param.get("carrier"));
	            pst.setTimestamp(3, new Timestamp(sdf.parse(param.get("date")).getTime()));
	            pst.setString(4, param.get("imsi")==null?"":param.get("imsi"));
	            String msg =  "";
	            pst.setString(5, msg);
	            try{
	            	pro = Integer.parseInt(param.get("pro"));
	            }catch (Exception e) {
				}
	            //pst.setString(5, param.get("model")==null?"":param.get("model"));
	            pst.setString(6,param.get("port")==null?"":param.get("port"));
	            pst.setInt(7, pro);
	            pst.setInt(8, status1);
	            pst.setInt(9, status2);
	            pst.setString(10, "");
	            pst.setString(11, param.get("sendorder")==null?"":param.get("sendorder"));
	            pst.addBatch();
	            }
	            if(count%500==0)  pst.executeBatch(); 
            if(count>0){
	            pst.executeBatch();  
	            conn.commit();
	            flag=true;
            }
        } catch (Exception e) {  
        	logger.error("插入数据：",e);  
        	conn.rollback();
            e.printStackTrace();  
        } finally{
        	try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);  
            return flag;
        }  
    }
    @SuppressWarnings("finally")
    public boolean executeAreaClientSubmit(String sql,List<Map<String,String>> params) {
    	SimpleDateFormat  sdf =new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;
        boolean flag = false;
       
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection();  
            conn.setAutoCommit(false);  
            pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            int  count=0;
            for(Map<String,String> param:params){
            	Integer status = 1;
            	count++;
	            pst.setInt(1,0);
	            pst.setString(2, param.get("sendmsgorder"));
	            pst.setTimestamp(3, new Timestamp(sdf.parse(param.get("date")).getTime()));
	            pst.setString(4, param.get("imsi")==null?"":param.get("imsi"));
	            try{
	            	status = Integer.parseInt(param.get("status"));
	            }catch (Exception e) {
				}
	            pst.setInt(5, status);
	            
	            pst.addBatch();
	            }
	            if(count%500==0)  pst.executeBatch(); 
            if(count>0){
	            pst.executeBatch();  
	            conn.commit();
	            flag=true;
            }
        } catch (Exception e) {  
        	logger.error("插入数据：",e);  
        	conn.rollback();
            e.printStackTrace();  
        } finally{
        	try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);  
            return flag;
        }  
    }
    
   /* @SuppressWarnings("finally")
    public  Map<String,String> getAllAppIdAndSerialNo() {
    	Connection conn = null;
		Map<String,String> maps = new HashMap<String, String>();
		try {
			conn = JdbcUtil.getInstance().getConnection();
			conn.setAutoCommit(false);
            String sql = "SELECT name,price_name,request_type,suc_sign,suc_name,paycode_name,sp_id,return_type,return_line,bijection_name,error_code,info,phone from syn_configuration ";
            PreparedStatement prest = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs  = prest.executeQuery();
            while(rs.next()){
            	SynBean bean = new SynBean();
            	bean.setName(rs.getString("name"));
            	bean.setPriceName(rs.getString("price_name"));
            	bean.setRequestType(rs.getInt("request_type"));
            	bean.setSucSign(rs.getString("suc_sign"));
            	bean.setSucName(rs.getString("suc_name"));
            	bean.setPayCodeName(rs.getString("paycode_name"));
            	bean.setSpId(rs.getString("sp_id"));
            	bean.setReturnType(rs.getString("return_type"));
            	bean.setReturnLine(rs.getString("return_line"));
            	bean.setBijection(rs.getString("bijection_name"));
            	bean.setErrorCode(rs.getString("error_code"));
            	bean.setInfo(rs.getString("info"));
            	bean.setPhone(rs.getString("phone"));
            	maps.put(rs.getString("name"), bean);
            }
            prest.close();
			}catch (Exception e) {
				e.printStackTrace();
				return null;
			}finally{
				if(conn!=null)
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		return maps;
    }*/
    @SuppressWarnings("finally")
    public boolean executeTipPar(String sql,Map<String,String> params) {
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;
        boolean flag = false;
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection(); 
            conn.setAutoCommit(false);  
            pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            int  count=0;
            for(String param:params.keySet()){
            	count++;
	            pst.setString(1,param);
	            pst.setString(2, "");
	            pst.setTimestamp(3, new Timestamp(new Date().getTime()));
	            pst.setString(4, "");
	            pst.addBatch();
	            if(count%10==0)  pst.executeBatch(); 
            }
            pst.executeBatch();  
            conn.commit();
            flag =true;
        } catch (Exception e) {  
            	logger.error("插入TipList数据：",e);  
            e.printStackTrace();  
        } finally{  
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);  
           return flag;
        }  
    }
    @SuppressWarnings("finally")
    public boolean executeTip(String sql,Map<String,String> params) {
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;
        boolean flag = true;
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection();
            conn.setAutoCommit(false);
            pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            int  count=0;
            for(String entry : params.keySet()){
            	count++;
	            pst.setString(1,entry.split(",")[0]);
	            pst.setString(2, entry.split(",")[1]);
	            pst.addBatch();
	            if(count%50==0)  pst.executeBatch(); 
            }
            pst.executeBatch();  
            conn.commit();
        } catch (Exception e) {  
            try {  
                conn.rollback(); 
                flag =false;
            } catch (SQLException e1) {  
            	e1.printStackTrace();
            	logger.error("插入TipMap数据：",e);  
            }  
            e.printStackTrace();  
        } finally{  
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);  
           return flag;
        }
    }
    public void executeUpdateID(String sql,List<String> params) {
        JdbcUtil jbpu = getInstance();  
        Connection conn = null;
        PreparedStatement pst = null;  
        try {  
            conn = jbpu.getConnection();  
            conn.setAutoCommit(false);  
            pst = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            int  count=0;
            for(String string:params){
            	count++;
	            pst.setString(1, string);
	            pst.addBatch();
	            if(count%200==0)  pst.executeBatch();
            }
            pst.executeBatch();  
            conn.commit();
        } catch (Exception e) {  
            try {  
                conn.rollback(); 
            } catch (SQLException e1) {  
            	logger.error("插入数据：",e);  
            }  
            e.printStackTrace();  
        } finally{
            ResultSet rs = null;  
            jbpu.close(rs, pst, conn);  
        }  
    }
    public static void main(String[] args) throws UnsupportedEncodingException {
//    	 JdbcUtil jbpu = getInstance();  
//         Connection conn = null;
//         Connection conn1 = null;
//         PreparedStatement pst = null;  
//         PreparedStatement pst1 = null; 
//         ResultSet rs=null;
//         try {  
//        	 conn = jbpu.getConnection(); 
//        	 conn1 = jbpu.getConnection1();
//        	 int i=0;
//        	 pst1 = conn1.prepareStatement("insert into qxt_library(imsi,phone,pro) values(?,?,0)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
//        	 conn1.setAutoCommit(false);
//        	 while (true) {
//        		 boolean flag = false;
//        		 pst = conn.prepareStatement("select imsi,tel from imsi_tel limit "+i+",100000",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
//        		 rs = pst.executeQuery();
//        		 int count = 0;
//        		 System.out.println("ooooooooooo"+System.currentTimeMillis());
//        		 while(rs.next()){
//        			count++;
//        			flag = true;
//    		        String imsi = rs.getString(1);
//    		        String tel = rs.getString(2);
//		            pst1.setString(1, imsi);
//		            pst1.setString(2,tel);
//		            pst1.addBatch();
//		            if(count%1000==0)  pst1.executeBatch();
//        		 }
//        		 if(!flag){
//        			 System.out.println("end------------------");
//        			 break;
//        		 }else{
//        			 pst1.executeBatch();  
//     	             conn1.commit();
//     	             i+=100000;
//        		 }
//        		 
//        	 }
//         }catch(Exception e){
//        	 e.printStackTrace();
//         }
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
         ResultSet rs=null;
         JdbcUtil jbpu = getInstance();  
         conn = jbpu.getConnection1();
         conn.setAutoCommit(false);
         int count=0;
         pst = conn.prepareStatement("insert into qxt_library1(imsi,phone,pro) values(?,?,0)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
         while ((str = br.readLine().trim()) != null) {
          count++;
  		   String imsi = str.substring(0,15);
  		   String phone = str.substring(16).trim().substring(1).trim();
  		   if((imsi=imsi.trim()).length()!=15||(phone=phone.trim()).length()!=11){
  			   System.out.println("continue");
  			   continue;}
  		   try{
	    	   pst.setString(1, imsi);
	    	   pst.setString(2, phone);
	    	   pst.addBatch();
	    	   if(count%1000==0)  pst.executeBatch();
	    	   //pst.execute();
	    	   if(count>10000000)
	    		   break;
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
 }  
