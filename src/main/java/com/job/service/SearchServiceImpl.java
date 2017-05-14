package com.job.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.constants.Caste;
import com.job.constants.JobTypes;
import com.job.dao.PersonalInfoRepository;
import com.job.dto.SearchDto;
import com.job.model.PersonalInfo;

@Service
public class SearchServiceImpl implements SearchService{

	
	@Autowired
	PersonalInfoRepository repo;

//	@Override
//	public List<PersonalInfo> search(SearchDto dto) {
//		StringBuilder query = new StringBuilder("Select p from PersonalInfo p JOIN p.qualifications pq "
//				+ "JOIN p.permanentAddress padd JOIN p.workExp pexp where p.registrationId IS NOT NULL ");
//		List<Object> paramList = new ArrayList<>();
//		Integer argNum = 0; 
//		
//		query.append(calculateDOB(paramList,dto.getMinAge(),dto.getMaxAge(),argNum));
//		
//		if(dto.getCaste() != null) {
//			query.append(" and p.caste = ?"+(++argNum));
//			paramList.add(dto.getCaste());
//		}
//		
//		if(dto.getCity() != null) {
//			query.append(" and padd.city = ?"+(++argNum));
//			paramList.add(dto.getCity());
//		}
//		
//		if(dto.getState() != null) {
//			query.append(" and padd.state = ?"+(++argNum));
//			paramList.add(dto.getState());
//		}
//		
//		if(dto.getGender() != null) {
//			query.append(" and p.gender = ?"+(++argNum));
//			paramList.add(dto.getGender());
//		}
//		
//		if(dto.getMaritalStatus() != null) {
//			query.append(" or p.maritalstatus = ?"+(++argNum));
//			paramList.add(dto.getMaritalStatus());
//		}
//		
//		if(dto.getQualifications() != null) {
//			query.append(" or pq.degree IN (" +addParamPaths(dto.getQualifications(),argNum)+")");
//			paramList.addAll(dto.getQualifications());
//		}
//		
//		if(dto.getJobTypes() != null) {
//			query.append(" or p.jobRequirement IN (" +addParamPaths(dto.getJobTypes(),argNum)+")");
//			paramList.addAll(dto.getJobTypes());
//		}
//		
//		query.append(handleMinMax(paramList, " or p.totalExperience", dto.getMinExp(), dto.getMaxExp(), argNum));
//		query.append(handleMinMax(paramList, " or p.expectedSalary", dto.getMinExp(), dto.getMaxExp(), argNum));
//		System.out.println(query);
//		System.out.println(paramList);
//		List<PersonalInfo> resultList = dao.searchResults(query.toString(), paramList);
//		System.out.println(resultList);
//		return resultList;
//	}

	@Override
	public List<PersonalInfo> search(SearchDto dto)
	{
		Set<Long> regSet = new HashSet<>();
		List<Long> tempList;
		
		tempList = findByAge(dto.getMaxAge(),dto.getMinAge());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByCaste(dto.getCaste());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByGender(dto.getGender());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByMaritalStatus(dto.getMaritalStatus());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByState(dto.getState());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByCity(dto.getCity());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByTotalExperience(dto.getMaxExp(), dto.getMinExp());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByExpectedSalary(dto.getMaxSal(), dto.getMinSal());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByJobRequirements(dto.getJobType());
		if(tempList != null) regSet.addAll(tempList);
		
		tempList = findByQualificatons(dto.getQualifications());
		if(tempList != null) regSet.addAll(tempList);
		
		return regSet.isEmpty() ? null : repo.findByRegistrationId(regSet);
	}
	
	private List<Long> findByAge(Integer maxAge, Integer minAge) {
		if(minAge == null && maxAge == null)	return null;
		List<Long> ageList = new ArrayList<>();
		Integer year = LocalDate.now().getYear();
		Integer minYear = maxAge != null ? year - maxAge : null;
		Integer maxYear = minAge != null ? year - minAge : null;
		if(maxYear != null && minYear != null){
			repo.findByDob(LocalDate.of(maxYear, 1, 1), LocalDate.of(minYear,1, 1));
			return ageList;
		}
		else if(maxYear != null){
			repo.findByMaxDob(LocalDate.of(maxYear, 1, 1)).forEach( item -> ageList.add(item.getRegistrationId()));
			return ageList;
		}
		else if (minYear != null){
			repo.findByMinDob(LocalDate.of(minYear, 1, 1)).forEach( item -> ageList.add(item.getRegistrationId()));
			return ageList;
		}
		return null;
	}
	
	private List<Long> findByCaste(String casteString) {
		if(casteString == null)	return null;
		Caste caste = Caste.valueOf(casteString);
		List<Long> list = new ArrayList<>();
		repo.findByCaste(caste).forEach(item -> list.add(item.getRegistrationId()));
		return list;
	}

	private List<Long> findByMaritalStatus(String status) {
		if(status == null)	return null;
		List<Long> list = new ArrayList<>();
		repo.findByMaritalStatus(status).forEach(item -> list.add(item.getRegistrationId()));
		return list;
	}
	
	private List<Long> findByState(String state) {
		if(state == null)	return null;
		List<Long> list = new ArrayList<>();
		repo.findByPermanentAddress_State(state).forEach(item -> list.add(item.getRegistrationId()));		
		repo.findByTemporaryAddress_State(state).forEach(item -> list.add(item.getRegistrationId()));			
		return list;
	}

	private List<Long> findByCity(String city) {
		if(city == null)	return null;
		List<Long> list = new ArrayList<>();
		repo.findByPermanentAddress_City(city).forEach(item -> list.add(item.getRegistrationId()));		
		repo.findByTemporaryAddress_City(city).forEach(item -> list.add(item.getRegistrationId()));			
		return list;
	}
	
	private List<Long> findByGender(String gender) {
		if(gender == null)	return null;
		List<Long> list = new ArrayList<>();
		repo.findByGender(gender).forEach(item -> list.add(item.getRegistrationId()));		
		return list;
	}

	private List<Long> findByQualificatons(List<String> qualifications) {
		if(qualifications == null || qualifications.isEmpty())	return null;
		List<Long> list = new ArrayList<>();
		repo.findByQualifications_Degree(qualifications).forEach(item -> list.add(item.getRegistrationId()));
		return list;
	}
	
	private List<Long> findByJobRequirements(String jobType) {
		if(jobType == null )	return null;
		List<Long> list = new ArrayList<>();
		repo.findByJobRequirement(JobTypes.valueOf(jobType)).forEach(item -> list.add(item.getRegistrationId()));
		return list;
	}

	private List<Long> findByTotalExperience(Integer maxExp, Integer minExp) {
		if(minExp == null && maxExp == null)	return null;
		List<Long> list = new ArrayList<>();
		if(maxExp != null && minExp != null){
			repo.findByTotalExperience(maxExp * 12, minExp * 12).forEach(item -> list.add(item.getRegistrationId()));
			return list;
		}
		else if(maxExp != null){
			repo.findByMaxTotalExperience(maxExp * 12).forEach(item -> list.add(item.getRegistrationId()));
			return list;
		}
		else if (minExp != null){
			repo.findByMinTotalExperience(minExp * 12).forEach(item -> list.add(item.getRegistrationId()));
			return list;
		}
		return null;
	}
	
	private List<Long> findByExpectedSalary(Integer maxSal, Integer minSal) {
		if(minSal == null && maxSal == null)	return null;
		List<Long> list = new ArrayList<>();
		if(maxSal != null && minSal != null){
			repo.findByExpectedSalary(maxSal, minSal).forEach(item -> list.add(item.getRegistrationId()));
			return list;
		}
		else if(maxSal != null){
			repo.findByMaxExpectedSalary(maxSal).forEach(item -> list.add(item.getRegistrationId()));
			return list;
		}
		else if (minSal != null){
			repo.findByMinExpectedSalary(minSal).forEach(item -> list.add(item.getRegistrationId()));
			return list;
		}
		return null;
	}

//	private String calculateDOB(List<Object> paramList, Integer minAge, Integer maxAge, Integer argNum) {
//		if(minAge == null && maxAge == null)	return "";
//		Integer args = argNum;
//		Integer year = LocalDate.now().getYear();
//		Integer minYear = maxAge != null ? year - maxAge : null;
//		Integer maxYear = minAge != null ? year - minAge : null;
//		String query = "";
//		if(maxYear != null)
//			query += " and p.dob > ?"+(++args) ;
//		if(minYear != null)
//			query += " and p.dob < ?"+(++args);
//		argNum = args;
//		return query;
//	}

	@Override
	public PersonalInfo searchByID(String regId) {
		try{
			Long regID = Long.parseLong(regId);
			return repo.findOne(regID);
		}
		catch (Exception e) {
			return null;
		}
	}
}
