package com.work.drdo.service.basicDetails.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.UserProjectDAO;
import com.work.drdo.executive.entity.UserProject;
import com.work.drdo.service.basicDetails.UserProjectService;

@Service("userProjectService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserProjectServiceImpl implements UserProjectService {

	@Autowired
	private UserProjectDAO userProjectDAO;

	@Override
	public UserProject addProject(UserProject userProject) {
		userProjectDAO.saveOrupdate(userProject);
		return userProject;
	}
	@Override
	public UserProject updateProject(UserProject userProject) {
		userProjectDAO.saveOrupdate(userProject);
		return userProject;
	}
	@Override
	public UserProject deleteProject(UserProject userProject) {
		return null;

	}
	@Override
	public UserProject getProject(UserProject userProject) {
		return null;
	}
}


