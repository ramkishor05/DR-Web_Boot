package com.work.drdo.service.group.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.GroupDAO;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.questionnaire.GroupVO;
import com.work.drdo.executive.entity.Department;
import com.work.drdo.executive.entity.Drdogroup;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.helper.GroupMapper;
import com.work.drdo.service.department.DepartmentService;
import com.work.drdo.service.group.GroupService;

@Service("groupService")
@Transactional(propagation = Propagation.REQUIRED)
public class GroupServiceImpl implements GroupService {

	@Autowired
	GroupDAO groupDAO;

	@Autowired
	private UserProfileDAO profileDao;
	@Autowired
	private DepartmentService departmentService;

	@Override
	public String saveGroup(GroupVO groupVO) {
		String groupId = null;
		try {
			Department dept = departmentService.getDeptById(Integer.parseInt(groupVO.getDepartmentId()));
			Drdogroup group = GroupMapper.mapToDB(groupVO, dept);
			if (null != groupVO.groupId) {
				groupDAO.merge(group);
			} else {
				groupId = groupDAO.saveGroup(group);
			}
			List<Integer> profileList = groupVO.getProfileId();
			for (Integer profileId : profileList) {
				UserProfile user = profileDao.getReference(profileId);
				user.getFormation().setGroup(group);
				profileDao.merge(user);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return groupId;
	}

	@Override
	public List<GroupVO> findAll() {
		List<Drdogroup> groups = groupDAO.findAll();
		List<GroupVO> groups1 = new ArrayList<>();
		for (Drdogroup group : groups) {
			GroupVO groupVO = GroupMapper.mapFromDB(group);
			groups1.add(groupVO);
		}
		return groups1;
	}

	@Override
	public GroupVO findById(Integer id) {
		Drdogroup group = groupDAO.find(id);
		GroupVO groupVO = GroupMapper.mapFromDB(group);
		return groupVO;
	}

	@Override
	public void deleteGroupById(int id) {
		groupDAO.remove(groupDAO.getGroup(id));
	}

	@Override
	public Drdogroup findByGroupId(Integer id) {
		return groupDAO.find(id);
	}

	@Override
	public void updateGroup(GroupVO groupVO) {
		Department dept = departmentService.getDeptById(Integer.parseInt(groupVO.getDepartmentId()));
		Drdogroup group = GroupMapper.mapToDB(groupVO, dept);
		groupDAO.merge(group);
	}

	@Override
	public List<Drdogroup> getAllGroup() {
		return groupDAO.findAll();
	}

	@Override
	public List<GroupVO> getGroupByDeptId(Integer deptId) {
		List<Drdogroup> groupList = groupDAO.getGroupByDeptId(deptId);
		List<GroupVO> groupVOList = new ArrayList<>();
		for (Drdogroup group : groupList) {
			GroupVO deptVO = GroupMapper.mapFromDB(group);
			groupVOList.add(deptVO);
		}

		return groupVOList;
	}

}
