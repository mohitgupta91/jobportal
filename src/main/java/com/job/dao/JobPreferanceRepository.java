package com.job.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.job.model.JobPreferance;

@Repository
public interface JobPreferanceRepository extends CrudRepository<JobPreferance, Long>{

	JobPreferance findById(Long id);
}
