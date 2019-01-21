package com.work.drdo.dao.impl;

import org.springframework.stereotype.Repository;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.ManpowerDetailDAO;
import com.work.drdo.executive.entity.Manpower;

@Repository("manpowerDetailDAO")
public class ManpowerDetailDAOImpl extends AbstractDao<Integer, Manpower> implements ManpowerDetailDAO {

	@Override
	public Manpower createManpower(Manpower manpowerDetail) {
		this.getSession().save(manpowerDetail);
		return manpowerDetail;
	}

	@Override
	public Manpower updateManpower(Manpower manpowerDetail) {
		this.getSession().merge(manpowerDetail);
		return manpowerDetail;
	}
}
