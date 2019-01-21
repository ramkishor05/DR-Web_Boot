package com.work.drdo.domain.beans;

public class WelcomeProfileBean {
	
	private Integer profileId;
	private String prefix;
	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	private String email;
	private String dateOfBirth;
	
	private String extension;
	private String phone;
	private String mobile;
	
	private WelcomeAddressBean address;
	
	private WelcomeBasicDetailBean basicDetail;
	
	public Integer getProfileId() {
		return profileId;
	}

	public void setProfileId(Integer profileId) {
		this.profileId = profileId;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
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

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public WelcomeAddressBean getAddress() {
		return address;
	}

	public void setAddress(WelcomeAddressBean address) {
		this.address = address;
	}

	public WelcomeBasicDetailBean getBasicDetail() {
		return basicDetail;
	}

	public void setBasicDetail(WelcomeBasicDetailBean basicDetail) {
		this.basicDetail = basicDetail;
	}
	
}
