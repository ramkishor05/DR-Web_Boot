
package com.work.drdo.config;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.work.drdo.domain.enums.Role;
import com.work.drdo.utils.SecurityUtils;

@Configuration
public class AuthenticationResponseHandler implements AuthenticationSuccessHandler, AuthenticationFailureHandler {
	
	@Value("${session.timeout}")
	private int sessionTimeout;
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationResponseHandler.class);
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication auth)
					throws IOException, ServletException {

		handleSuccess(req, resp, auth);
		clearAuthenticationAttributes(req);
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse resp, AuthenticationException authEx) 
					throws IOException, ServletException {
		logger.error(authEx.getMessage(), authEx);
		handleFailure(req, resp);
	}

	protected void handleSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication auth) throws IOException {
		
				req.getSession().setMaxInactiveInterval(sessionTimeout*60);
		        String targetUrl = determineTargetUrl(auth);
		        if (resp.isCommitted()) {
		            logger.error("Response already committed. Cannot redirect to " + targetUrl);
		            return;
		        }
		 
		        redirectStrategy.sendRedirect(req, resp, targetUrl);
	}

	protected void handleFailure(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        
		String targetUrl = "/login?error=login_failed";
		System.out.println(targetUrl);
        if (resp.isCommitted()) {
            logger.error("Response already committed. Cannot redirect to " + targetUrl);
            return;
        }
        redirectStrategy.sendRedirect(req, resp, targetUrl);
	}

	protected String determineTargetUrl(Authentication auth) {
    	Set<String> roles = SecurityUtils.getGrantedRoles(auth);
    	System.out.println(roles);
    	if(roles.contains(Role.ADMIN.value())){
    		//Admin user
    		return "/admin/welcomeAdmin";
    	}else if(roles.contains(Role.ZONALCOMMISSIONER.value())){
    		return "/deptHead/welcomeDeptHead";
    	}else if(roles.contains(Role.COMMISSIONER.value())){
    		return "/cc/welcomeCC";
    	}else if(roles.contains(Role.DIVISION.value())){
    		return "/division/welcomeDivision";
    	}else if(roles.contains(Role.DEPTHEAD.value())){
    		return "/deptHead/welcomeDeptHead";
    	}else if(roles.contains(Role.GROUPHEAD.value())){
    		return "/group/welcomeGroup";
    	}else if(roles.contains(Role.SCIENTIST.value())){
    		return "/scientist/welcomeScientist";
    	}
        logger.error("The user does not have any role assigned");
        //Send him to error page
        return "/error.html";
    }
 
    protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(null != session){
        	session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        }
    }
 
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }
    
}
