package com.work.drdo.domain;

public class UserProfile {
	private java.lang.Long profileId;
	private java.lang.String userName;
	private String prefix;
	private java.lang.String firstName;
	private java.lang.String middleName;
	private java.lang.String lastName;
	private java.lang.String gender;
	private java.util.Date dateOfBirth;
	private java.util.Date regnDate;
	private java.lang.String email;
	private java.lang.String createdBy;
	private java.lang.String createdByRole;
	private java.util.Date createdTs;
	private java.lang.String updBy;
	private java.util.Date updTs;

	public java.lang.Long getProfileId() {
		return profileId;
	}
	public void setProfileId(java.lang.Long profileId) {
		this.profileId = profileId;
	}
	public java.lang.String getUserName() {
		return userName;
	}
	public void setUserName(java.lang.String userName) {
		this.userName = userName;
	}
	
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	
	public java.lang.String getFirstName() {
		return firstName;
	}
	public void setFirstName(java.lang.String firstName) {
		this.firstName = firstName;
	}
	public java.lang.String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(java.lang.String middleName) {
		this.middleName = middleName;
	}
	public java.lang.String getLastName() {
		return lastName;
	}
	public void setLastName(java.lang.String lastName) {
		this.lastName = lastName;
	}
	public java.lang.String getGender() {
		return gender;
	}
	public void setGender(java.lang.String gender) {
		this.gender = gender;
	}
	public java.util.Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(java.util.Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public java.util.Date getRegnDate() {
		return regnDate;
	}
	public void setRegnDate(java.util.Date regnDate) {
		this.regnDate = regnDate;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		this.email = email;
	}
	public java.lang.String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(java.lang.String createdBy) {
		this.createdBy = createdBy;
	}
	public java.lang.String getCreatedByRole() {
		return createdByRole;
	}
	public void setCreatedByRole(java.lang.String createdByRole) {
		this.createdByRole = createdByRole;
	}
	public java.util.Date getCreatedTs() {
		return createdTs;
	}
	public void setCreatedTs(java.util.Date createdTs) {
		this.createdTs = createdTs;
	}
	public java.lang.String getUpdBy() {
		return updBy;
	}
	public void setUpdBy(java.lang.String updBy) {
		this.updBy = updBy;
	}
	public java.util.Date getUpdTs() {
		return updTs;
	}
	public void setUpdTs(java.util.Date updTs) {
		this.updTs = updTs;
	}
}
