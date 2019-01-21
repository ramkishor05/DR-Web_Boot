package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Department;

public interface DepartmentDAO {
	public List<Department> findAll();

	public Department find(Integer id);

	public Department getDepartment(Integer id);

	public String saveDepartment(Department group);

	public void merge(Department entity);

	public void remove(Department entity);

	public List<Department> getDeptByDivisionId(Integer divisionId);
}
