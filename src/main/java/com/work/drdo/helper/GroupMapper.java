package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.GroupVO;
import com.work.drdo.executive.entity.Department;
import com.work.drdo.executive.entity.Drdogroup;

public class GroupMapper {

	public static Drdogroup mapToDB(GroupVO groupVO, Department dept) {
		Drdogroup group = new Drdogroup();
		group.setGroupId(groupVO.getGroupId());
		group.setGroupName(groupVO.getGroupName());
		group.setComment(groupVO.getDescription());
		/*group.setStatus(groupVO.getGroupHead());*/
		group.setDepartment(dept);
		return group;
    }

    public static GroupVO mapFromDB(Drdogroup groupList) {
    	GroupVO groupVO = new GroupVO();
	    if(null!=groupList){
	    	groupVO.setGroupId(groupList.getGroupId());
	    	groupVO.setGroupName(groupList.getGroupName());
	    	groupVO.setDescription(groupList.getComment());
	    	/*groupVO.setGroupHead(groupList.getStatus());*/
	    	groupVO.setDepartmentId(groupList.getDepartment().getDeptId().toString());
    	}
	    return groupVO;
    }
}
