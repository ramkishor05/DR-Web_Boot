package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.DepartmentVO;
import com.work.drdo.executive.entity.Department;
import com.work.drdo.executive.entity.Division;

public class DepartmentMapper {
	
	public static DepartmentVO mapFromDB(Department dept){
		DepartmentVO departmentVO = new DepartmentVO();
		departmentVO.setDepartmentId(dept.getDeptId());
		departmentVO.setDepartmentName(dept.getDeptName());
		departmentVO.setDeptDescription(dept.getDeptDescription());
		departmentVO.setDivisionId(dept.getDivision().getDivisionId().toString());
		return departmentVO;
	}

	public static Department mapToDB(DepartmentVO departmentVO, Division division){
		Department department = new Department();
		department.setDeptId(departmentVO.getDepartmentId());
		department.setDeptName(departmentVO.getDepartmentName());
		department.setDeptHead(departmentVO.getDeptHead());
		department.setDeptDescription(departmentVO.getDeptDescription());
		department.setDivision(division);
		return department;
	}
}
