package com.job.dao;

import java.util.List;
import java.util.Set;

import com.job.model.PersonalInfo;

public interface PersonalInfoRepositoryCustom {

	PersonalInfo getByRegistrationId(Long regID);
	
	List<PersonalInfo> findByRegistrationId(Set<Long> regID);

}
