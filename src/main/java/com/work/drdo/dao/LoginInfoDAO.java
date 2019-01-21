package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.domain.login.LoginRequest;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.UserDiary;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.executive.entity.UserRole;

public interface LoginInfoDAO {
	public LoginInfo registerExecutiveWithImage(LoginInfo userDetail);

	int valdateUser(LoginRequest loginRequest);

	LoginInfo selectByUid(String userName);

	List<LoginInfo> getInActiveUsers();

	void lockAccount(String userId, String token);

	int verifyToken(String token);

	LoginInfo findByToken(String token);

	int resetPassword(String userName, String password);

	LoginInfo getUserByProfileId(UserProfile profileId);

	public List<LoginInfo> getUserByRoleId(UserRole role);

	public void updateLoginInfo(LoginInfo loginInfo);

	public List<LoginInfo> find(Boolean all, Integer max, Integer first);

	public String count();

	public LoginInfo register(LoginInfo loginInfo);
	
	public LoginInfo getUserByRoleId(Integer roleID);
}
