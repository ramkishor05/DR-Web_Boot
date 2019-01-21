package com.work.drdo.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.LoginInfoDAO;
import com.work.drdo.domain.login.LoginRequest;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.executive.entity.UserRole;
import com.work.drdo.utils.SecurityUtils;

@Repository("loginDAO")
public class LoginInfoDAOImpl extends AbstractDao<Integer, LoginInfo> implements LoginInfoDAO {
	Logger logger = Logger.getLogger(LoginInfoDAOImpl.class);

	@Override
	@Transactional
	public LoginInfo registerExecutiveWithImage(LoginInfo userDetail) {
		try {
			saveOrupdate(userDetail);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return userDetail;
	}

	@Override
	public int valdateUser(LoginRequest loginRequest) {

		return findUser(loginRequest).size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public LoginInfo selectByUid(String userName) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("userName", userName));
		List<LoginInfo> users = (List<LoginInfo>) criteria.list();
		if (null != users && !users.isEmpty()) {
			return users.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<LoginInfo> findUser(LoginRequest loginRequest) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("userName", loginRequest.getUserId()));
		criteria.add(Restrictions.eq("password", loginRequest.getPassword()));
		return (List<LoginInfo>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoginInfo> getInActiveUsers() {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("active", 'N'));
		List<LoginInfo> users = (List<LoginInfo>) criteria.list();
		return users;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void lockAccount(String userId, String token) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("userName", userId));
		List<LoginInfo> users = (List<LoginInfo>) criteria.list();
		if (null != users && !users.isEmpty()) {
			LoginInfo user = users.get(0);

			user.setLocked('Y');
			user.setPassword(token);
			update(user);
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public int verifyToken(String token) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("locked", 'Y'));
		criteria.add(Restrictions.eq("password", token));
		List<LoginInfo> user = (List<LoginInfo>) criteria.list();
		return user.size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public LoginInfo findByToken(String token) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("locked", 'Y'));
		criteria.add(Restrictions.eq("password", token));
		List<LoginInfo> user = (List<LoginInfo>) criteria.list();
		return user.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int resetPassword(String userName, String password) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("userName", userName));
		List<LoginInfo> users = (List<LoginInfo>) criteria.list();
		if (null != users && !users.isEmpty()) {
			LoginInfo user = users.get(0);
			user.setLocked('N');
			user.setPassword(password);
			user.setUpdTs(new Date());
			update(user);
		}
		return 1;
	}

	@SuppressWarnings("unchecked")
	@Override
	public LoginInfo getUserByProfileId(UserProfile profileId) {
		if (null != profileId) {
			Criteria criteria = createEntityCriteria();
			criteria.add(Restrictions.eq("profileId", profileId));
			List<LoginInfo> user = (List<LoginInfo>) criteria.list();
			return user.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoginInfo> getUserByRoleId(UserRole role) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("roleId", role));
		List<LoginInfo> user = (List<LoginInfo>) criteria.list();
		return user;
	}
	@Override
	public void updateLoginInfo(LoginInfo loginInfo) {
		update(loginInfo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoginInfo> find(Boolean all, Integer max, Integer first) {
		try {
			Query query = null;
			if (SecurityUtils.getRole().getUserRoleId() == 2) {
				query = getSession().createQuery("from LoginInfo l where l.active='Y'");
			} else {
				query = getSession().createQuery("from LoginInfo l where l.active='Y'");
			}
			if (!all) {
				query.setFirstResult(first);
				query.setMaxResults(max);
			}
			List<LoginInfo> questions = (List<LoginInfo>) query.list();
			if (null != questions && !questions.isEmpty()) {
				return questions;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public String count() {
		Query query = null;
		if (SecurityUtils.getRole().getUserRoleId() == 2) {
			query = getSession().createQuery("from LoginInfo l where l.active='Y'");
		} else {
			query = getSession().createQuery("from LoginInfo l where l.active='Y'");
		}
		Long count = (long) query.list().size();
		return String.valueOf(count);
	}

	@Override
	public LoginInfo register(LoginInfo loginInfo) {
		getSession().save(loginInfo);
		return loginInfo;
	}

	@Override
	public LoginInfo getUserByRoleId(Integer roleID) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("roleId.userRoleId", roleID));
		List<LoginInfo> users = (List<LoginInfo>) criteria.list();
		if (null != users && !users.isEmpty()) {
			return users.get(0);
		}
		return null;
	}

}
