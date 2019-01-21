package com.work.drdo.dao;

import java.util.Date;
import java.util.List;

import com.work.drdo.executive.entity.LoginLog;

public interface LoginLogDAO {
	public LoginLog saveLoginLog(LoginLog loginLog);

	public LoginLog getLoginLog(String sessionId);

	public void merge(LoginLog entity);

	public List<LoginLog> getLoginLogByDate(Date filterDate, Boolean all, Integer max, Integer first);

	public String loginLogCount();

}
