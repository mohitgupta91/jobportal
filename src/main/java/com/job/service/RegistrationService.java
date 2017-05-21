package com.job.service;

import com.job.dto.AddEditDto;
import com.job.model.PersonalInfo;

public interface RegistrationService {

	Long addJobSeeker(AddEditDto data);
	
	PersonalInfo getJobSeeker(Long id);

	Long editJobSeeker(AddEditDto data);
}
