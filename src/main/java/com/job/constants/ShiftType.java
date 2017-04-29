package com.job.constants;

public enum ShiftType {

	DAY("Day"),
	NIGHT("Night"),
	ANY("Anytime");
	
	String value;

	private ShiftType(String value) {
		this.value = value;
	}

}
