package com.job.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.job.constants.ShiftType;

@Entity
@Table(name = "job_preference")
public class JobPreferance extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(name = "location1", nullable = true, unique = true)
	private String location1;

	@Column(name = "location2", nullable = true, unique = true)
	private String location2;

	@Column(name = "location3", nullable = true, unique = true)
	private String location3;

	@Column
	private Boolean abroad;

	@Column(name = "shift")
	@Enumerated(EnumType.STRING)
	private ShiftType shift;

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

	public ShiftType getShift() {
		return shift;
	}

	public void setShift(ShiftType shift) {
		this.shift = shift;
	}

}
