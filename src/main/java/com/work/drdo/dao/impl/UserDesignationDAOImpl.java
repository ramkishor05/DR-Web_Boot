package com.work.drdo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.UserDesignationDAO;
import com.work.drdo.executive.entity.UserDesignation;
@Transactional
@Repository("userDesignationDAO")
public class UserDesignationDAOImpl extends AbstractDao<Integer, UserDesignation> implements UserDesignationDAO {

	@Override
	public List<UserDesignation> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDesignation find(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDesignation getDesignation(Integer id) {
		return null;
	}

	@Override
	public String saveDesignation(UserDesignation entity) {
		super.merge(entity);
		return String.valueOf(entity.getId());
	}

	@Override
	public void merge(UserDesignation entity) {
		super.merge(entity);
	}

	@Override
	public void remove(UserDesignation entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<UserDesignation> getDesignationByDivisionId(Integer divisionId) {
		// TODO Auto-generated method stub
		return null;
	}

}
