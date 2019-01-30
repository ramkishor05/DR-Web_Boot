package com.work.drdo.config;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Executor;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.MethodInvokingFactoryBean;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.retry.RetryPolicy;
import org.springframework.retry.backoff.ExponentialBackOffPolicy;
import org.springframework.retry.policy.SimpleRetryPolicy;
import org.springframework.retry.support.RetryTemplate;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.util.Log4jConfigurer;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.work.drdo.framework.listeners.LogoutListener;

@Configuration
@EnableAsync
@EnableScheduling
@PropertySources(value = { @PropertySource("file:${DRDO_PATH}/drdo_config/ApplicationResource.properties"),
		@PropertySource("file:${DRDO_PATH}/drdo_config/appConfig.properties"),
		@PropertySource("file:${DRDO_PATH}/drdo_config/config.properties") })
@ImportResource({ "/applicationContext.xml" })
public class AppConfig {

	@Autowired
	Environment env;

	@SuppressWarnings("unused")
	private String configDir;

	@Value("${log4j.config.location}")
	private String log4jConfigPath;

	@Value("${log4j.refresh.interval}")
	private String log4jRefreshInterval;
	@Value("${mail.retry.count}")
	private int retryCount;

	@Value("${mail.retry.waitBeforeRetry}")
	private long waitBeforeRetry;

	@PostConstruct
	void init() {
		configDir = env.getProperty("Abhinav_APP_ROOT") + "/config/";
	}

	@Bean
	public MethodInvokingFactoryBean log4jConfig() {
		MethodInvokingFactoryBean log4jConfig = new MethodInvokingFactoryBean();
		log4jConfig.setTargetClass(Log4jConfigurer.class);
		log4jConfig.setTargetMethod("initLogging");
		log4jConfig.setArguments(new Object[] { log4jConfigPath, log4jRefreshInterval });

		return log4jConfig;
	}

	@Bean(name = "mailRetryHandler")
	public RetryTemplate mailRetryHandler() {
		RetryTemplate retryHanlder = new RetryTemplate();
		Map<Class<? extends Throwable>, Boolean> exceptionsToRetry = new HashMap<Class<? extends Throwable>, Boolean>();
		exceptionsToRetry.put(Exception.class, Boolean.TRUE);

		RetryPolicy retryPolicy = new SimpleRetryPolicy(retryCount, exceptionsToRetry);
		retryHanlder.setRetryPolicy(retryPolicy);

		ExponentialBackOffPolicy backOffPolicy = new ExponentialBackOffPolicy();
		backOffPolicy.setInitialInterval(waitBeforeRetry);
		retryHanlder.setBackOffPolicy(backOffPolicy);

		return retryHanlder;
	}

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigurer() {
		PropertySourcesPlaceholderConfigurer propertyConfigurer = new PropertySourcesPlaceholderConfigurer();
		return propertyConfigurer;
	}

	@Bean(name = "asyncExecutor")
	public Executor threadPoolTaskExecutor() {
		ThreadPoolTaskExecutor asyncExecutor = new ThreadPoolTaskExecutor();
		asyncExecutor.setCorePoolSize(Integer.parseInt(env.getProperty("async.executor.pool.size.core")));
		asyncExecutor.setMaxPoolSize(Integer.parseInt(env.getProperty("async.executor.pool.size.max")));
		asyncExecutor.setQueueCapacity(Integer.parseInt(env.getProperty("async.executor.queue.capacity")));
		return asyncExecutor;
	}

	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasenames("/i18n/usermsg", "/i18n/user-err", "/i18n/validation-msg");
		messageSource.setDefaultEncoding("UTF-8");
		messageSource.setUseCodeAsDefaultMessage(false);
		return messageSource;
	}

	@Bean
	public LocaleResolver localeResolver() {
		SessionLocaleResolver resolver = new SessionLocaleResolver();
		resolver.setDefaultLocale(new Locale("en"));
		return resolver;
	}

	@Bean(name = "filterMultipartResolver")
	public CommonsMultipartResolver commonsMultipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setDefaultEncoding("utf-8");
		commonsMultipartResolver.setMaxUploadSize(50000000);
		return commonsMultipartResolver;
	}

	@Bean(name = "logoutListener")
	public LogoutListener getLogoutListener() {
		return new LogoutListener();
	}

}
