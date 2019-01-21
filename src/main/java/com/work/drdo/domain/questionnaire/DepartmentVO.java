package com.work.drdo.domain.questionnaire;

import java.util.List;

public class DepartmentVO {
	private Integer departmentId;
	private String departmentName;
	private String deptHead;
	private String deptDescription;
	private String comment;
    private List<Integer> profileId;
    private String divisionId;

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getDeptHead() {
		return deptHead;
	}

	public void setDeptHead(String deptHead) {
		this.deptHead = deptHead;
	}

	public String getDeptDescription() {
		return deptDescription;
	}

	public void setDeptDescription(String deptDescription) {
		this.deptDescription = deptDescription;
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
	
}
