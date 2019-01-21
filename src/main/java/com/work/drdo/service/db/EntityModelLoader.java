package com.work.drdo.service.db;

import javax.annotation.PostConstruct;

import org.brijframework.jpa.context.EntityContext;
import org.brijframework.jpa.processor.EntityProcessor;
import org.brijframework.jpa.util.EntityConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class EntityModelLoader {

	@Autowired
	private Environment environment;
	
	@Autowired
	private EntityProcessor processor;

	@PostConstruct
    public void init() {
		if(environment.containsProperty(EntityConstants.IMPORT_FILES)) {
			EntityContext context=new EntityContext();
			context.setProperty(EntityConstants.IMPORT_FILES, environment.getProperty(EntityConstants.IMPORT_FILES));
			context.setObject(EntityConstants.IMPORT_ADPTER_OBJECT, processor);
			context.start();
		}else {
			System.err.println("EntityModelBuilder does not config 'jpa.properties.import_files'");
		}
    }
}
