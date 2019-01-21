package com.work.drdo.domain;

import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class UserForgotPasswordRequest {
	
	@NotEmpty @Email
	private String userName;
	
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dob;
	
	
	
	public void setUserName(String userName){
		this.userName=userName;
	}
	
	public void setDob(Date dob){
		this.dob=dob;
	}
	
	
	public String getUserName(){
		return userName;
	}
	public Date getDob(){
		return dob;
	}
}
