package com.work.drdo.domain.questionnaire;

import java.util.List;

public class GroupVO {
	public Integer groupId;
    public String groupName;    
    public String groupHead;
    public String description;
    public List<Integer> profileId;
    public String divisionId;
    public String departmentId;
    
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupHead() {
		return groupHead;
	}
	public void setGroupHead(String groupHead) {
		this.groupHead = groupHead;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	} 
	
	public List<Integer> getProfileId() {
		return profileId;
	}
	public void setProfileId(List<Integer> profileId) {
		this.profileId = profileId;
	}
	public String getDivisionId() {
		return divisionId;
	}
	public void setDivisionId(String divisionId) {
		this.divisionId = divisionId;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	} 
    
    
}
