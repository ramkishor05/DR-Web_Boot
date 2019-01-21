package com.work.drdo.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;



@Configuration
public class SpringTilesConfigurer  {

	@Bean
	public TilesConfigurer tilesConfigurer(){
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions("/WEB-INF/templates/tiles/tiles-defs.xml");
		return tilesConfigurer;
	}
	
	
	
	@Bean
	public ViewResolver contentResolver(ContentNegotiationManager negotiatingManager){
		ContentNegotiatingViewResolver contentResolver = new ContentNegotiatingViewResolver();
		contentResolver.setContentNegotiationManager(negotiatingManager);
		
		//List all the view resolvers
		List<ViewResolver> viewResolvers = new ArrayList<ViewResolver>();
		viewResolvers.add(tilesViewResolver());
		viewResolvers.add(internalViewResolver());
		viewResolvers.add(jsonViewResolver());
		
		/*Map<String, MediaType> supportedContentsMap = new HashMap<String, MediaType>();
		supportedContentsMap.put("html", MediaType.TEXT_HTML);
		supportedContentsMap.put("pdf", MediaType.parseMediaType("application/pdf"));
		//supportedContentsMap.put("xml", MediaType.APPLICATION_XML);
		supportedContentsMap.put("json", MediaType.APPLICATION_JSON);*/

		//PathExtensionContentNegotiationStrategy contentNegotiationStrategy = new PathExtensionContentNegotiationStrategy(supportedContentsMap);
		//ContentNegotiationManager contentManager = new ContentNegotiationManager(contentNegotiationStrategy);
		//contentResolver.setContentNegotiationManager(contentManager);
		//contentResolver.setOrder(1);
		contentResolver.setViewResolvers(viewResolvers);
		return contentResolver;
	}
	
	@Bean
	public ViewResolver tilesViewResolver(){
		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		tilesViewResolver.setOrder(2);
		return tilesViewResolver;
	}
	
	@Bean
	public ViewResolver internalViewResolver(){
		InternalResourceViewResolver resourceViewResolver = new InternalResourceViewResolver();
		resourceViewResolver.setViewClass(JstlView.class);
		resourceViewResolver.setOrder(3);
		resourceViewResolver.setPrefix("/WEB-INF/jsp/");
		resourceViewResolver.setSuffix(".jsp");
		return resourceViewResolver;
	}
	
	@Bean
	public ViewResolver jsonViewResolver(){
		return new ViewResolver() {
			
			@Override
			public View resolveViewName(String view, Locale locale) throws Exception {
				MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
				jsonView.setPrettyPrint(Boolean.TRUE);
				return jsonView;
			}
		};
		
	}
	
}
