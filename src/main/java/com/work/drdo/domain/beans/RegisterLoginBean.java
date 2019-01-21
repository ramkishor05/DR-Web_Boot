package com.work.drdo.domain.beans;

public class RegisterLoginBean {
	//Getting from ui
	private String userName;
	private String password;
	private Integer role;
	
	// Set default for 
	/*
	private Integer loginId;
	private Character active;
	private Character locked;
	private Date lastLogin;
	private String createdBy;
	private Date createdTs;
	private String updBy;
	private Date updTs;
	private Character enabled;*/
	
	private RegisterProfileBean profile;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public RegisterProfileBean getProfile() {
		return profile;
	}

	public void setProfile(RegisterProfileBean profile) {
		this.profile = profile;
	}
	
}
