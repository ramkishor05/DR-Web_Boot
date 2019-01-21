/**
 * 
 *
 */
package com.work.drdo.service.login.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.LoginInfoDAO;
import com.work.drdo.dao.LoginLogDAO;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.login.LoggedInUser;
import com.work.drdo.domain.login.LoginRequest;
import com.work.drdo.domain.questionnaire.LoginLogVO;
import com.work.drdo.domain.questionnaire.UserDetailVO;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.LoginLog;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.helper.LoginLogMapper;
import com.work.drdo.helper.UserDetailMapper;
import com.work.drdo.service.login.LoginService;
import com.work.drdo.utils.Utility;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService, UserDetailsService {

	@Autowired
	private LoginInfoDAO loginDAO;
	@Autowired
	LoginLogDAO loginLogDAO;
	@Autowired
	UserProfileDAO profileDao;

	@Deprecated
	@Override
	public void login(LoginRequest loginRequest) {
		System.out.println("loginRequest.getUserId()" + loginRequest.getUserId());
		int loginCount = loginDAO.valdateUser(loginRequest);
		if (loginCount == 1) {
			System.out.println("Valid Login");
		} else {
			System.out.println("Invalid Userid / Password");
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.security.core.userdetails.UserDetailsService#
	 * loadUserByUsername(java.lang.String)
	 */
	@SuppressWarnings("serial")
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		System.out.println(userName);
		final LoginInfo loginInfo = loginDAO.selectByUid(userName);
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new GrantedAuthority() {
			@Override
			public String getAuthority() {
				return loginInfo != null ? loginInfo.getRole().getUserRoleName() : "";
			}
		});
		if (null == loginInfo) {
			System.out.println("Username not found");
		}

		boolean active = Utility.asBoolean(null != loginInfo ? loginInfo.getActive() : 'N');
		boolean enabled = Utility.asBoolean(null != loginInfo ? loginInfo.getEnabled() : 'N');
		boolean accountNonnLocked = !Utility.asBoolean(null != loginInfo ? loginInfo.getLocked() : 'N');
		boolean accountNonExpired = active;
		boolean credentialsNonExpired = active;
		UserDetails userDetails = new LoggedInUser(loginInfo.getUserName(), (String) loginInfo.getPassword(),
				(String) loginInfo.getLoginId().toString(), enabled, accountNonExpired, credentialsNonExpired,
				accountNonnLocked, authorities, loginInfo.getRole(), loginInfo.getProfile());
		return userDetails;
	}

	@Override
	public List<LoginLogVO> getLoginLogByDate(String filterDate, Boolean all, Integer max, Integer first) {
		Date date = null;
		List<LoginLog> vos = null;
		if (null != filterDate) {
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			date = new Date();
			try {
				date = df.parse(filterDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (null != date) {
			vos = loginLogDAO.getLoginLogByDate(date, all, max, first);
		} else {
			vos = loginLogDAO.getLoginLogByDate(null, all, max, first);
		}
		List<LoginLogVO> loginLogVO = new ArrayList<LoginLogVO>();
		try {
			if (CollectionUtils.isNotEmpty(vos)) {
				for (LoginLog loginLog : vos) {
					loginLogVO.add(LoginLogMapper.mapFromDB(loginLog));
				}
			}
		} catch (Exception Ex) {
			Ex.printStackTrace();
		}
		return loginLogVO;

	}

	@Override
	public LoginLogVO saveLoginLog(LoginLog loginLog) {
		LoginLog loginLogDB = loginLogDAO.saveLoginLog(loginLog);
		LoginLogVO loginlog = LoginLogMapper.mapFromDB(loginLogDB);
		LoginInfo loginInfo = loginDAO.getUserByProfileId(loginLog.getLoginInfo().getProfile());
		loginDAO.updateLoginInfo(loginInfo);
		return loginlog;
	}

	@Override
	public LoginLogVO getLoginLog(String sessionId) {
		return LoginLogMapper.mapFromDB(loginLogDAO.getLoginLog(sessionId));
	}

	@Override
	public void merge(LoginLog entity) {
		loginLogDAO.merge(entity);
	}

	@Override
	public List<LoginLogVO> getLoginLogByDate(Date sessionId) {
		List<LoginLog> loginLogList = loginLogDAO.getLoginLogByDate(sessionId, null, null, null);
		List<LoginLogVO> loginLogVOList = new ArrayList<LoginLogVO>();
		for (LoginLog loginLog : loginLogList) {
			loginLogVOList.add(LoginLogMapper.mapFromDB(loginLog));
		}
		return loginLogVOList;
	}

	public void updateLoginInfo(UserProfile profileId) {
		LoginInfo loginInfo = loginDAO.getUserByProfileId(profileId);
		loginInfo.setActive('N');
		loginDAO.updateLoginInfo(loginInfo);
	}

	@Override
	public List<LoginInfo> findUser(Boolean all, Integer max, Integer first) {
		List<LoginInfo> allUsers = loginDAO.find(all, max, first);
		return allUsers;
	}

	@Override
	public String count() {
		return loginDAO.count();
	}

	@Override
	public String loginLogCount() {
		return loginLogDAO.loginLogCount();
	}

	@Override
	public String groupMemberCount(Integer groupId) {
		return profileDao.groupMemberCount(groupId);
	}

	@Override
	public String departmentMemberCount(Integer deptId) {
		return profileDao.departmentMemberCount(deptId);
	}

	@Override
	public List<UserDetailVO> getUserProfileByGroupId(Integer groupId) {
		List<UserProfile> userList = profileDao.getUserProfileByGroupId(groupId);
		List<UserDetailVO> voList = new ArrayList<UserDetailVO>();
		for (UserProfile userProfile : userList) {
			UserDetailVO userDetailVO = UserDetailMapper.mappingFromDB(userProfile);
			voList.add(userDetailVO);
		}
		return voList;
	}

	@Override
	public List<UserDetailVO> getUserProfileByDeptId(Integer deptId) {
		List<UserProfile> userList = profileDao.getUserProfileByDeptId(deptId);
		List<UserDetailVO> voList = new ArrayList<UserDetailVO>();
		for (UserProfile userProfile : userList) {
			UserDetailVO userDetailVO = UserDetailMapper.mappingFromDB(userProfile);
			voList.add(userDetailVO);
		}
		return voList;
	}

}
