package com.job.dto;

public class JobPreferanceDto {

	private Long id;
	
	private String location1;

	private String location2;

	private String location3;

	private Boolean abroad;

	private String shift;

	public String getLocation1() {
		return location1;
	}

	public void setLocation1(String location1) {
		this.location1 = location1;
	}

	public String getLocation2() {
		return location2;
	}

	public void setLocation2(String location2) {
		this.location2 = location2;
	}

	public String getLocation3() {
		return location3;
	}

	public void setLocation3(String location3) {
		this.location3 = location3;
	}

	public Boolean getAbroad() {
		return abroad;
	}

	public void setAbroad(Boolean abroad) {
		this.abroad = abroad;
	}

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
