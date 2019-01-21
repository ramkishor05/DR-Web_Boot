package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.RecipentDAO;
import com.work.drdo.executive.entity.Recipent;

@Repository("recipentDAO")
public class RecipentDAOImpl extends AbstractDao<Integer, Recipent> implements RecipentDAO{
	Logger logger = Logger.getLogger(RecipentDAOImpl.class);
	@Override
	public String save(Recipent entity) {
		try {
			persist(entity);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return String.valueOf(entity.getRecipentId());
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Recipent findById(Integer recipientId) {
		StringBuffer query = new StringBuffer("from Recipent l where l.recipentId="+recipientId);
		Query criteria = getSession().createQuery(query.toString());
		List<Recipent> questions = (List<Recipent>) criteria.list();
		if (null != questions && !questions.isEmpty()) {
			return questions.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Recipent> findByDiaryId(Integer diaryId) {
		StringBuffer query = new StringBuffer("from Recipent l where l.recipentFor.diaryId="+diaryId);
		Query criteria = getSession().createQuery(query.toString());
		List<Recipent> questions = (List<Recipent>) criteria.list();
		if (null != questions && !questions.isEmpty()) {
			return questions;
		}
		return null;
	}

	@Override
	@Transactional
	public void deleteRecipientById(Recipent entity) {
		delete(entity);
	}

}
