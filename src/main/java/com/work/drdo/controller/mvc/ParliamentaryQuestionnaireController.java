package com.work.drdo.controller.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.work.drdo.service.sms.impl.SmsServiceImpl;
import com.work.drdo.utils.Constants;

@Controller
public class ParliamentaryQuestionnaireController {
	@SuppressWarnings("unused")
	@Autowired
	private SmsServiceImpl smsService;
	private static final Logger logger = LoggerFactory.getLogger(ParliamentaryQuestionnaireController.class);

	@RequestMapping(value = { "/", "login" }, method = RequestMethod.GET)
	public String defaultCollege(HttpServletRequest req, HttpServletResponse res) {
		logger.info("!!!  In ParliamentaryQuestionnaireController.defaultCollege !!!");
		// smsService.sendSms("8800803973", "Abhinav", logger, "ACL");
		return Constants.INDEXPAGE;
	}

	@RequestMapping(value = { "/**/*.html" })
	public String defaultRoute(Model model, HttpServletRequest req, HttpServletResponse res) {
		String requestedURI = req.getRequestURI();
		String contextRoot = req.getContextPath();

		String requestedResource = null;
		if (!requestedURI.contains("abcd")) {
			requestedResource = requestedURI.substring(requestedURI.indexOf(contextRoot) + contextRoot.length() + 1);
			requestedResource = requestedResource.substring(0, requestedResource.lastIndexOf("."));
		} else {
			requestedResource = "login";
		}
		logger.info("ParliamentaryQuestionnaireController defaultRoute()");
		return requestedResource;
	}

	@RequestMapping(value = "/403")
	public String forbiddenerror(HttpServletRequest req, HttpServletResponse res) {
		return "403";
	}

}
