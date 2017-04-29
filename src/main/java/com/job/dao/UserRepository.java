package com.job.dao;

import org.springframework.data.repository.CrudRepository;

import com.job.model.WebUser;

public interface UserRepository extends CrudRepository<WebUser,Long>{

	WebUser findByUserName(String userName);
	
}
