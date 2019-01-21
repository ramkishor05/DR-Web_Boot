package com.work.drdo.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.UserRoleDAO;
import com.work.drdo.executive.entity.UserRole;
@Transactional
@Repository("userRoleDAO")
public class UserRoleDAOImpl extends AbstractDao<Integer, UserRole> implements UserRoleDAO{

	@SuppressWarnings("unchecked")
	@Override
	public UserRole getUserRole(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("userRoleId", id));
		List<UserRole> users = (List<UserRole>) criteria.list();
		if(null!=users && !users.isEmpty()){
			return users.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserRole> findAll() {
		Query criteria = getSession().getNamedQuery("UserRole.findAll");
		List<UserRole> allPage = criteria.list();
		return allPage;
	}

}
