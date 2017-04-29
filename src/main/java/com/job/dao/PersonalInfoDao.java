package com.job.dao;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import com.job.model.PersonalInfo;

@Transactional
@Named("searchService")
public class PersonalInfoDao{

	@PersistenceContext
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public List<PersonalInfo> searchResults(String queryStr, List<Object> params)
	{
		Query query = entityManager.createQuery(queryStr);
		for(int i=1;i<params.size()+1;i++){
			query.setParameter(i, params.get(i-1));
		}
		return query.getResultList();
	}
	
}
