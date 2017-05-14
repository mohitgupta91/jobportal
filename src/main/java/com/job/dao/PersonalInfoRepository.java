package com.job.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.job.constants.Caste;
import com.job.constants.JobTypes;
import com.job.model.PersonalInfo;

@Repository
public interface PersonalInfoRepository extends CrudRepository<PersonalInfo, Long>{
	
	@Query("Select p from PersonalInfo p  where p.registrationId = :regId")
	PersonalInfo findOne(@Param("regId") Long regId);
	
	@Query("Select p from PersonalInfo p where p.registrationId IN :regId")
	List<PersonalInfo> findByRegistrationId(@Param("regId") Set<Long> regId);
	
	List<PersonalInfo> findByCaste(Caste caste);
	
	List<PersonalInfo> findByGender(String gender);
	
	List<PersonalInfo> findByMaritalStatus(String maritalStatus);
	
	List<PersonalInfo> findByPermanentAddress_State(String state);
	
	List<PersonalInfo> findByTemporaryAddress_State(String state);
	
	List<PersonalInfo> findByPermanentAddress_City(String city);
	
	@Query("Select p from PersonalInfo p JOIN p.qualifications pqual where pqual.degree IN :degree")
	List<PersonalInfo> findByQualifications_Degree(@Param("degree") List<String> degree);
	
	List<PersonalInfo> findByTemporaryAddress_City(String city);

	@Query("Select p from PersonalInfo p where p.totalExperience BETWEEN :minExp AND :maxExp)")
	List<PersonalInfo> findByTotalExperience(@Param("maxExp")Integer max, @Param("minExp")Integer min);
	
	@Query("Select p from PersonalInfo p where p.totalExperience <= :maxExp")
	List<PersonalInfo> findByMaxTotalExperience(@Param("maxExp")Integer maxExp);

	@Query("Select p from PersonalInfo p where p.totalExperience >= :minExp")
	List<PersonalInfo> findByMinTotalExperience(@Param("minExp")Integer minExp);

	@Query("Select p from PersonalInfo p where p.expectedSalary BETWEEN :maxSal AND :minSal")
	List<PersonalInfo> findByExpectedSalary(@Param("maxSal")Integer max, @Param("minSal")Integer min);
	
	@Query("Select p from PersonalInfo p where p.expectedSalary <= :maxSal")
	List<PersonalInfo> findByMaxExpectedSalary(@Param("maxSal")Integer maxSal);

	@Query("Select p from PersonalInfo p where p.expectedSalary >= :minSal")
	List<PersonalInfo> findByMinExpectedSalary(@Param("minSal")Integer minSal);

	@Query("Select p from PersonalInfo p where p.dob BETWEEN :maxDob AND :minDob")
	List<PersonalInfo> findByDob(@Param("maxDob")LocalDate max, @Param("minDob")LocalDate min);
	
	@Query("Select p from PersonalInfo p where p.dob <= :maxDob")
	List<PersonalInfo> findByMaxDob(@Param("maxDob")LocalDate maxDob);

	@Query("Select p from PersonalInfo p where p.dob >= :minDob")
	List<PersonalInfo> findByMinDob(@Param("minDob")LocalDate minDob);

	List<PersonalInfo> findByJobRequirement(JobTypes jobRequirement);

}
