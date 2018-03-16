package com.job.constants;

public enum Category {

	SC("SC"), ST("ST"), OBC("OBC"), GEN("GEN"),PH("PhysicallyHandicapped");

	private String value;

	Category(String value){
		this.setValue(value);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public static Category getByValue(String value) {
		for(Category category : Category.values()){
			if(category.value.equals(value))
				return category;
		}
		return null;
	}
}
