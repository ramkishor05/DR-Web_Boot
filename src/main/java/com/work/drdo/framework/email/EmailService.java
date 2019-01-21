package com.work.drdo.framework.email;

import java.io.File;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import javax.mail.internet.MimeMessage;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.work.drdo.framework.email.EmailService;
import com.work.drdo.framework.exception.ServiceException;

@Service
public class EmailService {
	@Autowired
	private VelocityEngine engine;
	
	@Autowired
	private JavaMailSender emailSender;
	
	private static final String SUCCESS = "Success";
	
	private static final Logger log = LoggerFactory.getLogger(EmailService.class);
	

	@Async("asyncExecutor")
    public Future<String> send(final String templateFile, final SimpleMailMessage emailMsg, final Map<String, Object> templateVars, 
    					final Map<String, Object> emailAttachments, final Map<String, Object> params) {
    	
        sendEmail(templateFile, emailMsg, templateVars, emailAttachments, params);
        
        return new AsyncResult<String>(SUCCESS);
    }

	@Async("asyncExecutor")
    public void justSend(final String templateFile, final SimpleMailMessage emailMsg, final Map<String, Object> templateVars, 
    					final Map<String, Object> emailAttachments, final Map<String, Object> params) {
		
		sendEmail(templateFile, emailMsg, templateVars, emailAttachments, params);
		
	}
	
	/**
     * Sends e-mail using Velocity template for the body and 
     * the properties passed in as Velocity variables.
     * 
     * @param   templateFile		The velocity email template.
     * @param   emailMsg			The e-mail message to be sent, except for the body.
     * @param   templateVars  	Variables to use when processing the template. 
     * @param   emailAttachments	Attachments to be attached along with the email
     * @param   params				Parameters for the email such as from, to etc.
     */
    private void sendEmail(final String templateFile, final SimpleMailMessage emailMsg, final Map<String, Object> templateVars, 
			final Map<String, Object> emailAttachments, final Map<String, Object> params) {
    	
    	MimeMessagePreparator msgPreparator = new MimeMessagePreparator() {
        	
        	@Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
        		MimeMessageHelper msgHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
               	msgHelper.setTo(emailMsg.getTo());
            	
               	if(!ArrayUtils.isEmpty(emailMsg.getBcc())){
                   	msgHelper.setBcc(emailMsg.getBcc());
               	}
               	
               	if(MapUtils.isNotEmpty(params)){
                   	msgHelper.setFrom(emailMsg.getFrom(), (String)params.get("fromName"));
               	}else{
               		msgHelper.setFrom(emailMsg.getFrom());
               	}
               	
            	msgHelper.setSubject(emailMsg.getSubject());
               
            	try{
            		if(MapUtils.isNotEmpty(emailAttachments)){
	            		for (String fileName : emailAttachments.keySet()) {
	            			Object contents = emailAttachments.get(fileName);
	            			if(contents instanceof File){
	            				msgHelper.addAttachment(fileName, (File)contents);
	            			}else if(contents instanceof InputStreamSource){
		          				msgHelper.addAttachment(fileName, (InputStreamSource)contents);
	            			}
	            		}
            		}

            		String emailBody = VelocityEngineUtils.mergeTemplateIntoString(engine, templateFile, "UTF-8", templateVars);
            		log.debug("Email Body [" + emailBody + "]");
            		msgHelper.setText(emailBody, true);
   
            	}catch(Exception ex){
            		log.error(ex.getMessage(), ex);
            		throw new ServiceException("Error occured while sending email");
            	}
            	
        	}
        };
        
        //Send the email
        emailSender.send(msgPreparator);
        
        log.info("Email sent successfuly to [" + StringUtils.join(emailMsg.getTo(), ',') + "]");
    }
	
	public static void verifyEmailSent(Future<String> callBack){
		int retry = 0;
		try{
			while(retry++ < 3){
				if(callBack.isDone()){
					if(!SUCCESS.equals(callBack.get())){
						//This will throw exception if there is any issue in sending email
						throw new ServiceException("Failed to send email");
					}
					log.info("Order Refill Email sent !");
					break;
				}
				log.debug("Waiting for email to be sent...");
				Thread.sleep(1000);
			}
			
			if(!callBack.isDone()){
				throw new ServiceException("Failed to send email");
			}
		}catch(ExecutionException ex){
			log.error(ex.getMessage(), ex);
			throw new ServiceException("Error occured, while sending email");
		} catch (InterruptedException ex) {
			log.error(ex.getMessage(), ex);
			throw new ServiceException("Error occured, while sending email");
		}
		

	}
}
