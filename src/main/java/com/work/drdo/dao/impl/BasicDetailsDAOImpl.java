package com.work.drdo.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.BasicDetailsDAO;
import com.work.drdo.executive.entity.BasicDetail;

@Transactional
@Repository("basicDetailsDAO")
public class BasicDetailsDAOImpl extends AbstractDao<Integer, BasicDetail>  implements BasicDetailsDAO {

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public BasicDetail getReference(Integer basicDetailId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("basicDetailId", basicDetailId));
		List<BasicDetail> address = (List<BasicDetail>) criteria.list();
		if (null != address && !address.isEmpty()) {
			return address.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public void merge(BasicDetail entity) {
		try {
			super.merge(entity);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	@Override
	public String saveProfile(BasicDetail basicDetail) {
		try {
			merge(basicDetail);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return String.valueOf(basicDetail.getBasicDetailId());
	}

	@Override
	public BasicDetail registerBasicDetail(BasicDetail basicDetail) {
		this.saveOrupdate(basicDetail);
		return basicDetail;
	}
	
	@Override
	public BasicDetail updateBasicDetail(BasicDetail basicDetail) {
		this.merge(basicDetail);
		return basicDetail;
	}
}
