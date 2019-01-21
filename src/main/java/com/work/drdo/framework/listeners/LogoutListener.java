
package com.work.drdo.framework.listeners;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.security.web.session.HttpSessionDestroyedEvent;

import com.work.drdo.dao.LoginLogDAO;
import com.work.drdo.executive.entity.LoginLog;

public class LogoutListener implements ApplicationListener<ApplicationEvent> {
	private static final Logger logger = LoggerFactory.getLogger(LogoutListener.class);
	
	@Autowired
	private LoginLogDAO loginLogDAO;

	@Override
	public void onApplicationEvent(ApplicationEvent applicationEvent) {
		if (applicationEvent instanceof HttpSessionDestroyedEvent) {
			HttpSessionDestroyedEvent applicationEvent1 = (HttpSessionDestroyedEvent) applicationEvent;
			logger.info("..............." + applicationEvent1.getSession().getId());
			LoginLog loginLog = loginLogDAO.getLoginLog(applicationEvent1.getSession().getId());
			loginLog.setLogoutAt(new Date());
			loginLogDAO.merge(loginLog);
		}
	}

}
