package com.work.drdo.service.group;

import java.util.List;

import com.work.drdo.domain.questionnaire.GroupVO;
import com.work.drdo.executive.entity.Drdogroup;


public interface GroupService {
	public String saveGroup(GroupVO groupVO);

	public void updateGroup(GroupVO groupVO);
	
	public List<GroupVO> findAll();
	
	public List<Drdogroup> getAllGroup();

	public GroupVO findById(Integer id);
	
	public Drdogroup findByGroupId(Integer id);

	public void deleteGroupById(int id);
	
	public List<GroupVO> getGroupByDeptId(Integer deptId);
}
