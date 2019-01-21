package com.work.drdo.config;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import com.work.drdo.pool.ConnectionManager;
import com.work.drdo.sms.builder.SmsServices;


public class AppInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext context) throws ServletException {
		WebApplicationContext webAppContext = getAppContext();
		context.addListener(new ContextLoaderListener(webAppContext));
		context.addListener(HttpSessionEventPublisher.class);

		
		ServletRegistration.Dynamic dispatcher = context.addServlet("DispatcherServlet", new DispatcherServlet(webAppContext));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
		dispatcher.setMultipartConfig(new MultipartConfigElement("/tmp", 1024*1024*5, 1024*1024*5*5, 1024*1024));
	}

	private WebApplicationContext getAppContext(){
		AnnotationConfigWebApplicationContext annotationContext = new AnnotationConfigWebApplicationContext();
		annotationContext.setConfigLocation("com.work.drdo.config");
		SmsServices.getSmsServiceInstance().buildSmsServices("ACL");
		ConnectionManager.getPoolingConnectionManager().buildConnectionPool();
		return annotationContext;
	}
	
}
