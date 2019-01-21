package com.work.drdo.domain;

import javax.validation.constraints.Size;

public class ResetPasswordRequest {
	@Size(min=4)
	private String password;

	@Size(min=36)
	private String token;
	
	public void setPassword(String password){
		this.password=password;
	}
	public void setToken(String token){
		this.token=token;
	}
	public String getPassword(){
		return password;
	}
	public String getToken(){
		return token;
	}
}
