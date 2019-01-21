package com.work.drdo.controller.mvc.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.work.drdo.domain.ResetPasswordRequest;
import com.work.drdo.domain.UserForgotPasswordRequest;
import com.work.drdo.service.login.RegistrationService;
import com.work.drdo.utils.Constants;

@Controller
public class RegistrationController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegistrationController.class);
	@Autowired
	private RegistrationService registrationService;
	
	
	@RequestMapping(value="/forgotpassword", method=RequestMethod.GET)
	public String forgotPassword(HttpServletRequest request, HttpServletResponse response){
		return "forgotpassword";
	}
	
	@RequestMapping(value = "/admin/resetPasswordSubmit", method = RequestMethod.POST)
	public String resetPassword(ModelMap model,@ModelAttribute("resetPasswordFormFinal") @Valid ResetPasswordRequest resetRequest, 
			BindingResult binder, HttpServletRequest req) {
		
		registrationService.resetPasswordAfterLogin(resetRequest);
		model.addAttribute("message", "forgot.password.complete");
		return "admin/resetPasswordComplete"; //Reset complete
	
	}
	
	@RequestMapping(value = "/resetPassword/init", method = RequestMethod.POST)
	public String resetPassword(ModelMap model,
			@ModelAttribute("resetPasswordForm") @Valid UserForgotPasswordRequest userForgotPasswordRequest,
			BindingResult binder, HttpServletRequest req) {
		try{
			if (null == userForgotPasswordRequest || binder.hasErrors()) {
				logger.info("Validation Failed, routing back to View");
				model.addAttribute("patientForgotPasswordRequest", userForgotPasswordRequest);
				return Constants.RESETPWD_FAILED;
			}
			req.setAttribute("errorPage", Constants.RESETPWD_FAILED);
			logger.debug(String.format("UserForgotPasswordRequest -> %s", userForgotPasswordRequest));
			userForgotPasswordRequest.setUserName(userForgotPasswordRequest.getUserName().trim());
			
			registrationService.resetPassword(userForgotPasswordRequest);
			logger.debug("!!! Password Updated for Account Id !!" + userForgotPasswordRequest.getUserName());
			model.addAttribute("message", "forgot.password.init");
			return Constants.AFTERRESETPASSWORD_INIT;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		model.addAttribute("message", "resetpassword.invalid");
		return Constants.RESETPWD_FAILED;
	}

	
	@RequestMapping(value = "/resetPassword/verify", method = RequestMethod.GET)
	public String verifyResetPasswordToken(@RequestParam("token") String token, HttpServletRequest req) {		
		boolean isValid = registrationService.verifyToken(token);		
		if(isValid){
			req.setAttribute("token", token); //Redirect to change password screen
			return Constants.RESETPASSWORD_VERIFIED;
		}		
		return Constants.RESETPWD_FAILED;		
	}

	@RequestMapping(value = "/resetPassword/complete", method = RequestMethod.POST)
	public String completePasswordReset(ModelMap model,@ModelAttribute("resetPasswordFormFinal") @Valid ResetPasswordRequest resetRequest, 
											BindingResult binder, HttpServletRequest req) {
		if (null == resetRequest || binder.hasErrors()) { // Validation for mandatory fields before passing to Service
			return Constants.RESETPWD_FAILED;
		}
		registrationService.resetPassword(resetRequest);
		model.addAttribute("message", "forgot.password.complete");//Reset complete
		return Constants.RESETPASSWORD_COMPLETE;
		
	}
}
