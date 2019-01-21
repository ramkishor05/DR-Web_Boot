package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.AssignmentDAO;
import com.work.drdo.executive.entity.Assignment;

@Repository("assignmentDAO")
public class AssignmentDAOImpl extends AbstractDao<Integer, Assignment> implements AssignmentDAO {
	Logger logger = Logger.getLogger(AssignmentDAOImpl.class);

	@Override
	@Transactional
	public void assignDiary(Assignment entity) {
		try {
			persist(entity);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
	}
	
	@Override
	@Transactional
	public void merge(Assignment entity) {
		try {
			update(entity);
		} catch (Exception ex) {
			ex.getMessage();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Assignment> getAssignmentByProfileId(Integer profileId) {
		try{
		Query criteria =getSession().getNamedQuery("Assignment.findByAssignId");
		criteria.setParameter("profileId", profileId);
		criteria.setParameter("columnActive", "Y");
		List<Assignment> file = (List<Assignment>) criteria.list();
		System.out.println("file="+file);
		if (null != file && !file.isEmpty()) {
			return file;
		}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Assignment getAssignmentById(Integer assignmentId) {
		try{
			Criteria criteria = createEntityCriteria();
			criteria.add(Restrictions.eq("assignmentId", assignmentId));
			List<Assignment> file = (List<Assignment>) criteria.list();
			if (null != file && !file.isEmpty()) {
				return file.get(0);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Assignment getAssignmentByDiaryIdAndStatus(Integer diaryId) {
		try{
			Criteria criteria = createEntityCriteria();
			criteria.add(Restrictions.eq("diaryId.diaryId", diaryId));
			criteria.add(Restrictions.eq("columnActive", "Y"));
			List<Assignment> file = (List<Assignment>) criteria.list();
			if (null != file && !file.isEmpty()) {
				return file.get(0);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Assignment> getApprovedDiaryAssignment(Integer assignFrom) {
		try{
			Criteria criteria = createEntityCriteria();
			criteria.add(Restrictions.eq("assignFrom.profileId", assignFrom));
			criteria.add(Restrictions.eq("approvalStatus", "Y"));
			List<Assignment> file = (List<Assignment>) criteria.list();
			if (null != file && !file.isEmpty()) {
				return file;
			}
			}catch(Exception ex){
				ex.printStackTrace();
			}
			return null;
	}

}
