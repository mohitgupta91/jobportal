package com.job.util;

import java.time.LocalDate;

import com.job.constants.Caste;
import com.job.constants.Role;
import com.job.constants.ShiftType;
import com.job.dto.AddressDto;
import com.job.dto.JobPreferanceDto;
import com.job.dto.PersonalInfoDto;
import com.job.dto.QualificationDto;
import com.job.dto.WebUserDto;
import com.job.dto.WorkExDto;
import com.job.model.Address;
import com.job.model.JobPreferance;
import com.job.model.PersonalInfo;
import com.job.model.Qualifications;
import com.job.model.WebUser;
import com.job.model.WorkExperience;

public class DtoEntityConvertor {

	public static PersonalInfo convertPesonalInfoDto(PersonalInfoDto dto, PersonalInfo entity){
		entity.setCaste(Caste.valueOf(dto.getCaste()));
		entity.setContactNumber(dto.getContactNumber());
		entity.setContactNumber2(dto.getContactNumber2());
		entity.setFatherName(dto.getFatherName());
		entity.setDob(dto.getDob());
		entity.setGender(dto.getGender());
		entity.setIdNumber(dto.getIdNumber());
		entity.setIdType(dto.getIdType());
		entity.setMaritalStatus(dto.getMaritalStatus());
		entity.setMotherName(dto.getMotherName());
		entity.setName(dto.getName());
		entity.setSpouseName(dto.getSpouseName());
		
		return entity;	
	}
	
	public static Qualifications convertQualificationDto(QualificationDto dto, Qualifications entity){
		entity.setCollege(dto.getCollege());
		entity.setDegree(dto.getDegree());
		entity.setGrade(dto.getGrade());
		entity.setPassYear(dto.getPassYear());
		entity.setSubjects(dto.getSubjects());
		entity.setUniversity(dto.getUniversity());
		
		return entity;
	}
	
	public static Address convertAddressDto(AddressDto dto, Address entity){
		entity.setAddress(dto.getAddress());
		entity.setAddress2(dto.getAddress2());
		entity.setCity(dto.getCity());
		entity.setState(dto.getState());
		entity.setTehsil(dto.getTehsil());
		
		return entity;
	}
	
	public static WorkExperience convertWorkExDto(WorkExDto dto, WorkExperience entity){
		entity.setAddress(convertAddressDto(dto.getAddress(), new Address()));
		entity.setCompany(dto.getCompany());
		entity.setFromDate(LocalDate.parse(dto.getFromDate()));
		entity.setJobTitle(dto.getJobTitle());
		entity.setToDate(LocalDate.parse(dto.getToDate()));
		
		return entity;
	}
	
	public static JobPreferance convertJobPreferanceDto(JobPreferanceDto dto, JobPreferance entity){
		entity.setAbroad(dto.getAbroad());
		entity.setLocation1(dto.getLocation1());
		entity.setLocation2(dto.getLocation2());
		entity.setLocation3(dto.getLocation3());
		entity.setShift(ShiftType.valueOf(dto.getShift()));
		
		return entity;
	}
	
	public static WebUser convertWebUserDto(WebUserDto dto, WebUser entity){
		entity.setUserName(dto.getUserName());
		entity.setEmailId(dto.getEmailId());
		entity.setPassword(dto.getPassword());
		entity.setRole(Role.valueOf(dto.getRole()));
		
		return entity;
	}
}
