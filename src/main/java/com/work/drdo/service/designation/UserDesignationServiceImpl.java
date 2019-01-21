package com.work.drdo.service.designation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.drdo.dao.UserDesignationDAO;
import com.work.drdo.executive.entity.UserDesignation;

@Service("userDesignationService")
public class UserDesignationServiceImpl implements UserDesignationService{

	@Autowired
	private UserDesignationDAO userDesignationDAO;
	
	@Override
	public UserDesignation saveDesignation(UserDesignation designation) {
		userDesignationDAO.saveDesignation(designation);
		return designation;
	}
	

	@Override
	public UserDesignation updateDesignation(UserDesignation designation) {
		userDesignationDAO.saveDesignation(designation);
		return designation;
	}

	@Override
	public UserDesignation findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserDesignation> findAll() {
		// TODO Auto-generated method stub
		return null;
	}


}
