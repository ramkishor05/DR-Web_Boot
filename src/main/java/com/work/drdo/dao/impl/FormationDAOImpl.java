package com.work.drdo.dao.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.FormationDAO;
import com.work.drdo.executive.entity.Formation;

@Transactional
@Repository("formationDAO")
public class FormationDAOImpl extends AbstractDao<Integer, Formation> implements FormationDAO {

	Logger logger = Logger.getLogger(FormationDAOImpl.class);

	@Override
	public Formation saveFormation(Formation formation){
		try {
			getSession().save(formation);
		} catch (Exception ex) {
			logger.error(ex.getMessage());
		}
		return formation;
	}

	@Override
	public Formation updateFormation(Formation formation) {
		getSession().evict(formation);
		getSession().saveOrUpdate(formation);
		return formation;
	}

	
}
