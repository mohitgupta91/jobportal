package com.job.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.job.model.PersonalInfo;

@Repository
public interface PersonalInfoRepository extends CrudRepository<PersonalInfo, Long>{

	
}
