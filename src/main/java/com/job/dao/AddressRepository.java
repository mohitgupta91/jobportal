package com.job.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.job.model.Address;

@Repository
public interface AddressRepository extends CrudRepository<Address, Long>{

	Address findById(Long id);
}
