package com.work.drdo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
@EnableWebMvc
public class WebConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
		interceptor.setParamName("language");
		registry.addInterceptor(interceptor);
	}

	@Override
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
		configurer.favorPathExtension(Boolean.FALSE).favorParameter(Boolean.TRUE).parameterName("mediaType")
				.ignoreAcceptHeader(Boolean.TRUE)
				// .useJaf(Boolean.FALSE)
				// .defaultContentType(MediaType.APPLICATION_JSON)
				.mediaType("html", MediaType.TEXT_HTML).mediaType("pdf", MediaType.parseMediaType("application/pdf"))
				.mediaType("json", MediaType.APPLICATION_JSON);
	}
}
