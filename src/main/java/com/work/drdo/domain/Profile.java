package com.work.drdo.domain;

import java.util.Date;

public class Profile {
	private Date dateOfSubmission;
	private Date timeOfSubmission;
	private String email;

	public Date getDateOfSubmission() {
		return dateOfSubmission;
	}

	public void setDateOfSubmission(Date dateOfSubmission) {
		this.dateOfSubmission = dateOfSubmission;
	}

	public Date getTimeOfSubmission() {
		return timeOfSubmission;
	}

	public void setTimeOfSubmission(Date timeOfSubmission) {
		this.timeOfSubmission = timeOfSubmission;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

}
