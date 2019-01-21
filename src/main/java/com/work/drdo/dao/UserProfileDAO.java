package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.UserProfile;

public interface UserProfileDAO {
	public com.work.drdo.executive.entity.UserProfile selectByUserId(String userName);

	public int maxId();

	public void merge(UserProfile entity);

	public UserProfile getReference(int id);

	public void remove(UserProfile entity);

	public UserProfile find(Integer id);

	public List<UserProfile> find(Boolean flag, Integer max, Integer first);

	public String count();

	public String saveProfile(UserProfile userProfile);

	public List<UserProfile> findUserProfileByFormationIdAndRoleId(Integer formationId, Integer roleId);

	public Integer findRoleByProfileId(Integer profileId);

	public List<UserProfile> findUserProfileByRoleId(Integer roleId);

	public List<UserProfile> getUserProfileByGroupId(Integer groupId);

	public List<UserProfile> getUserProfileByDeptId(Integer deptId);

	public String groupMemberCount(Integer groupId);

	public String departmentMemberCount(Integer deptId);

	public com.work.drdo.executive.entity.UserProfile updateProfile(com.work.drdo.executive.entity.UserProfile profile);

	public com.work.drdo.executive.entity.UserProfile registerProfile(
			com.work.drdo.executive.entity.UserProfile profile);

	public UserProfile findUserProfileByGroupId(Integer groupId, Integer roleId);
}
