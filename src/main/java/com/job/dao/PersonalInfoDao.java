package com.job.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.job.model.PersonalInfo;

@Transactional
@Component
public class PersonalInfoDao {
	
	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public List<PersonalInfo> searchResults(String queryStr, List<Object> params) {
		Query query = entityManager.createQuery(queryStr);
		for (int i = 1; i < params.size() + 1; i++) {
			query.setParameter(i, params.get(i - 1));
		}
		return (List<PersonalInfo>) query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<PersonalInfo> findAll() {
		Query query = entityManager.createQuery("Select p from PersonalInfo p JOIN  p.qualifications pq "
				+ "JOIN p.permanentAddress padd JOIN p.workExp pexp");
		return (List<PersonalInfo>) query.getResultList();	}

	public PersonalInfo getByRegistrationId(Long regID) {
		Query query = entityManager.createQuery("Select p from PersonalInfo p JOIN  p.qualifications pq "
				+ "JOIN p.permanentAddress padd JOIN p.workExp pexp where p.registrationId = :regId");
		query.setParameter("regId", regID);
		return (PersonalInfo) query.getSingleResult();
	}

	public void saveOrUpdate(PersonalInfo personalInfo) {
		if(personalInfo.getRegistrationId() != null)
		{
			entityManager.merge(personalInfo);
		}
		else {
			entityManager.persist(personalInfo);	
		}
	}
}
