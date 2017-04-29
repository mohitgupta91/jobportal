package com.job.constants;

public enum Caste {

	SC("SC"), ST("ST"), OBC("OBC"), GEN("GEN");

	private String value;

	Caste(String value){
		this.setValue(value);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
