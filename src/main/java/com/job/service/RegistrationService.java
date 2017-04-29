package com.job.service;

import com.job.dto.AddEditDto;
import com.job.sro.ResponseSRO;

public interface RegistrationService {

	ResponseSRO addJobSeeker(AddEditDto data);
}
