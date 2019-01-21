package com.work.drdo.domain.questionnaire;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ProjectVo{
	private Integer userProjectId;
	private String name;
	
	private	List<ProjectDetailVo> userProjectDetails;

	public Integer getUserProjectId() {
		return userProjectId;
	}
	
	public void setUserProjectId(Integer userProjectId) {
		this.userProjectId = userProjectId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public List<ProjectDetailVo> getUserProjectDetails() {
		return userProjectDetails;
	}
	public void setUserProjectDetails(List<ProjectDetailVo> userProjectDetails) {
		this.userProjectDetails = userProjectDetails;
	}
}