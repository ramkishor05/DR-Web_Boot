package com.work.drdo.dao.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.dao.LoginLogDAO;
import com.work.drdo.executive.entity.LoginLog;

@Repository("loginLogDAO")
public class LoginLogDAOImpl extends AbstractDao<Integer, LoginLog> implements LoginLogDAO {

	@Override
	public LoginLog saveLoginLog(LoginLog loginLog) {
		persist(loginLog);
		return loginLog;
	}

	@SuppressWarnings("unchecked")
	@Override
	public LoginLog getLoginLog(String sessionId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("sessionId", sessionId));
		List<LoginLog> log = (List<LoginLog>) criteria.list();
		if (null != log && !log.isEmpty()) {
			return log.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoginLog> getLoginLogByDate(Date filterDate, Boolean all, Integer max, Integer first) {
		Criteria criteria = createEntityCriteria();

		if (null != filterDate) {
			criteria.add(Restrictions.ge("loginAt", filterDate));
			Calendar today = Calendar.getInstance();
			today.setTime(filterDate);
			today.add(Calendar.DAY_OF_YEAR, 1);
			criteria.add(Restrictions.lt("loginAt", today.getTime()));
		}
		if (!all) {
			criteria.setFirstResult(first);
			criteria.setMaxResults(max);
		}
		criteria.addOrder(Order.desc("loginLogId"));
		List<LoginLog> log = (List<LoginLog>) criteria.list();
		if (null != log && !log.isEmpty()) {
			return log;
		}
		return null;
	}

	public void merge(LoginLog entity) {
		update(entity);
	}

	@Override
	public String loginLogCount() {
		Query query = getSession().createQuery("from LoginLog");
		Long count = (long) query.list().size();
		return String.valueOf(count);
	}

}
