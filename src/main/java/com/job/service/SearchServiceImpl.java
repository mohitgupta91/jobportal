package com.job.service;

import static com.job.util.DaoUtils.addParamPaths;
import static com.job.util.DaoUtils.handleMinMax;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.dao.PersonalInfoDao;
import com.job.dao.PersonalInfoRepository;
import com.job.dto.SearchDto;
import com.job.model.PersonalInfo;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	PersonalInfoRepository repo;
	
	@Inject
	PersonalInfoDao dao;
	
	@Override
	public List<PersonalInfo> search(SearchDto dto) {
		StringBuilder query = new StringBuilder("Select p from PersonalInfo p JOIN p.qualifications pq "
				+ "JOIN p.permanentAddress padd JOIN p.workExp pexp where p.registrationId is not Null ");
		List<Object> paramList = new ArrayList<>();
		Integer argNum = 0; 
		
		query.append(calculateDOB(paramList,dto.getMinAge(),dto.getMaxAge(),argNum));
		
		if(dto.getCaste() != null) {
			query.append(" and p.caste = ?"+(++argNum));
			paramList.add(dto.getCaste());
		}
		
		if(dto.getCity() != null) {
			query.append(" and padd.city = ?"+(++argNum));
			paramList.add(dto.getCity());
		}
		
		if(dto.getState() != null) {
			query.append(" and padd.state = ?"+(++argNum));
			paramList.add(dto.getState());
		}
		
		if(dto.getGender() != null) {
			query.append(" and p.gender = ?"+(++argNum));
			paramList.add(dto.getGender());
		}
		
		if(dto.getMaritalStatus() != null) {
			query.append(" or p.maritalstatus = ?"+(++argNum));
			paramList.add(dto.getMaritalStatus());
		}
		
		if(dto.getQualifications() != null) {
			query.append(" or pq.degree IN (" +addParamPaths(dto.getQualifications(),argNum)+")");
			paramList.addAll(dto.getQualifications());
		}
		
		if(dto.getJobTypes() != null) {
			query.append(" or p.jobRequirement IN (" +addParamPaths(dto.getJobTypes(),argNum)+")");
			paramList.addAll(dto.getJobTypes());
		}
		
		query.append(handleMinMax(paramList, " or p.totalExperience", dto.getMinExp(), dto.getMaxExp(), argNum));
		query.append(handleMinMax(paramList, " or p.expectedSalary", dto.getMinExp(), dto.getMaxExp(), argNum));
		System.out.println(query);
		List<PersonalInfo> resultList = dao.searchResults(query.toString(), paramList);
		System.out.println(resultList);
		return resultList;
	}

	private String calculateDOB(List<Object> paramList, Integer minAge, Integer maxAge, Integer argNum) {
		if(minAge == null && maxAge == null)	return "";
		Integer args = argNum;
		Integer year = LocalDate.now().getYear();
		Integer minYear = maxAge != null ? year - maxAge : null;
		Integer maxYear = minAge != null ? year - minAge : null;
		String query = "";
		if(maxYear != null)
			query += " and p.dob > ?"+(++args) ;
		if(minYear != null)
			query += " and p.dob < ?"+(++args);
		argNum = args;
		return query;
	}
}
