package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Drdogroup;

public interface GroupDAO {
	public Drdogroup getGroup(Integer id);

	public String saveGroup(Drdogroup group);

	public List<Drdogroup> findAll();

	public void merge(Drdogroup entity);

	public Drdogroup getReference(int id);

	public void remove(Drdogroup entity);

	public Drdogroup find(Integer id);

	public List<Drdogroup> getGroupByDeptId(Integer deptId);
}
