package com.work.drdo.dao;

import com.work.drdo.executive.entity.UserFile;

public interface UserFileDAO {
	public String saveFile(UserFile entity);

	public void merge(UserFile entity);

	public UserFile getReference(Integer fileID);

}
