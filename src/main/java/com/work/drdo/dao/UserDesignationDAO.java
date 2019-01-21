package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.UserDesignation;

public interface UserDesignationDAO {
	public List<UserDesignation> findAll();

	public UserDesignation find(Integer id);

	public UserDesignation getDesignation(Integer id);

	public String saveDesignation(UserDesignation group);

	public void merge(UserDesignation entity);

	public void remove(UserDesignation entity);

	public List<UserDesignation> getDesignationByDivisionId(Integer divisionId);
}