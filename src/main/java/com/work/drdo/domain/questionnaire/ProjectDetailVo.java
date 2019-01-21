package com.work.drdo.domain.questionnaire;
/**
 * @author Anup
 *
 */
public class ProjectDetailVo {
	
	private Integer userProjectDetailId;
	
	private String description;
	
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Integer getUserProjectDetailId() {
		return userProjectDetailId;
	}
	
	public void setUserProjectDetailId(Integer userProjectDetailId) {
		this.userProjectDetailId = userProjectDetailId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}