package com.work.drdo.service.notification.impl;

import static com.work.drdo.utils.SecurityUtils.getRequestDomainName;

/**
 * Abhinav
 *
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.work.drdo.domain.UserProfile;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.UserDiary;
import com.work.drdo.framework.email.EmailService;
import com.work.drdo.service.notification.EmailNotificationService;
import com.work.drdo.utils.SecurityUtils;

@Service
@Scope(value = "prototype", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class EmailNotificationServiceImpl implements EmailNotificationService {

	@Value("${registration.notification.email.fromEmail}")
	private String registerFromEmail;

	@Value("${registration.notification.email.fromName}")
	private String registerFromName;

	@Value("${registration.notification.email.subject}")
	private String registerSubject;
	
	@Value("${pending.question.notification.email.subject}")
	private String pendingQuestionSubject;

	@Value("${domain.name}")
	private String domain;

	@Autowired
	private EmailService emailService;

	@Autowired
	@Qualifier("emailMessage")
	private SimpleMailMessage emailMessage;

	@Autowired
	@Qualifier("confirmMessage")
	private SimpleMailMessage confirmRefillMessage;

	@Resource(name = "emailTemplatesMap")
	private Map<String, String> emailTemplatesMap;

	private static final Logger logger = LoggerFactory.getLogger(EmailNotificationServiceImpl.class);

	private static final String emailNotifierName = "workmy";

	private static final String emailNotifierId = "workmy2018@gmail.com";

	private static final String resetPasswordEmailSubject = "Reset Password Information";

	private static final Object passwordupdateFromName = "workmy";

	private static final String passwordupdateFromEmail = "workmy2018@gmail.com";

	private static final String passwordupdateSubject = "Password Changes Successfully.";

	@Override
	public void notifyRegistration(LoginInfo profile, String passcode) {
		logger.debug("Inside EmailNotificationServiceImpl notifyRegistration Start");
		String requestDomainName = getRequestDomainName();
		Map<String, Object> templateVars = new HashMap<String, Object>();
		templateVars.put("firstName", profile.getProfile().getFirstName());
		templateVars.put("lastName", profile.getProfile().getLastName());
		templateVars.put("password", passcode);
		templateVars.put("email", profile.getProfile().getEmail());
		templateVars.put("domain", requestDomainName);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fromName", emailNotifierName);

		emailMessage.setFrom(emailNotifierId);

		//emailMessage.setFrom(registerFromEmail);
		emailMessage.setTo(profile.getProfile().getEmail());
		emailMessage.setSubject(registerSubject);
		emailService.justSend(emailTemplatesMap.get("registration-success"), emailMessage, templateVars, null, params);
		logger.debug("Inside EmailNotificationServiceImpl notifyRegistration End");
	}

	@Override
	public void sendPasswordResetInfo(UserProfile profile, String resetURL) {
		String requestDomainName = getRequestDomainName();
		Map<String, Object> templateVars = new HashMap<String, Object>();
		profile.setFirstName(org.apache.commons.lang.StringUtils.upperCase(profile.getFirstName()));
		profile.setLastName(org.apache.commons.lang.StringUtils.upperCase(profile.getLastName()));
		templateVars.put("profile", profile);
		templateVars.put("resetURL", resetURL);
		templateVars.put("domain", requestDomainName);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fromName", emailNotifierName);

		emailMessage.setFrom(emailNotifierId);
		emailMessage.setTo(profile.getEmail());
		emailMessage.setSubject(resetPasswordEmailSubject);

		emailService.justSend(emailTemplatesMap.get("newrx-emailTemplate"), emailMessage, templateVars, null, params);

		logger.info("Inside EmailNotificationServiceImpl : notifyForgotUser :ends. ");
	}

	@Override
	public void notifyUpdatePassword(UserProfile profile) {
		String requestDomainName = getRequestDomainName();
		logger.debug("domain" + requestDomainName);

		Map<String, Object> templateVars = new HashMap<String, Object>();
		templateVars.put("profile", profile);
		templateVars.put("domain", requestDomainName);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fromName", passwordupdateFromName);

		emailMessage.setFrom(passwordupdateFromEmail);
		emailMessage.setTo(profile.getEmail());
		emailMessage.setSubject(passwordupdateSubject);
		logger.debug(
				"Inside EmailNotificationServiceImpl : notifyUpdatePassword. emailTemplatesMap.UpdatePasswordTemplate-->"
						+ emailTemplatesMap.get("UpdatePasswordTemplate"));

		emailService.justSend(emailTemplatesMap.get("UpdatePasswordTemplate"), emailMessage, templateVars, null,
				params);

		logger.info("Inside EmailNotificationServiceImpl : notifyUpdatePassword :ends. ");
	}

	@Override
	public void sendDiaryConfirmation(UserDiary diary,List<String> approvalChk) {
		logger.debug("Inside EmailNotificationServiceImpl Diary Confirmation Start");
		String requestDomainName = getRequestDomainName();
		Map<String, Object> templateVars = new HashMap<String, Object>();
		templateVars.put("email", diary.getCreatedBy().getEmail());
		templateVars.put("firstName", diary.getCreatedBy().getFirstName());
		templateVars.put("lastName", diary.getCreatedBy().getLastName());
		templateVars.put("director", SecurityUtils.getUserProfile().getFirstName()+" "+SecurityUtils.getUserProfile().getLastName());
		templateVars.put("domain", requestDomainName);
		String listString = "";
		if(null!=approvalChk){
			for (String s : approvalChk)
			{
			    listString += s + ", ";
			}
			listString=listString.replaceAll(", $", "");
			templateVars.put("approvalChk", listString);
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fromName", emailNotifierName);

		emailMessage.setFrom(emailNotifierId);

		//emailMessage.setFrom(registerFromEmail);
		emailMessage.setTo(diary.getCreatedBy().getEmail());
		emailMessage.setSubject("Diary Confirmation");
		emailService.justSend(emailTemplatesMap.get("diary-confirmation"), emailMessage, templateVars, null, params);
		logger.debug("Inside EmailNotificationServiceImpl Diary Confirmation End");
		
	}

	@Override
	public void sendDiaryDisapprovalEmail(UserDiary diary,String remark) {
		logger.debug("Inside EmailNotificationServiceImpl Diary Disapproval Start");
		String requestDomainName = getRequestDomainName();
		Map<String, Object> templateVars = new HashMap<String, Object>();
		templateVars.put("email", diary.getCreatedBy().getEmail());
		templateVars.put("firstName", diary.getCreatedBy().getFirstName());
		templateVars.put("lastName", diary.getCreatedBy().getLastName());
		templateVars.put("director", SecurityUtils.getUserProfile().getFirstName()+" "+SecurityUtils.getUserProfile().getLastName());
		templateVars.put("domain", requestDomainName);
		templateVars.put("remark", remark);
		templateVars.put("diaryNo", diary.getDiaryNo());
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fromName", emailNotifierName);

		emailMessage.setFrom(emailNotifierId);

		//emailMessage.setFrom(registerFromEmail);
		emailMessage.setTo(diary.getCreatedBy().getEmail());
		emailMessage.setSubject("Diary Not Approved");
		emailService.justSend(emailTemplatesMap.get("diary-disapproval"), emailMessage, templateVars, null, params);
		logger.debug("Inside EmailNotificationServiceImpl Diary Disapproval End");
		
	}
	
	
/*	public void notifyPendingQuestion(LoginInfo user, Assignment question) {
		logger.debug("Inside EmailNotificationServiceImpl notifyRegistration Start");
		//String requestDomainName = getRequestDomainName();
		Map<String, Object> templateVars = new HashMap<String, Object>();
		templateVars.put("firstName", user.getProfileId().getFirstName());
		templateVars.put("lastName", user.getProfileId().getLastName());
		//templateVars.put("questionId", question.getQuestionId().getQuestionId());
		//templateVars.put("sla",question.getQuestionId().getSla());
		
		//templateVars.put("domain", requestDomainName);
		//templateVars.put("domain", SecurityUtils.getCtxPath());
		if(null!=question.getQuestionId().getQuestionText()){
			templateVars.put("question", question.getQuestionId().getQuestionText().length()>50 ? URLDecoder.decode(question.getQuestionId().getQuestionText().substring(0, 50)): URLDecoder.decode(question.getQuestionId().getQuestionText()));
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fromName", emailNotifierName);

		emailMessage.setFrom(emailNotifierId);

		emailMessage.setFrom(registerFromEmail);
		emailMessage.setTo(user.getProfileId().getEmail());
		emailMessage.setSubject(pendingQuestionSubject);
		emailService.justSend(emailTemplatesMap.get("pending-question-notification"), emailMessage, templateVars, null, params);
		logger.debug("Inside EmailNotificationServiceImpl notifyRegistration End");
	}*/

}
