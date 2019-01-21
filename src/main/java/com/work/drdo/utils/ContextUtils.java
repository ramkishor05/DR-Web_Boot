
package com.work.drdo.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class ContextUtils implements ApplicationContextAware {

	private static ApplicationContext APPCTX;

	@Override
	public void setApplicationContext(ApplicationContext appCtx) throws BeansException {
		APPCTX = appCtx;
	}
	
	public static <T> T getBean(Class<T> beanClass) {
        return APPCTX.getBean(beanClass);
    }
	
	public static Object getBean(String beanName) {
        return APPCTX.getBean(beanName);
    }
	
}
