package cp.pay.mj.web.listener;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;

import cp.pay.mj.cache.UserKeyCache;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.service.account.IUserService;
import cp.pay.mj.utils.Constants;
import cp.pay.mj.utils.PropertiesLoader;

@Service
public class InitializationListener extends ContextLoader implements ServletContextListener{
	
	private static PropertiesLoader propertiesLoader = PropertiesLoader.getInstance();

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("0000");
		String profiles = event.getServletContext().getInitParameter("spring.profiles.default");
		String customPath = "setup." + profiles + ".properties";
		propertiesLoader.setProperties("classpath*:/setup.properties", customPath);
		Constants.TOMCAT_SHOW = propertiesLoader.getProperty("tomcat.show.location") + "/";
		Constants.STATIC_SHOW = propertiesLoader.getProperty("static.show.location");
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
	}


}
