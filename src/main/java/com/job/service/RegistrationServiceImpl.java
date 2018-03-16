package com.job.service;

import static com.job.util.DtoEntityConvertor.convertAddressDto;
import static com.job.util.DtoEntityConvertor.convertJobPreferanceDto;
import static com.job.util.DtoEntityConvertor.convertPesonalInfoDto;
import static com.job.util.DtoEntityConvertor.convertQualificationDto;
import static com.job.util.DtoEntityConvertor.convertWorkExDto;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.job.constants.JobTypes;
import com.job.constants.Role;
import com.job.dao.AddressRepository;
import com.job.dao.JobPreferanceRepository;
import com.job.dao.PersonalInfoRepository;
import com.job.dao.QualificationsRepository;
import com.job.dao.UserRepository;
import com.job.dao.WorkExperienceRepository;
import com.job.dto.AddEditDto;
import com.job.dto.QualificationDto;
import com.job.dto.WorkExDto;
import com.job.model.Address;
import com.job.model.JobPreferance;
import com.job.model.PersonalInfo;
import com.job.model.Qualifications;
import com.job.model.WebUser;
import com.job.model.WorkExperience;

@Service
public class RegistrationServiceImpl implements RegistrationService {

	@Inject
	private PersonalInfoRepository personalInfoRepo;

	@Inject
	private AddressRepository addressRepo;

	@Inject
	private QualificationsRepository qualificationsRepo;

	@Inject
	private WorkExperienceRepository workExRepo;

	@Inject
	private JobPreferanceRepository jobPreferanceRepo;

	@Inject
	private UserRepository userRepo;

	@Override
	@Transactional
	public Long addJobSeeker(AddEditDto data) {
		PersonalInfo personalInfo = new PersonalInfo();
		Address permAddress = new Address();
		Address tempAddress = new Address();
		JobPreferance jobPref = new JobPreferance();
		List<WorkExperience> workExList = new ArrayList<>();
		List<WorkExperience> trainingList = new ArrayList<>();
		List<Qualifications> qualificationList = new ArrayList<>();

		convertPesonalInfoDto(data.getPersonalInfo(), personalInfo);
		if (data.getWorkExperience() != null && data.getWorkExperience().size() > 0)
			data.getWorkExperience()
					.forEach(item -> workExList.add(convertWorkExDto(item, new WorkExperience(), false)));
		if (data.getTraining() != null && data.getTraining().size() > 0)
			data.getTraining().forEach(item -> trainingList.add(convertWorkExDto(item, new WorkExperience(), true)));
		if (data.getQualifications() != null && data.getQualifications().size() > 0)
			data.getQualifications()
					.forEach(item -> qualificationList.add(convertQualificationDto(item, new Qualifications())));
		workExList.addAll(trainingList);
		personalInfo.setPermanentAddress(convertAddressDto(data.getPermamentAddress(), permAddress));
		personalInfo.setTemporaryAddress(convertAddressDto(data.getTemporaryAddress(), tempAddress));
		personalInfo.setJobRequirement(JobTypes.valueOf(data.getJobType()));
		personalInfo.setPreferance(convertJobPreferanceDto(data.getJobPreferance(), jobPref));
		personalInfo.setWorkExp(workExList);
		personalInfo.setQualifications(qualificationList);

		personalInfoRepo.save(personalInfo);

		WebUser currentUser = (WebUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (currentUser.getRole().equals(Role.ROLE_USER) && currentUser.getRegisterationID() == null) {
			currentUser.setRegisterationID(personalInfo.getRegistrationId());
			userRepo.save(currentUser);
		}
		return personalInfo.getRegistrationId();
	}

	@Override
	public PersonalInfo getJobSeeker(Long id) {
		return (PersonalInfo) personalInfoRepo.findOne(id);
	}

	@Override
	public Long editJobSeeker(AddEditDto data) {
		PersonalInfo personalInfo = personalInfoRepo.findOne(data.getPersonalInfo().getRegistrationId());
		Address permAddress = data.getPermamentAddress().getId() == null ? new Address()
				: addressRepo.findById(data.getPermamentAddress().getId());
		Address tempAddress = data.getTemporaryAddress().getId() == null ? new Address()
				: addressRepo.findById(data.getTemporaryAddress().getId());
		JobPreferance jobPref = data.getJobPreferance().getId() == null ? new JobPreferance()
				: jobPreferanceRepo.findById(data.getJobPreferance().getId());
		
		List<WorkExperience> workExList = new ArrayList<>();
		List<WorkExperience> trainingList = new ArrayList<>();
		List<Qualifications> qualificationList = new ArrayList<>();

		convertPesonalInfoDto(data.getPersonalInfo(), personalInfo);

		if (data.getWorkExperience() != null) {
			for (WorkExDto dto : data.getWorkExperience()) {
				if (dto.getId() != null)
					workExList.add(convertWorkExDto(dto, workExRepo.findById(dto.getId()), false));
				else
					workExList.add(convertWorkExDto(dto, new WorkExperience(), false));
			}
		}

		if (data.getTraining() != null) {
			for (WorkExDto dto : data.getTraining()) {
				if (dto.getId() != null)
					trainingList.add(convertWorkExDto(dto, workExRepo.findById(dto.getId()), true));
				else
					trainingList.add(convertWorkExDto(dto, new WorkExperience(), true));
			}
		}
		if (data.getQualifications() != null) {
		for (QualificationDto dto : data.getQualifications()) {
			if (dto.getId() != null)
				qualificationList.add(convertQualificationDto(dto, qualificationsRepo.findById(dto.getId())));
			else
				qualificationList.add(convertQualificationDto(dto, new Qualifications()));
		}
		}
		workExList.addAll(trainingList);

		personalInfo.setPermanentAddress(convertAddressDto(data.getPermamentAddress(), permAddress));
		personalInfo.setTemporaryAddress(convertAddressDto(data.getTemporaryAddress(), tempAddress));
		personalInfo.setJobRequirement(JobTypes.valueOf(data.getJobType()));
		personalInfo.setPreferance(convertJobPreferanceDto(data.getJobPreferance(), jobPref));
		personalInfo.setWorkExp(workExList);
		personalInfo.setQualifications(qualificationList);

		personalInfoRepo.save(personalInfo);
		return personalInfo.getRegistrationId();
	}

}
