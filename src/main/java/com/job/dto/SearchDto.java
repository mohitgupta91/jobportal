package com.job.dto;

import java.util.List;

public class SearchDto {

	private Integer minAge;
	private Integer maxAge;
	private String state;
	private String city;
	private String gender;
	private String caste;
	private String maritalStatus;
	private List<String> qualifications;
	private Integer minExp;
	private Integer maxExp;
	private String jobType;
	private Integer minSal;
	private Integer maxSal;
	
	public Integer getMinAge() {
		return minAge;
	}

	public void setMinAge(Integer minAge) {
		this.minAge = minAge;
	}

	public Integer getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(Integer maxAge) {
		this.maxAge = maxAge;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCaste() {
		return caste;
	}

	public void setCaste(String caste) {
		this.caste = caste;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public List<String> getQualifications() {
		return qualifications;
	}

	public void setQualifications(List<String> qualifications) {
		this.qualifications = qualifications;
	}

	public Integer getMinExp() {
		return minExp;
	}

	public void setMinExp(Integer minExp) {
		this.minExp = minExp;
	}

	public Integer getMaxExp() {
		return maxExp;
	}

	public void setMaxExp(Integer maxExp) {
		this.maxExp = maxExp;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public Integer getMinSal() {
		return minSal;
	}

	public void setMinSal(Integer minSal) {
		this.minSal = minSal;
	}

	public Integer getMaxSal() {
		return maxSal;
	}

	public void setMaxSal(Integer maxSal) {
		this.maxSal = maxSal;
	}

	@Override
	public String toString() {
		return "SearchDto [minAge=" + minAge + ", maxAge=" + maxAge + ", state=" + state + ", city=" + city
				+ ", gender=" + gender + ", caste=" + caste + ", maritalStatus=" + maritalStatus + ", qualifications="
				+ qualifications + ", minExp=" + minExp + ", maxExp=" + maxExp + ", jobType=" + jobType + ", minSal="
				+ minSal + ", maxSal=" + maxSal + "]";
	}

}
