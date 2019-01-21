package com.work.drdo.service.designation;

import java.util.List;

import com.work.drdo.executive.entity.UserDesignation;

public interface UserDesignationService {
	public UserDesignation saveDesignation(UserDesignation designation);

	public UserDesignation updateDesignation(UserDesignation designation);

	public UserDesignation findById(Integer id);

	public List<UserDesignation> findAll();

}