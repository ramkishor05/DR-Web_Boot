package com.work.drdo.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class ConverterConfiguration extends WebMvcConfigurationSupport{

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry){
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
	}
	
	protected void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(converter());
        System.out.println("Configuring conveters");
        
        addDefaultHttpMessageConverters(converters);
    }
	
	@Bean
	MappingJackson2HttpMessageConverter converter() {
		 //customization
		MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
		List<MediaType>  suportedMediTypes = new ArrayList<MediaType>();
		suportedMediTypes.add(MediaType.APPLICATION_JSON);
		converter.setSupportedMediaTypes(suportedMediTypes);
		
     return converter;
 }
	
	
}
