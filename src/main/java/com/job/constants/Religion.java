package com.job.constants;

public enum Religion {

	HINDU("Hindu"), MUSLIM("Muslim"), SIKH("Sikh"), CHRISTIAN("Christian"), JAIN("Jain");
	
	private String value;
	
	private Religion(String value) {
		this.setValue(value);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public static Religion getByValue(String value){
		for(Religion religion : Religion.values()){
			if(religion.value.equals(value))
				return religion;
		}
		return null;
	}
}
