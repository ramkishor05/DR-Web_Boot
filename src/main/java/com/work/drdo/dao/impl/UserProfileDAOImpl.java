package com.work.drdo.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.LoginInfoDAO;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.UserProfile;

@Transactional
@Repository("profileDao")
public class UserProfileDAOImpl extends AbstractDao<Integer, UserProfile> implements UserProfileDAO {
	@Autowired
	LoginInfoDAO loginDAO;

	@Override
	public String saveProfile(UserProfile userProfile) {

		try {
			merge(userProfile);
		} catch (Exception ex) {
		}
		return String.valueOf(userProfile.getProfileId());
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public com.work.drdo.executive.entity.UserProfile selectByUserId(String userName) {
		Query criteria = getSession().getNamedQuery("UserProfile.findByUserName") ;
		try{
		criteria.setString("userName", userName);
		List<UserProfile> users = (List<UserProfile>) criteria.list();
		if (null != users && !users.isEmpty()) {
			return users.get(0);
		}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public int maxId() {
		Criteria criteria = createEntityCriteria();
		criteria.setProjection(Projections.max("profileId"));
		return (Integer) criteria.uniqueResult() + 1;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public UserProfile getReference(int id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("profileId", id));
		List<UserProfile> address = (List<UserProfile>) criteria.list();
		if (null != address && !address.isEmpty()) {
			return address.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public void merge(UserProfile entity) {
		try {
			super.merge(entity);
		} catch (Exception ex) {
			ex.getMessage();
		}

	}

	@Override
	@Transactional
	public void remove(UserProfile entity) {
		delete(entity);

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public UserProfile find(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("profileId", id));
		List<UserProfile> mark = (List<UserProfile>) criteria.list();
		if (null != mark && !mark.isEmpty()) {
			return mark.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<UserProfile> find(Boolean all, Integer max, Integer first) {
		Criteria criteria = createEntityCriteria();
		if (all) {
			List<UserProfile> allPage = criteria.list();
			return allPage;
		} else {
			criteria.setFirstResult(first);
			criteria.setMaxResults(max);
			List<UserProfile> firstPage = criteria.list();
			return firstPage;
		}
	}

	@Override
	public String count() {
		Criteria criteriaCount = createEntityCriteria();
		criteriaCount.setProjection(Projections.rowCount());
		Long count = (Long) criteriaCount.uniqueResult();
		return String.valueOf(count);
	}

	@SuppressWarnings("unchecked")
	public List<UserProfile> findUserProfileByFormationIdAndRoleId(Integer formationId, Integer roleId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("formationId", formationId));
		criteria.add(Restrictions.eq("roleId.userRoleId", roleId));
		List<UserProfile> userProfileList = (List<UserProfile>) criteria.list();
		if (null != userProfileList && !userProfileList.isEmpty()) {
			return userProfileList;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public Integer findRoleByProfileId(Integer profileId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("profileId", profileId));
		List<UserProfile> userProfile = (List<UserProfile>) criteria.list();
		return userProfile.get(0).getRoleId().getUserRoleId();
	}

	@SuppressWarnings("unchecked")
	public List<UserProfile> findUserProfileByRoleId(Integer roleId) {
		try{
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("roleId.userRoleId", roleId));
		List<UserProfile> userProfileList = (List<UserProfile>) criteria.list();
		if (null != userProfileList && !userProfileList.isEmpty()) {
			return userProfileList;
		}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserProfile> getUserProfileByGroupId(Integer groupId) {
		try{
			Query query =  getSession().createQuery("from UserProfile l where l.groupId="+groupId);
			List<UserProfile> profileList = (List<UserProfile>) query.list();
			if (null != profileList && !profileList.isEmpty()) {
				return profileList;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<UserProfile> getUserProfileByDeptId(Integer deptId) {
		try{
			Query query =  getSession().createQuery("from UserProfile l where l.departmentId="+deptId);
			List<UserProfile> profileList = (List<UserProfile>) query.list();
			if (null != profileList && !profileList.isEmpty()) {
				return profileList;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	public String groupMemberCount(Integer groupId){
		Query query = getSession().createQuery("from UserProfile user where user.groupId="+groupId);
		Long count = (long) query.list().size();
		return String.valueOf(count);
	}
	
	public String departmentMemberCount(Integer deptId){
		Query query = getSession().createQuery("from UserProfile user where user.departmentId="+deptId);
		Long count = (long) query.list().size();
		return String.valueOf(count);
	}

	@Override
	public UserProfile updateProfile(UserProfile profile) {
		getSession().merge(profile);
		return profile;
	}

	@Override
	public UserProfile registerProfile(UserProfile profile) {
		getSession().save(profile);
		return profile;
	}

	@Override
	public UserProfile findUserProfileByGroupId(Integer groupId, Integer roleId) {
		Query query =  getSession().getNamedQuery("LoginInfo.findByRoleIdGroupId");
		query.setParameter("roleId", roleId);
		query.setParameter("groupId", groupId);
		List<LoginInfo> loginInfos = (List<LoginInfo>) query.list();
		if (null != loginInfos && !loginInfos.isEmpty()) {
			return loginInfos.get(0).getProfile();
		}
		return null;
	}
}
