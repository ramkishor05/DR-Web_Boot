package com.work.drdo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.drdo.dao.UserRoleDAO;
import com.work.drdo.domain.questionnaire.UserRoleVO;
import com.work.drdo.executive.entity.UserRole;
import com.work.drdo.helper.UserRoleMapper;
import com.work.drdo.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService {
	@Autowired
	UserRoleDAO userRoleDAO;

	@Override
	public List<UserRoleVO> findAll() {
		List<UserRole> userRoles = userRoleDAO.findAll();
		List<UserRoleVO> userRoleVOs = new ArrayList<UserRoleVO>();
		for (UserRole userRole : userRoles) {
			UserRoleVO userRoleVO = UserRoleMapper.mapFromDB(userRole);
			userRoleVOs.add(userRoleVO);
		}
		return userRoleVOs;
	}

	@Override
	public UserRoleVO getUserRole(Integer id) {
		UserRoleVO userRoleVO = new UserRoleVO();
		UserRole userRoles = userRoleDAO.getUserRole(id);
		if (null != userRoles) {
			userRoleVO.setUserRoleName(userRoles.getUserRoleName());
			userRoleVO.setUserRoleId(userRoles.getUserRoleId());
			userRoleVO.setComment(userRoles.getComment());
		}
		return userRoleVO;
	}

}
