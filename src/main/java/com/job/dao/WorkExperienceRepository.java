package com.job.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.job.model.WorkExperience;

@Repository
public interface WorkExperienceRepository extends CrudRepository<WorkExperience, Long> {

	WorkExperience findById(Long id);
}
