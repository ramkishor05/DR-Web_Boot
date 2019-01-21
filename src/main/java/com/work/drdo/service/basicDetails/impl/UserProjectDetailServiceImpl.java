package com.work.drdo.service.basicDetails.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.UserProjectDetailDAO;
import com.work.drdo.executive.entity.UserProjectDetail;

@Service("userProjectDetailService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserProjectDetailServiceImpl implements com.work.drdo.service.basicDetails.UserProjectDetailService {

	@Autowired
	private UserProjectDetailDAO userProjectDetailDAO;

	@Override
	public UserProjectDetail addProjectDetail(UserProjectDetail projectDetail) {
		userProjectDetailDAO.saveOrupdate(projectDetail);
		return projectDetail;
	}

	@Override
	public UserProjectDetail updateProjectDetail(UserProjectDetail projectDetail) {
		userProjectDetailDAO.saveOrupdate(projectDetail);
		return projectDetail;
	}
	
	@Override
	public UserProjectDetail deleteProjectDetail(UserProjectDetail projectDetail) {
		return projectDetail;
	}
	
	@Override
	public UserProjectDetail getProjectDetail(UserProjectDetail projectDetail) {
		return projectDetail;
	}
}

