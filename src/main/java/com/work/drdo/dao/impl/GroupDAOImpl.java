package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.GroupDAO;
import com.work.drdo.executive.entity.Drdogroup;

@Transactional
@Repository("groupDAO")
public class GroupDAOImpl extends AbstractDao<Integer, Drdogroup> implements
		GroupDAO {

	Logger logger = Logger.getLogger(GroupDAOImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	public Drdogroup getGroup(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("groupId", id));
		List<Drdogroup> group = (List<Drdogroup>) criteria.list();
		if (null != group && !group.isEmpty()) {
			return group.get(0);
		}
		return null;
	}

	@Override
	public String saveGroup(Drdogroup group) {
		try {
			persist(group);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return String.valueOf(group.getGroupId());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Drdogroup> findAll() {
		Criteria crit = createEntityCriteria();
		//crit.add(Restrictions.ne("groupId", 1));
		return (List<Drdogroup>) crit.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Drdogroup getReference(int id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("groupId", id));
		List<Drdogroup> address = (List<Drdogroup>) criteria.list();
		if (null != address && !address.isEmpty()) {
			return address.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public void merge(Drdogroup entity) {
		try {
			update(entity);
		} catch (Exception ex) {
			ex.getMessage();
		}

	}

	@Override
	@Transactional
	public void remove(Drdogroup entity) {
		delete(entity);

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Drdogroup find(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("groupId", id));
		List<Drdogroup> mark = (List<Drdogroup>) criteria.list();
		if (null != mark && !mark.isEmpty()) {
			return mark.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Drdogroup> getGroupByDeptId(Integer deptId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("deptId.deptId", deptId));
		List<Drdogroup> dept = (List<Drdogroup>) criteria.list();
		if (null != dept && !dept.isEmpty()) {
			return dept;
		}
		return null;
	}
}
