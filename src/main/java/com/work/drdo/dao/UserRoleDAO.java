package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.UserRole;

public interface UserRoleDAO {
	UserRole getUserRole(Integer id);

	public List<UserRole> findAll();
}
