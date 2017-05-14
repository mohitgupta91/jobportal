package com.job.service;

import java.util.List;

import com.job.dto.SearchDto;
import com.job.model.PersonalInfo;

public interface SearchService {

	List<PersonalInfo> search(SearchDto dto);
	PersonalInfo searchByID(String regId);
}
