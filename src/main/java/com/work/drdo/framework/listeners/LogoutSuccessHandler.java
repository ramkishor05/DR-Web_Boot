
package com.work.drdo.framework.listeners;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

import com.work.drdo.dao.LoginLogDAO;
import com.work.drdo.executive.entity.LoginLog;

@Component
public class LogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(LogoutSuccessHandler.class);
	
	@Autowired
	private LoginLogDAO loginLogDAO;

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		String id=request.getSession(false).getId();
		logger.info("LogoutSuccess id :"+id);
		LoginLog loginLog = loginLogDAO.getLoginLog(id);
		loginLog.setLogoutAt(new Date());
		loginLogDAO.merge(loginLog);
		super.onLogoutSuccess(request, response, authentication);
	}

}
