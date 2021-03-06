package com.job.dto;

import java.util.List;

public class AddEditDto {

	private PersonalInfoDto personalInfo;
	
	private AddressDto permamentAddress;
	
	private AddressDto temporaryAddress;
	
	private List<QualificationDto> qualifications;
	
	private List<WorkExDto> workExperience;
	
	private List<WorkExDto> training;
	
	private String jobType;
	
	private Boolean computerSkill;
	
	private JobPreferanceDto jobPreferance;

	private WebUserDto user;
	
	public PersonalInfoDto getPersonalInfo() {
		return personalInfo;
	}

	public void setPersonalInfo(PersonalInfoDto personalInfo) {
		this.personalInfo = personalInfo;
	}

	public AddressDto getPermamentAddress() {
		return permamentAddress;
	}

	public void setPermamentAddress(AddressDto permamentAddress) {
		this.permamentAddress = permamentAddress;
	}

	public AddressDto getTemporaryAddress() {
		return temporaryAddress;
	}

	public void setTemporaryAddress(AddressDto temporaryAddress) {
		this.temporaryAddress = temporaryAddress;
	}

	public List<QualificationDto> getQualifications() {
		return qualifications;
	}

	public void setQualifications(List<QualificationDto> qualifications) {
		this.qualifications = qualifications;
	}

	public List<WorkExDto> getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(List<WorkExDto> workExperience) {
		this.workExperience = workExperience;
	}

	public List<WorkExDto> getTraining() {
		return training;
	}

	public void setTraining(List<WorkExDto> training) {
		this.training = training;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public Boolean getComputerSkill() {
		return computerSkill;
	}

	public void setComputerSkill(Boolean computerSkill) {
		this.computerSkill = computerSkill;
	}

	public JobPreferanceDto getJobPreferance() {
		return jobPreferance;
	}

	public void setJobPreferance(JobPreferanceDto jobPreferance) {
		this.jobPreferance = jobPreferance;
	}

	public WebUserDto getUser() {
		return user;
	}

	public void setUser(WebUserDto user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "AddEditDto [personalInfo=" + personalInfo + ", permamentAddress=" + permamentAddress
				+ ", temporaryAddress=" + temporaryAddress + ", qualifications=" + qualifications + ", workExperience="
				+ workExperience + ", training=" + training + ", jobType=" + jobType + ", computerSkill="
				+ computerSkill + ", jobPreferance=" + jobPreferance + ", user=" + user + "]";
	}

}
