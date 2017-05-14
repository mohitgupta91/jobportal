package com.job.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.job.model.Qualifications;

@Repository
public interface QualificationsRepository extends CrudRepository<Qualifications, Long>{

	Qualifications findById(Long id);
}
