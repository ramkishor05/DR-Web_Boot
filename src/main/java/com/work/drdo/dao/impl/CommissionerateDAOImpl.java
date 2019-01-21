package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.CommissionerateDAO;
import com.work.drdo.executive.entity.Commissionerate;

@Repository("commissionerateDAO")
public class CommissionerateDAOImpl extends AbstractDao<Integer, Commissionerate> implements CommissionerateDAO {
	Logger logger = Logger.getLogger(CommissionerateDAOImpl.class);

	@Override
	public Commissionerate getCommissionerate(Integer id) {
		Commissionerate commissionerateDetail = getByKey(id);
		return commissionerateDetail;
	}

	@Override
	public Commissionerate save(Commissionerate entity) {
		try {
			if (null != entity.getCommissionerateId()) {
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
	public void merge(Commissionerate entity) {
		try {
			merge(entity);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}

	}

	@Override
	public void remove(Commissionerate entity) {
		delete(entity);

	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Commissionerate> find(Boolean all, Integer max, Integer first) {
		if (all) {
			Criteria criteria = createEntityCriteria();
			criteria.add(Restrictions.ne("commissionerateId", 1));
			List<Commissionerate> allPage = criteria.list();
			return allPage;
		} else {
			Criteria criteria = createEntityCriteria();
			criteria.add(Restrictions.ne("commissionerateId", 1));
			criteria.setFirstResult(first);
			criteria.setMaxResults(max);
			List<Commissionerate> firstPage = criteria.list();
			return firstPage;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Commissionerate find(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("commissionerateId", id));
		List<Commissionerate> commissionerate = (List<Commissionerate>) criteria.list();
		if (null != commissionerate && !commissionerate.isEmpty()) {
			return commissionerate.get(0);
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
	public List<Commissionerate> findCommissionerateList(String zoneId){
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("zoneId.zoneId", Integer.parseInt(zoneId)));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<Commissionerate> commissionerate = (List<Commissionerate>) criteria.list();
		if (null != commissionerate && !commissionerate.isEmpty()) {
			return commissionerate;
		}
		return null;
	}
	
}
