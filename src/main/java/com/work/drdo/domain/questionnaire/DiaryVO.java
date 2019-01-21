package com.work.drdo.domain.questionnaire;

public class DiaryVO {
	private String diaryId;
	private String dairyNumber;
	private String diaryType;
	private String fileId;
	private String senderName;
	private String status;
	private String diaryStatus;
	private String closureComment;
	
	private String approverComment;
	private String approverStatus;
	
	public String getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(String diaryId) {
		this.diaryId = diaryId;
	}

	public String getDairyNumber() {
		return dairyNumber;
	}

	public void setDairyNumber(String dairyNumber) {
		this.dairyNumber = dairyNumber;
	}

	public String getDiaryType() {
		return diaryType;
	}

	public void setDiaryType(String diaryType) {
		this.diaryType = diaryType;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getDiaryStatus() {
		return diaryStatus;
	}

	public void setDiaryStatus(String diaryStatus) {
		this.diaryStatus = diaryStatus;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getClosureComment() {
		return closureComment;
	}

	public void setClosureComment(String closureComment) {
		this.closureComment = closureComment;
	}
	
	public String getApproverComment() {
		return approverComment;
	}
	
	public String getApproverStatus() {
		return approverStatus;
	}
	
	public void setApproverComment(String approverComment) {
		this.approverComment = approverComment;
	}
	
	public void setApproverStatus(String approverStatus) {
		this.approverStatus = approverStatus;
	}
}
