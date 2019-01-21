package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.DivisionDAO;
import com.work.drdo.executive.entity.Division;

@Repository("divisionDAO")
public class DivisionDAOImpl extends AbstractDao<Integer, Division> implements DivisionDAO {
	Logger logger = Logger.getLogger(DivisionDAOImpl.class);

	@Override
	public Division getDivision(Integer id) {
		Division divisionDetail = getByKey(id);
		return divisionDetail;
	}

	@Override
	public Division save(Division entity) {
		try {
			if (null != entity.getDivisionId()) {
				saveOrupdate(entity);
			} else {
				persist(entity);
			}
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return entity;
	}

	@Override
	public void merge(Division entity) {
		try {
			update(entity);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
	}
	
	@Override
	public void remove(Division entity) {
		delete(entity);

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Division> find(Boolean all, Integer max, Integer first) {
		if (all) {
			Criteria criteria = createEntityCriteria();
			List<Division> allPage = criteria.list();
			return allPage;
		} else {
			Criteria criteria = createEntityCriteria();
			criteria.setFirstResult(first);
			criteria.setMaxResults(max);
			List<Division> firstPage = criteria.list();
			return firstPage;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Division find(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("divsionId", id));
		List<Division> division = (List<Division>) criteria.list();
		if (null != division && !division.isEmpty()) {
			return division.get(0);
		}
		return null;
	}

	@Override
	public String count() {
		Criteria criteriaCount = createEntityCriteria();
		criteriaCount.setProjection(Projections.rowCount());
		Long count = (Long) criteriaCount.uniqueResult();
		return String.valueOf(count);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Division> findDivisionList(Integer commissionerateId){
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("commissionerateId.commissionerateId", commissionerateId));
		List<Division> commissionerate = (List<Division>) criteria.list();
		if (null != commissionerate && !commissionerate.isEmpty()) {
			return commissionerate;
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Division> getDivisionList(String divisionId){
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("divsionId", Integer.parseInt(divisionId)));
		List<Division> commissionerate = (List<Division>) criteria.list();
		if (null != commissionerate && !commissionerate.isEmpty()) {
			return commissionerate;
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Division> findAll() {
		Criteria crit = createEntityCriteria();
		List<Division> division = (List<Division>) crit.list();
		if(null !=division && !division.isEmpty()){
			return division;
		}
		return null;
	}
}
