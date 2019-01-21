package com.work.drdo.service.department.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.work.drdo.dao.DepartmentDAO;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.questionnaire.DepartmentVO;
import com.work.drdo.executive.entity.Department;
import com.work.drdo.executive.entity.Division;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.helper.DepartmentMapper;
import com.work.drdo.service.department.DepartmentService;
import com.work.drdo.service.division.DivisionService;

@Service(value="departmentService")
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDAO departmentDAO;
	@Autowired
    private UserProfileDAO profileDao;
	@Autowired
	private DivisionService divisionService;
	
	@Override
	public List<DepartmentVO> findAll() {		
		List<Department> departmentList = departmentDAO.findAll();
		List<DepartmentVO> departmentVOList = new ArrayList<DepartmentVO>();
		if(!CollectionUtils.isEmpty(departmentList))
		for(Department department : departmentList){
			departmentVOList.add(DepartmentMapper.mapFromDB(department));
		}
		return departmentVOList;
	}

	@Override
	public DepartmentVO find(Integer id) {
		Department department = departmentDAO.find(id);
		return DepartmentMapper.mapFromDB(department);
	}

	@Override
	public String saveDept(DepartmentVO departmentVO) {
		String deptId = null;
		try {
			Division division = divisionService.findById(Integer.parseInt(departmentVO.getDivisionId()));
			Department dept = DepartmentMapper.mapToDB(departmentVO, division);
			if (null != departmentVO.getDepartmentId()) {
				departmentDAO.merge(dept);
			} else {
				deptId = departmentDAO.saveDepartment(dept);
			}
			List<Integer> profileList = departmentVO.getProfileId();
			for(Integer profileId: profileList){
				UserProfile user = profileDao.getReference(profileId);
				user.getFormation().setDepartment(dept);
				profileDao.merge(user);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return deptId;
	}

	@Override
	public void deleteDeptById(int id) {
		departmentDAO.remove(departmentDAO.getDepartment(id));
	}

	@Override
	public List<Department> getAllDept() {
		return departmentDAO.findAll();
	}

	@Override
	public Department getDeptById(Integer deptId) {
		// TODO Auto-generated method stub
		return departmentDAO.find(deptId);
	}

	@Override
	public void updateDepartment(DepartmentVO departmentVO) {
		Division division = divisionService.findById(Integer.parseInt(departmentVO.getDivisionId()));
		Department dept = DepartmentMapper.mapToDB(departmentVO, division);
		departmentDAO.merge(dept);
		
	}

	@Override
	public List<DepartmentVO> getDeptByDivisionId(Integer divisionId) {
		List<Department> deptList = departmentDAO.getDeptByDivisionId(divisionId);
		List<DepartmentVO> deptVOList = new ArrayList<>();
		for(Department dept : deptList){
			DepartmentVO deptVO = DepartmentMapper.mapFromDB(dept);
			deptVOList.add(deptVO);
		}
		
		return deptVOList;
	}

}
