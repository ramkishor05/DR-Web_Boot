package com.work.drdo.dao.impl;

import org.springframework.stereotype.Repository;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.UserAwardDAO;
import com.work.drdo.executive.entity.UserAward;

@Repository("userAwardDAO")
public class UserAwardDAOImpl extends AbstractDao<Integer, UserAward> implements UserAwardDAO {

	@Override
	public String saveAward(UserAward userAward) {
		this.merge(userAward);
		return String.valueOf(userAward.getId());
	}

}
