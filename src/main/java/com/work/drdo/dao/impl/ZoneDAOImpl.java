package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.ZoneDAO;
import com.work.drdo.executive.entity.Zone;

@Repository("zoneDAO")
public class ZoneDAOImpl extends AbstractDao<Integer, Zone> implements ZoneDAO {
	Logger logger = Logger.getLogger(ZoneDAOImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	public Zone getZone(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("zoneId", id));
		List<Zone> zone = (List<Zone>) criteria.list();
		if (null != zone && !zone.isEmpty()) {
			return zone.get(0);	
		}
		return null;
	}

	@Override
	public String saveZone(Zone zone) {
		try {
			persist(zone);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return String.valueOf(zone.getZoneId());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Zone> findAll() {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.ne("zoneId", 1));
		return (List<Zone>) crit.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Zone> findZoneByDeptId(Integer deptId){
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("departmentId.departmentId", deptId));
		return (List<Zone>) crit.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Zone getReference(int id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("zoneId", id));
		List<Zone> address = (List<Zone>) criteria.list();
		if (null != address && !address.isEmpty()) {
			return address.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public void merge(Zone entity) {
		try {
			update(entity);
		} catch (Exception ex) {
			ex.getMessage();
		}

	}

	@Override
	@Transactional
	public void remove(Zone entity) {
		delete(entity);

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Zone find(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("zoneId", id));
		List<Zone> mark = (List<Zone>) criteria.list();
		if (null != mark && !mark.isEmpty()) {
			return mark.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Zone> find(Boolean all, Integer max, Integer first) {
		Criteria criteria = createEntityCriteria();
		if (all) {
			criteria.add(Restrictions.ne("zoneId", 1));
			List<Zone> allPage = criteria.list();
			return allPage;
		} else {
			criteria.add(Restrictions.ne("zoneId", 1));
			criteria.setFirstResult(first);
			criteria.setMaxResults(max);
			List<Zone> firstPage = criteria.list();
			return firstPage;
		}
	}

	@Override
	public String count() {
		Criteria criteriaCount = createEntityCriteria();
		criteriaCount.setProjection(Projections.rowCount());
		Long count = (Long) criteriaCount.uniqueResult();
		return String.valueOf(count);
	}

}
