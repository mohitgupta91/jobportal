package com.job.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.job.constants.Category;
import com.job.constants.Constants;
import com.job.constants.Religion;
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

	public static PersonalInfo convertPesonalInfoDto(PersonalInfoDto dto, PersonalInfo entity) {
		if (dto.getReligion() != null && !dto.getReligion().equals(""))
			entity.setReligion(Religion.getByValue(dto.getReligion()));
		entity.setContactNumber(dto.getContactNumber());
		entity.setContactNumber2(dto.getContactNumber2());
		entity.setFatherName(dto.getFatherName());
		entity.setEmail(dto.getEmail());
		entity.setDob(LocalDate.parse(dto.getDob(), DateTimeFormatter.ofPattern(Constants.DATE_FORMAT)));
		entity.setGender(dto.getGender());
		entity.setIdNumber(dto.getIdNumber());
		entity.setIdType(dto.getIdType());
		entity.setMaritalStatus(dto.getMaritalStatus());
		entity.setMotherName(dto.getMotherName());
		entity.setName(dto.getName());
		entity.setComputerSkill(dto.getComputerSkill());
		entity.setSpouseName(dto.getSpouseName());
		try {
			if (dto.getCurrentSalary() != null)
				entity.setCurrentSalary(Integer.valueOf(dto.getCurrentSalary()));
		} catch (Exception e) {
			entity.setCurrentSalary(0);
		}
		try {
			if (dto.getExpectedSalary() != null)
				entity.setExpectedSalary(Integer.valueOf(dto.getExpectedSalary()));
		} catch (Exception e) {
			entity.setExpectedSalary(0);
		}
		if (dto.getExpYears() == null)
			dto.setExpYears(0);
		if (dto.getExpMonths() == null)
			dto.setExpMonths(0);
		entity.setTotalExperience(dto.getExpYears() * 12 + dto.getExpMonths());
		if (dto.getCategory() != null)
			entity.setCategory(Category.getByValue(dto.getCategory()));
		return entity;
	}

	public static Qualifications convertQualificationDto(QualificationDto dto, Qualifications entity) {
		entity.setCollege(dto.getCollege());
		entity.setDegree(dto.getDegree());
		entity.setGrade(dto.getGrade());
		entity.setPassYear(dto.getPassYear());
		entity.setSubjects(dto.getSubjects());
		entity.setUniversity(dto.getUniversity());
		return entity;
	}

	public static Address convertAddressDto(AddressDto dto, Address entity) {
		entity.setAddress(dto.getAddress());
		entity.setCity(dto.getCity());
		entity.setState(dto.getState());
		entity.setTehsil(dto.getTehsil());
		return entity;
	}

	public static WorkExperience convertWorkExDto(WorkExDto dto, WorkExperience entity, Boolean training) {
		entity.setAddress(convertAddressDto(dto.getAddress(), new Address()));
		entity.setCompany(dto.getCompany());
		if (dto.getFromDate() != null && !dto.getFromDate().equals(""))
			entity.setFromDate(LocalDate.parse(dto.getFromDate(), DateTimeFormatter.ofPattern(Constants.DATE_FORMAT)));
		entity.setJobTitle(dto.getJobTitle());
		entity.setTraining(training);
		if (dto.getToDate() != null && !dto.getToDate().equals(""))
			entity.setToDate(LocalDate.parse(dto.getToDate(), DateTimeFormatter.ofPattern(Constants.DATE_FORMAT)));
		return entity;
	}

	public static JobPreferance convertJobPreferanceDto(JobPreferanceDto dto, JobPreferance entity) {
		if (entity.getAbroad() != null)
			entity.setAbroad(dto.getAbroad());
		else
			entity.setAbroad(false);

		if (dto.getLocation1() != null)
			entity.setLocation1(dto.getLocation1());
		if (dto.getLocation2() != null)
			entity.setLocation2(dto.getLocation2());
		if (dto.getLocation3() != null)
			entity.setLocation3(dto.getLocation3());
		if (dto.getShift() != null && !dto.getShift().equals(""))
			entity.setShift(ShiftType.valueOf(dto.getShift()));
		return entity;
	}

	public static WebUser convertWebUserDto(WebUserDto dto, WebUser entity) {
		entity.setUserName(dto.getUserName());
		entity.setEmailId(dto.getEmailId());
		entity.setPassword(dto.getPassword());
		entity.setRole(Role.valueOf(dto.getRole()));
		return entity;
	}
}
