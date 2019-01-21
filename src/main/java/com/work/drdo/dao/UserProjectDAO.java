package com.work.drdo.dao;

import com.work.drdo.executive.entity.UserProject;

public interface UserProjectDAO {

	public void saveOrupdate(UserProject entity);
	
	public void merge(UserProject entity);
}
