package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.LoginLogVO;
import com.work.drdo.executive.entity.LoginLog;

public class LoginLogMapper {

	public static LoginLogVO mapFromDB(LoginLog loginLog){
		if(null!=loginLog) {
			LoginLogVO loginLogVO = new LoginLogVO();
			loginLogVO.setName(loginLog.getLoginInfo().getProfile().getFirstName()+" "+loginLog.getLoginInfo().getProfile().getLastName());
			loginLogVO.setLoginLogId(loginLog.getLoginLogId());
			loginLogVO.setEmail(loginLog.getLoginInfo().getProfile().getEmail());
			loginLogVO.setUsername(loginLog.getLoginInfo().getProfile().getUserName());
			loginLogVO.setLoginAt(null!=loginLog.getLoginAt() ? String.valueOf(loginLog.getLoginAt()) : "");
			loginLogVO.setLogoutAt(null!=loginLog.getLogoutAt() ? String.valueOf(loginLog.getLogoutAt()):"");
			loginLogVO.setProfileId(String.valueOf(loginLog.getLoginInfo().getProfile().getProfileId()));
			loginLogVO.setSessionId(null!=loginLog.getSessionId()?loginLog.getSessionId():"");
			return loginLogVO;
		}
		return null;
	}
}
