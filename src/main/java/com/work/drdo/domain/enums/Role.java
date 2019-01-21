package com.work.drdo.domain.enums;

public enum Role {
	ADMIN("ROLE_ADMIN"),
	USER("ROLE_USER"),
	ZONALCOMMISSIONER("ROLE_CHIEF_ZONAL_COMMISSIONER"),
	COMMISSIONER("ROLE_COMMISSIONER"),
	DIVISION("ROLE_DIVISION_OFFICIER"),
	DEPTHEAD("ROLE_DEPTHEAD"),
	GROUPHEAD("ROLE_GROUPHEAD"),
	SCIENTIST("ROLE_SCIENTIST");
	
	
	private String value;
	
	private Role(String value){
		this.value = value;
	}
	
	public String value(){
		return this.value;
	}
}
