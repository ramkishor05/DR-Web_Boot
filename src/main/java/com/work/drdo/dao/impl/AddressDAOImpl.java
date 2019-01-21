package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.AddressDAO;
import com.work.drdo.executive.entity.Address;

@Repository("addressDAO")
public class AddressDAOImpl extends AbstractDao<Integer, Address> implements AddressDAO {
	Logger logger = Logger.getLogger(AddressDAOImpl.class);

	@Override
	@Transactional
	public String saveAddress(Address address) {
		try {
			persist(address);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return String.valueOf(address.getAddressId());
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Address getReference(int id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("addressId", id));
		List<Address> address = (List<Address>) criteria.list();
		if (null != address && !address.isEmpty()) {
			return address.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public void merge(Address entity) {
		try {
			update(entity);
		} catch (Exception ex) {
			ex.getMessage();
		}

	}

	@Override
	@Transactional
	public void remove(Address entity) {
		delete(entity);

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Address find(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("addressId", id));
		List<Address> mark = (List<Address>) criteria.list();
		if (null != mark && !mark.isEmpty()) {
			return mark.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Address> find(Boolean all, Integer max, Integer first) {
		if (all) {
			Criteria criteria = createEntityCriteria();
			List<Address> allPage = criteria.list();
			return allPage;
		} else {
			Criteria criteria = createEntityCriteria();
			criteria.setFirstResult(first);
			criteria.setMaxResults(max);
			List<Address> firstPage = criteria.list();
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

	@Override
	public Address registerAddress(Address address) {
		getSession().save(address);
		return address;
	}

	@Override
	public Address updateAddress(Address address) {
		getSession().merge(address);
		return address;
	}
}
