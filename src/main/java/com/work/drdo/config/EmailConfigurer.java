package com.work.drdo.config;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;



@Configuration
@PropertySources(value = { @PropertySource("file:${DRDO_PATH}/drdo_config/smtp.properties") })
public class EmailConfigurer {
    private static final String MAIL_SMTPS_AUTH="mail.smtps.auth";
    private static final String MAIL_SMTPS_DEBUG="mail.smtp.debug";
    private static final String MAIL_SMTPS_STARTTLS="mail.smtp.starttls.enable";
    private static final String MAIL_SMTPS_TIMEOUT="mail.smtp.timeout";
    private static final String MAIL_SMTPS_FACTORY= "mail.smtp.socketFactory.port";
    @Autowired
    private ServletContext context;
	
	@Value("${smtp.props.mail.host}")
	private String host;
	
	@Value("${smtp.props.mail.port}")
	private String port;
	
	@Value("${smtp.props.mail.factory.port}")
	private String factoryPort;
	
	@Value("${smtp.props.mail.protocol}")
	private String protocol;
	
	@Value("${smtp.props.mail.username}")
	private String username;
	
	@Value("${smtp.props.mail.password}")
	private String password;
	
	@Value("${smtp.props.mail.smtps.auth}")
	private boolean mailAuth;
	
	@Value("${smtp.props.mail.smtp.debug}")
	private boolean mailDebug;

	@Value("${smtp.props.mail.timeout}")
	private String mailTimeout;
	
	@Value("${smtp.props.mail.starttls.enable}")
	private boolean starttls;
	
	@Value("${smtp.props.mail.toEmail}")
	private String emailTo;
	
	@Value("${smtp.props.mail.fromEmail}")
	private String emailFrom;
	
	@Value("${smtp.props.mail.fromName}")
	private String emailName;
	
	@Value("${smtp.props.mail.subject}")
	private String subject;
	
	
	private static final Logger log = LoggerFactory.getLogger(EmailConfigurer.class);
	
	@Bean
	public JavaMailSender emailSender(){
		Properties javaMailProps = new Properties();
		javaMailProps.put(MAIL_SMTPS_AUTH, mailAuth );
		javaMailProps.put(MAIL_SMTPS_DEBUG, mailDebug);
		javaMailProps.put(MAIL_SMTPS_STARTTLS, starttls	);
		javaMailProps.put(MAIL_SMTPS_TIMEOUT, mailTimeout);
		javaMailProps.put(MAIL_SMTPS_FACTORY, factoryPort);
		javaMailProps.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		Session session = Session.getDefaultInstance(javaMailProps,
		new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		});
		JavaMailSenderImpl emailSender = new JavaMailSenderImpl();
		emailSender.setSession(session);
		emailSender.setHost(host);
		emailSender.setPort(Integer.parseInt(port));//587,25
		emailSender.setProtocol(protocol);
		emailSender.setUsername(emailFrom);//"workmy2018@gmail.com"
		emailSender.setPassword(password);
		emailSender.setJavaMailProperties(javaMailProps);
		return emailSender;
	}
	
	@Scope("prototype")
	@Bean(name="confirmMessage")
	public SimpleMailMessage confirmRefillRequestEmailTemplate(){
		SimpleMailMessage emailTemplate = new SimpleMailMessage();
		emailTemplate.setTo(StringUtils.split(emailTo, ";"));
		emailTemplate.setFrom(emailFrom);
		emailTemplate.setSubject(subject);
		
		return emailTemplate;
	}

	@Bean
	public VelocityEngine velocityTemplate() throws VelocityException, IOException{
		VelocityEngineFactoryBean templateFactory = new VelocityEngineFactoryBean();
		Properties templateProps = new Properties();
		//templateProps.put("resource.loader", "class");
		//templateProps.put("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
		templateProps.put("resource.loader", "file");
		templateProps.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.FileResourceLoader");
		
		templateProps.put("file.resource.loader.path", context.getRealPath(File.separator) + "/WEB-INF/templates/email");
		log.info("Email Template path loaded [" + templateProps.getProperty("file.resource.loader.path") + "]");
		System.out.println("Email Template path loaded [" + templateProps.getProperty("file.resource.loader.path") + "]");
		templateProps.put("file.resource.loader.cache", false);
		templateFactory.setVelocityProperties(templateProps);
		
		return templateFactory.createVelocityEngine();
	}
	

	@Scope("prototype")
	@Bean(name="emailMessage")
	public SimpleMailMessage notificationEmailTemplate(){
		return new SimpleMailMessage();
	}
	
}
