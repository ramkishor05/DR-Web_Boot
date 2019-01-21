package com.work.drdo.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.UserFileDAO;
import com.work.drdo.executive.entity.UserFile;

@Repository("fileDAO")
public class UserFileDAOImpl extends AbstractDao<Integer, UserFile> implements UserFileDAO {
	Logger logger = Logger.getLogger(UserFileDAOImpl.class);

	@Override
	@Transactional
	public String saveFile(UserFile entity) {
		try {
			persist(entity);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return String.valueOf(entity.getUserFileId());
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public UserFile getReference(Integer userFileId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("userFileId", userFileId));
		List<UserFile> file = (List<UserFile>) criteria.list();
		if (null != file && !file.isEmpty()) {
			return file.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public void merge(UserFile entity) {
		try {
			update(entity);
		} catch (Exception ex) {
			ex.getMessage();
		}

	}

}
