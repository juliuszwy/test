package cp.pay.mj.utils;

import java.util.HashMap;
import java.util.Map;

public class Constants {
	private static PropertiesLoader propertiesLoader = new PropertiesLoader("classpath:/setup.properties");
	
	public static final int ENABLED = 0;
	public static final int DISABLED = 1;
	
	public static final int ALLOWED = 1;
	public static final int DENIED = 0;
	
	//LoadData 
	public static final int LOADDATA_SDK_TRANSFORMHOUR = 1;
		
	
	public static final int PL=0;
	public static final int APL=1;
	
	public static final int ONEDAYSECONDS = 24 * 60 * 60 * 1000;
	
	public static final String LOGINSUC ="1";
	public static final String LOGINFAIL="2";
	public static final String RANDOMCODE="3";
	
	public static final String ASC="asc";
	public static final String DESC="desc";
	//错误日志文件其实部分.
	public static final String SYSTEM_ERROR_FILE_PREFIX = "system_errors";
	
	public static String STATIC_SHOW;
	
	//服务器tomcat布置地址.
	public static String TOMCAT_SHOW;
	
	public static final String ADMIN_EXPLORER = propertiesLoader.getProperty("admin.explorer.user_agent");
	
	public static final int SUPERMAN = 1;
	
	public static final Integer DEFAULT_PAGE_SIZE = propertiesLoader.getInteger("page.pagesize", 15);
	
	public static final Integer DEFAULT_PAGE_SLIDERS = propertiesLoader.getInteger("page.sliders", 10);
	
	public static final String PLATFORM_VERSION = propertiesLoader.getProperty("platform.version", "");
	
	public static final Integer ROWS_PER_SHEET = propertiesLoader.getInteger("excel.RowsPerSheet", 5000);
	
	public static final Integer BATCH_SIZE = propertiesLoader.getInteger("hibernate.batch.size", 200);
	
	public static final String[] WHOLE_NETWORK = new String[]{"1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"};
	
	public static final String REQUEST_RECYCLE_DATA = "recycleData";
	
	public static final Integer EXCEL_DISPLAY_ROWS = propertiesLoader.getInteger("excel_display_rows", 10000);
	
	public static final Integer SDK_DEPLOY_INTERVAL = propertiesLoader.getInteger("sdk.deploy.interval", 10 * 60);
	public static final String PROINDEX = "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]";
	
	public static final String SUCCESS="{\"result\":0,\"msg\":\"提交成功！\"}";
	public static final String ERROR="{\"result\":1}";
	
	
	
	}
