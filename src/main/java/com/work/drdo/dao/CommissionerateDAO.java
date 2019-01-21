package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Commissionerate;

public interface CommissionerateDAO {
	public Commissionerate getCommissionerate(Integer id);
	public Commissionerate save(Commissionerate entity);
	public void merge(Commissionerate entity);
	public void remove(Commissionerate entity);
	public Commissionerate find(Integer id);
	public String count();
	public List<Commissionerate> find(Boolean all, Integer max, Integer first);
	public List<Commissionerate> findCommissionerateList(String zoneId);
}
