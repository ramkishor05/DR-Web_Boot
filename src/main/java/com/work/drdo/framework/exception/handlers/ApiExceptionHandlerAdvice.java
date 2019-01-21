package com.work.drdo.framework.exception.handlers;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.work.drdo.domain.error.ErrorInfo;
import com.work.drdo.framework.exception.ServiceException;



@ControllerAdvice(annotations = RestController.class)
public class ApiExceptionHandlerAdvice {
private MessageSource messageSource;
	
	private static final Logger logger = LoggerFactory.getLogger(ApiExceptionHandlerAdvice.class);
	
	@Autowired
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}
	
    @SuppressWarnings("rawtypes")
	@ExceptionHandler
    public ResponseEntity handleException(ServiceException ex) {
    	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ErrorInfo(getMessage(ex.getMessage())));
    }

    @SuppressWarnings("rawtypes")
	@ExceptionHandler
    public ResponseEntity commonError(Exception ex) {
        logger.warn(ex.getMessage(), ex);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ErrorInfo(ex.getMessage()));
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
