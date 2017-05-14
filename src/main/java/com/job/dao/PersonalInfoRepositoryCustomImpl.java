package com.job.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import com.job.model.PersonalInfo;

@Transactional
public class PersonalInfoRepositoryCustomImpl implements PersonalInfoRepositoryCustom{

	@PersistenceContext
	EntityManager entityManager;

	
	@Override
	public PersonalInfo getByRegistrationId(Long regID)
	{
		Query query = entityManager.createQuery("Select p from PersonalInfo p JOIN FETCH p.qualifications pq "
						+ "JOIN FETCH p.permanentAddress padd JOIN FETCH p.workExp pexp where p.registrationId = :regId");
		query.setParameter("regId", regID);
		return (PersonalInfo) query.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonalInfo> findByRegistrationId(Set<Long> regID)
	{
		Query query = entityManager.createQuery("Select p from PersonalInfo p JOIN FETCH p.qualifications pq "
						+ "JOIN FETCH p.permanentAddress padd JOIN FETCH p.temporaryAddress tadd JOIN FETCH p.workExp pexp where p.registrationId IN :regId");
		query.setParameter("regId", regID);
		return (List<PersonalInfo>) query.getResultList();
	}

}
