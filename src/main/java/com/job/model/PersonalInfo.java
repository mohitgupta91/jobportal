package com.job.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.job.constants.Category;
import com.job.constants.JobTypes;
import com.job.constants.Religion;

@Entity
@Table(name = "personal_info")

public class PersonalInfo extends BaseEntity {

	@Id
	@SequenceGenerator(name = "personal_seq", initialValue = 1000, allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "personal_seq")
	@Column(name = "reg_id", nullable = false, unique = true)
	private Long registrationId;

	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "gender", nullable = false)
	private String gender;

	@Column(name = "email")
	private String email;

	@Column(name = "dob", nullable = false)
	private LocalDate dob;

	@Column(name = "marital_status")
	private String maritalStatus;

	@Column(name = "spouse_name")
	private String spouseName;

	@Column(name = "father_name")
	private String fatherName;

	@Column(name = "mother_name")
	private String motherName;

	@Column(name = "religion")
	@Enumerated(EnumType.STRING)
	private Religion religion;

	@Column(name = "category")
	@Enumerated(EnumType.STRING)
	private Category category;

	@Column(name = "contact_number")
	private String contactNumber;

	@Column(name = "contact_number2")
	private String contactNumber2;

	@Column(name = "id_type")
	private String idType;

	@Column(name = "id_number")
	private String idNumber;

	@Column(name = "total_exp")
	private Integer totalExperience = 0;

	@Column(name = "exp_salary")
	private Integer expectedSalary = 0;

	@Column(name = "curr_salary")
	private Integer currentSalary = 0;

	@OneToOne(cascade = { CascadeType.ALL })
	@Fetch(FetchMode.SELECT)
	@JoinColumn(name = "permanent_address", referencedColumnName = "id")
	private Address permanentAddress;

	@OneToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "temp_address", referencedColumnName = "id")
	private Address temporaryAddress;

	@OneToMany(cascade = { CascadeType.ALL })
	@Fetch(FetchMode.SELECT)
	@JoinColumn(name = "reg_id")
	private List<WorkExperience> workExp;

	@OneToMany(cascade = { CascadeType.ALL })
	@Fetch(FetchMode.SELECT)
	private List<Qualifications> qualifications;

	@Column(name = "computer_skill")
	private Boolean computerSkill;

	@Column(name = "job_req")
	@Enumerated(EnumType.STRING)
	private JobTypes jobRequirement;

	@OneToOne(cascade = { CascadeType.ALL })
	@Fetch(FetchMode.SELECT)
	private JobPreferance preferance;

	public Long getRegistrationId() {
		return registrationId;
	}

	public void setRegistrationId(Long registrationId) {
		this.registrationId = registrationId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getSpouseName() {
		return spouseName;
	}

	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getContactNumber2() {
		return contactNumber2;
	}

	public void setContactNumber2(String contactNumber2) {
		this.contactNumber2 = contactNumber2;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public Address getPermanentAddress() {
		return permanentAddress;
	}

	public void setPermanentAddress(Address permanentAddress) {
		this.permanentAddress = permanentAddress;
	}

	public Address getTemporaryAddress() {
		return temporaryAddress;
	}

	public void setTemporaryAddress(Address temporaryAddress) {
		this.temporaryAddress = temporaryAddress;
	}

	public List<WorkExperience> getWorkExp() {
		return workExp;
	}

	public void setWorkExp(List<WorkExperience> workExp) {
		this.workExp = workExp;
	}

	public List<Qualifications> getQualifications() {
		return qualifications;
	}

	public void setQualifications(List<Qualifications> qualifications) {
		this.qualifications = qualifications;
	}

	public Boolean getComputerSkill() {
		return computerSkill;
	}

	public void setComputerSkill(Boolean computerSkill) {
		this.computerSkill = computerSkill;
	}

	public JobTypes getJobRequirement() {
		return jobRequirement;
	}

	public void setJobRequirement(JobTypes jobRequirement) {
		this.jobRequirement = jobRequirement;
	}

	public JobPreferance getPreferance() {
		return preferance;
	}

	public void setPreferance(JobPreferance preferance) {
		this.preferance = preferance;
	}

	public Integer getTotalExperience() {
		return totalExperience;
	}

	public void setTotalExperience(Integer totalExperience) {
		this.totalExperience = totalExperience;
	}

	public Integer getExpectedSalary() {
		return expectedSalary;
	}

	public void setExpectedSalary(Integer expectedSalary) {
		this.expectedSalary = expectedSalary;
	}

	public Integer getCurrentSalary() {
		return currentSalary;
	}

	public void setCurrentSalary(Integer currentSalary) {
		this.currentSalary = currentSalary;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Religion getReligion() {
		return religion;
	}

	public void setReligion(Religion religion) {
		this.religion = religion;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "PersonalInfo [registrationId=" + registrationId + ", name=" + name + ", gender=" + gender + ", email="
				+ email + ", dob=" + dob + ", maritalStatus=" + maritalStatus + ", spouseName=" + spouseName
				+ ", fatherName=" + fatherName + ", motherName=" + motherName + ", religion=" + religion + ", category="
				+ category + ", contactNumber=" + contactNumber + ", contactNumber2=" + contactNumber2 + ", idType="
				+ idType + ", idNumber=" + idNumber + ", totalExperience=" + totalExperience + ", expectedSalary="
				+ expectedSalary + ", currentSalary=" + currentSalary + ", permanentAddress=" + permanentAddress
				+ ", temporaryAddress=" + temporaryAddress + ", workExp=" + workExp + ", qualifications="
				+ qualifications + ", computerSkill=" + computerSkill + ", jobRequirement=" + jobRequirement
				+ ", preferance=" + preferance + "]";
	}

}
