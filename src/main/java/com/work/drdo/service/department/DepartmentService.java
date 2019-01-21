package com.work.drdo.service.department;

import java.util.List;

import com.work.drdo.domain.questionnaire.DepartmentVO;
import com.work.drdo.executive.entity.Department;

public interface DepartmentService {
	public List<DepartmentVO> findAll();
	public List<Department> getAllDept();
	public Department getDeptById(Integer deptId);
	public DepartmentVO find(Integer id);	
	public String saveDept(DepartmentVO departmentVO);
	public void updateDepartment(DepartmentVO departmentVO);
	public void deleteDeptById(int id);
	public List<DepartmentVO> getDeptByDivisionId(Integer divisionId);
}
