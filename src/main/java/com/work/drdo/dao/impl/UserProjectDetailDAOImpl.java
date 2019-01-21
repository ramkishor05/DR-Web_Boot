package com.work.drdo.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.UserProjectDetailDAO;
import com.work.drdo.executive.entity.UserProjectDetail;

@Transactional
@Repository("userProjectDAO")
public class UserProjectDetailDAOImpl extends AbstractDao<Serializable, UserProjectDetail> implements UserProjectDetailDAO{

	@Override
	public void saveOrupdate(UserProjectDetail entity) {
		super.merge(entity);
	}
}
