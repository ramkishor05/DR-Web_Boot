package com.work.drdo.domain.questionnaire;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class AssignmentVO {
	private String assignmentId;
	private String diaryId;
	private String diaryNo;
	private String diaryType;
	private String assignTo;
	private String assignedFrom;
	private String fileNumber;
	private String fileSubject;
	private String senderName;	
	private String approverComment;
	private String approverStatus;
	private String columnActive;
	private List<String> approvalChk;
	private String closureComment;
	
	public String getAssignmentId() {
		return assignmentId;
	}
	public void setAssignmentId(String assignmentId) {
		this.assignmentId = assignmentId;
	}
	public String getDiaryId() {
		return diaryId;
	}
	public void setDiaryId(String diaryId) {
		this.diaryId = diaryId;
	}
	
	public String getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(String diaryNo) {
		this.diaryNo = diaryNo;
	}
	
	public String getDiaryType() {
		return diaryType;
	}
	public void setDiaryType(String diaryType) {
		this.diaryType = diaryType;
	}
	public String getAssignTo() {
		return assignTo;
	}
	public void setAssignTo(String assignTo) {
		this.assignTo = assignTo;
	}
	public String getAssignedFrom() {
		return assignedFrom;
	}
	public void setAssignedFrom(String assignedFrom) {
		this.assignedFrom = assignedFrom;
	}
	public String getFileNumber() {
		return fileNumber;
	}
	public void setFileNumber(String fileNumber) {
		this.fileNumber = fileNumber;
	}
	public String getFileSubject() {
		return fileSubject;
	}
	public void setFileSubject(String fileSubject) {
		this.fileSubject = fileSubject;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getApproverComment() {
		return approverComment;
	}

	public void setApproverComment(String approverComment) {
		this.approverComment = approverComment;
	}

	public String getApproverStatus() {
		return approverStatus;
	}

	public void setApproverStatus(String approverStatus) {
		this.approverStatus = approverStatus;
	}
	
	public String getColumnActive() {
		return columnActive;
	}
	public void setColumnActive(String columnActive) {
		this.columnActive = columnActive;
	}
	public List<String> getApprovalChk() {
		return approvalChk;
	}
	public void setApprovalChk(List<String> approvalChk) {
		this.approvalChk = approvalChk;
	}
	public String getClosureComment() {
		return closureComment;
	}
	public void setClosureComment(String closureComment) {
		this.closureComment = closureComment;
	}
	
	
}
