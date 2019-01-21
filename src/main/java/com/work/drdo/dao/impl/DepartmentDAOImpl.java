package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.DepartmentDAO;
import com.work.drdo.executive.entity.Department;

@Repository("departmentDAO")
public class DepartmentDAOImpl extends AbstractDao<Integer, Department> implements DepartmentDAO {

	Logger logger = Logger.getLogger(DepartmentDAOImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	public List<Department> findAll() {
		Criteria criteria = createEntityCriteria();
		List<Department> address = (List<Department>) criteria.list();
		if (null != address && !address.isEmpty()) {
			return address;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Department find(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("deptId", id));
		List<Department> mark = (List<Department>) criteria.list();
		if (null != mark && !mark.isEmpty()) {
			return mark.get(0);
		}
		return null;
	}

	@Override
	public String saveDepartment(Department dept) {
		try {
			persist(dept);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return String.valueOf(dept.getDeptId());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Department getDepartment(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("deptId", id));
		List<Department> dept = (List<Department>) criteria.list();
		if (null != dept && !dept.isEmpty()) {
			return dept.get(0);
		}
		return null;
	}

	@Override
	public void remove(Department entity) {
		delete(entity);

	}

	@Override
	@Transactional
	public void merge(Department entity) {
		try {
			update(entity);
		} catch (Exception ex) {
			ex.getMessage();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getDeptByDivisionId(Integer divisionId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("divisionId.divsionId", divisionId));
		List<Department> dept = (List<Department>) criteria.list();
		if (null != dept && !dept.isEmpty()) {
			return dept;
		}
		return null;

	}

}
