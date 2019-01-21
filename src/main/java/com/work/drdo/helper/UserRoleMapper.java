package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.UserRoleVO;

public class UserRoleMapper {
	public static UserRoleVO mapFromDB(com.work.drdo.executive.entity.UserRole role) {
		UserRoleVO userRoleVO = new UserRoleVO();
		userRoleVO.setComment(role.getComment());
		userRoleVO.setUserRoleId(role.getUserRoleId());
		userRoleVO.setUserRoleName(role.getUserRoleName());
		return userRoleVO;
	}
}
