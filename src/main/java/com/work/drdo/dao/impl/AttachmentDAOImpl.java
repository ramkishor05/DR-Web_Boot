package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.AttachmentDAO;
import com.work.drdo.executive.entity.Attachment;

@Repository("attachmentDAO")
public class AttachmentDAOImpl extends AbstractDao<Integer, Attachment> implements AttachmentDAO {
	Logger logger = Logger.getLogger(AttachmentDAOImpl.class);

	 public String saveAttachments(Attachment attachmentDetail) {
		try {
		    persist(attachmentDetail);
		} catch (Exception ex) {
		    ex.printStackTrace();
		}
		return String.valueOf(attachmentDetail.getAttachmentId());
    }

    @SuppressWarnings("unchecked")
    public List<Attachment> findAll() {
		Criteria crit = createEntityCriteria();
		return (List<Attachment>) crit.list();
    }
    
    public void update(Attachment attachmentDetail) {
    	try {
    	    merge(attachmentDetail);
    	} catch (Exception ex) {
    	    logger.error("Exception during update question with attachment" + ex.getMessage());
    	}
    }
		        
    @SuppressWarnings("unchecked")
	public void deleteById(int id) {
    	StringBuffer query = new StringBuffer("from Attachment a where ");
		query.append(" a.attachmentId ="+id);
		Query criteria = getSession().createQuery(query.toString());
		List<Attachment> allPage = criteria.list();
		delete(allPage.get(0));
    }

	@SuppressWarnings("unchecked")
	public Attachment findById(int id) {
		StringBuffer query = new StringBuffer("from Attachment a where ");
		query.append(" a.attachmentId ="+id);
		Query criteria = getSession().createQuery(query.toString());
		List<Attachment> allPage = criteria.list();
		if (null != allPage && !allPage.isEmpty()) {
			return allPage.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Attachment> findAttachmentByFileId(Integer fileId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("fileId.userFileId", fileId));
		List<Attachment> attachment = (List<Attachment>) criteria.list();
		if (null != attachment && !attachment.isEmpty()) {
			return attachment;
		}
		return null;
	}

}
