package com.job.constants;

public enum Role {

	ROLE_USER("user"),
	ROLE_ADMIN("admin");
	
	String role;
	
	Role(String role){
		this.role = role;
	}
	
	public String getRole(){
		return role;
	}
}
