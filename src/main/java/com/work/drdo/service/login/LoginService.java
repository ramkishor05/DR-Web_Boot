package com.work.drdo.service.login;

import java.util.Date;
import java.util.List;

import com.work.drdo.domain.login.LoginRequest;
import com.work.drdo.domain.questionnaire.LoginLogVO;
import com.work.drdo.domain.questionnaire.UserDetailVO;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.LoginLog;
import com.work.drdo.executive.entity.UserProfile;

public interface LoginService {

	public void login(LoginRequest loginRequest);
	//public List<LoginInfo> assignmentList();
	public List<LoginLogVO> getLoginLogByDate(String filterDate,Boolean all, Integer max, Integer first);
	//public List<LoginInfo> assignmentListForReportAnswer();
	public List<LoginInfo> findUser(Boolean all, Integer max, Integer first);
	public String count();
	public String loginLogCount();
	
	/*****Loginlog services ***/
	public LoginLogVO saveLoginLog(LoginLog loginLog);
	public LoginLogVO getLoginLog(String sessionId);
	public void merge(LoginLog entity);
	public List<LoginLogVO> getLoginLogByDate(Date sessionId);
	public void updateLoginInfo(UserProfile profileId);
	
	public List<UserDetailVO> getUserProfileByGroupId(Integer groupId);
	public List<UserDetailVO> getUserProfileByDeptId(Integer deptId);
	public String groupMemberCount(Integer groupId);
	public String departmentMemberCount(Integer groupId);
}
