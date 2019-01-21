

package com.work.drdo.framework.exception.handlers;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.work.drdo.domain.error.ErrorInfo;
import com.work.drdo.framework.exception.ServiceException;





@ControllerAdvice
public class ExceptionHandler {

	private static final String DEFAULT_ERROR_VIEW = "error";
	
	// Spring Message Source
	private MessageSource messageSource;
	
	private static final Logger logger = LoggerFactory.getLogger(ExceptionHandler.class);
	
	@Autowired
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}
	
	
	
	@org.springframework.web.bind.annotation.ExceptionHandler(ServiceException.class)
	public ModelAndView handleException(HttpServletRequest request, ServiceException exception){
		 //To handle custom exceptions annotated with @ResponseStatus - re-throw for the framework handle it
		if (AnnotationUtils.findAnnotation(exception.getClass(), ResponseStatus.class) != null){
            throw exception;
		}
		
		//Navigate the user to the page where the error messages will be displayed
        ModelAndView routeTo = new ModelAndView();
        routeTo.addObject("errorInfo", new ErrorInfo(getMessage(exception.getMessage())));
        routeTo.addObject("url", request.getRequestURL());

        //routeTo.setViewName(DEFAULT_ERROR_VIEW);
        String viewName = null == request.getAttribute("errorPage") ? DEFAULT_ERROR_VIEW : (String)request.getAttribute("errorPage");
        routeTo.setViewName(viewName);
        
        return routeTo;
	}
	
	@org.springframework.web.bind.annotation.ExceptionHandler(Exception.class)
	public ModelAndView handleException(HttpServletRequest request, Exception exception){
        //Send the user to a default error-view.
        ModelAndView routeTo = new ModelAndView();
        String errorMsg = StringUtils.isEmpty(exception.getMessage()) ? "System Error Occured" : exception.getMessage();
        routeTo.addObject("errorInfo", new ErrorInfo(errorMsg));
        routeTo.addObject("url", request.getRequestURL());

        routeTo.setViewName(DEFAULT_ERROR_VIEW);
        return routeTo;
	}
	
	private String getMessage(String messageKey) throws IllegalArgumentException{
		try{
			return this.messageSource.getMessage(messageKey, new Object [] {}, LocaleContextHolder.getLocale());
		}catch(NoSuchMessageException e){
			//throw new IllegalArgumentException(e);
			logger.warn("Could not translate exception message, No message translation found !");//Handle gracefully when key not found
		}
		return messageKey;//Return the message key by default
	}
}
