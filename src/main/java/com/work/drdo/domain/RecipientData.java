package com.work.drdo.domain;

public class RecipientData {
	
	private String name;
	private String designation;
	private Integer officeNumber;
	private Integer ext;
	private String diaryId;
	
	public String getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(String diaryId) {
		this.diaryId = diaryId;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public Integer getOfficeNumber() {
		return officeNumber;
	}
	public void setOfficeNumber(Integer officeNumber) {
		this.officeNumber = officeNumber;
	}
	public Integer getExt() {
		return ext;
	}
	public void setExt(Integer ext) {
		this.ext = ext;
	}
	
	
}
