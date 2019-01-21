package com.work.drdo.domain.beans;

public class RegisterProfileBean {

	private Integer profileId;
	private byte[] profilePic;

	// getting from login bean
	private String userName;

	// getting from ui
	private String prefix;
	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	private String email;
	

	// not getting from ui
	/*private Date dateOfBirth = new Date();
	private Date regnDate;
	private String createdBy;
	private String createdByRole;
	private Date createdTs;
	private Date expirationDate;
	private String position;
	private String replaceBy;
	private String extension;
	private String phone;
	private String mobile;*/

	private RegisterFormationBean formation;
	
	private RegisterDesignationBean designation;

	public Integer getProfileId() {
		return profileId;
	}

	public void setProfileId(Integer profileId) {
		this.profileId = profileId;
	}

	public byte[] getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(byte[] profilePic) {
		this.profilePic = profilePic;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public RegisterFormationBean getFormation() {
		return formation;
	}

	public void setFormation(RegisterFormationBean formation) {
		this.formation = formation;
	}

	public RegisterDesignationBean getDesignation() {
		return designation;
	}

	public void setDesignation(RegisterDesignationBean designation) {
		this.designation = designation;
	}
	
}