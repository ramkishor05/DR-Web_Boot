package com.work.drdo.domain.questionnaire;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class RecipientVO {
	private String recipentId;
	private String diaryId;
	private String name;
	private String designation;
	private String deptId;
	private String recipientAddress;
	private Integer officeNumber;
	private Integer ext;
	private String recipientEmail;
	
	
	public String getRecipentId() {
		return recipentId;
	}

	public void setRecipentId(String recipentId) {
		this.recipentId = recipentId;
	}

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
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getRecipientAddress() {
		return recipientAddress;
	}
	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
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

	public String getRecipientEmail() {
		return recipientEmail;
	}

	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}
	
	
}
