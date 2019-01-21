package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.DiaryDAO;
import com.work.drdo.executive.entity.UserDiary;

@Repository("diaryDAO")
public class DiaryDAOImpl extends AbstractDao<Integer, UserDiary> implements DiaryDAO {
	Logger logger = Logger.getLogger(DiaryDAOImpl.class);

	@Override
	@Transactional
	public String saveDiary(UserDiary entity) {
		try {
			persist(entity);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return String.valueOf(entity.getDiaryId());
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public UserDiary getReference(Integer diaryID) {
		try{
			StringBuffer query = new StringBuffer("from UserDiary l where l.diaryId="+diaryID);
			Query criteria = getSession().createQuery(query.toString());
			List<UserDiary> questions = (List<UserDiary>) criteria.list();
			if (null != questions && !questions.isEmpty()) {
				return questions.get(0);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	@Transactional
	public void merge(UserDiary entity) {
		try {
			update(entity);
		} catch (Exception ex) {
			ex.getMessage();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserDiary> getDiaryListByProfileId(Integer profileId) {
		try{
			Criteria criteria = createEntityCriteria();
			criteria.add(Restrictions.eq("createdBy.profileId", profileId));
			List<UserDiary> diary = (List<UserDiary>) criteria.list();
			if (null != diary && !diary.isEmpty()) {
				return diary;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
}
