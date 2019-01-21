package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Division;

public interface DivisionDAO {
	public Division getDivision(Integer id);

	public Division save(Division entity);

	public void merge(Division entity);

	public void remove(Division entity);

	public Division find(Integer id);

	public List<Division> findAll();

	public String count();

	public List<Division> find(Boolean all, Integer max, Integer first);

	public List<Division> findDivisionList(Integer commissionerateId);

	public List<Division> getDivisionList(String divisionId);
}
