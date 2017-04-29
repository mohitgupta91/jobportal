package com.job.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.job.model.StateCity;

@Repository
public interface StateCityRepository extends CrudRepository<StateCity, Long> {

	public List<StateCity> findByState(String state);

	@Query("Select distinct s.state from StateCity s")
	public List<String> findStates();

}
