package com.job.service;

import com.job.dto.AddEditDto;
import com.job.model.PersonalInfo;
import com.job.sro.ResponseSRO;

public interface RegistrationService {

	ResponseSRO addJobSeeker(AddEditDto data);
	
	PersonalInfo getJobSeeker(Long id);

	ResponseSRO editJobSeeker(AddEditDto data);
}
