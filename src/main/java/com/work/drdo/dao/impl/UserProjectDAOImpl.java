package com.work.drdo.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.UserProjectDAO;
import com.work.drdo.executive.entity.UserProject;

@Transactional
@Repository("userProjectDetailDAO")
public class UserProjectDAOImpl extends AbstractDao<Serializable, UserProject> implements UserProjectDAO{
	@Override
	public void saveOrupdate(UserProject entity) {
		getSession().evict(entity);
		super.saveOrupdate(entity);
	}
}
