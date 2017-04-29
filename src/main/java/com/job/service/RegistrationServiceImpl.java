package com.job.service;

import static com.job.util.DtoEntityConvertor.convertAddressDto;
import static com.job.util.DtoEntityConvertor.convertJobPreferanceDto;
import static com.job.util.DtoEntityConvertor.convertPesonalInfoDto;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.job.constants.JobTypes;
import com.job.dao.PersonalInfoRepository;
import com.job.dto.AddEditDto;
import com.job.model.Address;
import com.job.model.JobPreferance;
import com.job.model.PersonalInfo;
import com.job.sro.ResponseSRO;

@Service
public class RegistrationServiceImpl implements RegistrationService{

	@Inject
	private PersonalInfoRepository personalInfoRepo;
	
	@Override
	@Transactional
	public ResponseSRO addJobSeeker(AddEditDto data) {
		PersonalInfo personalInfo = new PersonalInfo();
		Address permAddress = new Address();
		Address tempAddress = new Address();
		JobPreferance jobPref = new JobPreferance();
		convertPesonalInfoDto(data.getPersonalInfo(), personalInfo);
		personalInfo.setPermanentAddress(convertAddressDto(data.getPermamentAddress(), permAddress));
		personalInfo.setTemporaryAddress(convertAddressDto(data.getTempAddress(), tempAddress));
		personalInfo.setJobRequirement(JobTypes.valueOf(data.getJobType()));
		personalInfo.setPreferance(convertJobPreferanceDto(data.getJobPreferance(), jobPref));
		
		personalInfo = personalInfoRepo.save(personalInfo);
		return new ResponseSRO("Saved Succesfully : Reg ID "+personalInfo.getRegistrationId(), false);
	}

}
