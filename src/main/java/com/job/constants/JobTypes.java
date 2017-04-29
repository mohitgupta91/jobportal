package com.job.constants;

public enum JobTypes {

	NURSE_JUNIOR_GRADE("Nurse Junior Grade"),
	NURSE_SENIOR_GRADE("Nurse Senior Grade"),			
	TECHNICIAN("Technician"),
	PATHOLOGY("Pathology"),
	RADIOLOGY("Radiology"),
	PHYSIOTHEREPY("Physiotherapy"),
	ICU_ATTENDENT("ICU Attendant"),
	OT_ATTENDENT("OT Attendant"),
	PHARMACIST("Pharmacist"),
	PHARMACY_ATTENDENT("PHARMACY/MEDICAL STORES ATTENDENT"),						
	INCHARGE("MANAGER/STORES INCHARGE"),						
	PRO("P.R.O."),
	OTHER("Other");						

	private String jobType;
	
	JobTypes(String jobType){
		this.setJobType(jobType);
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
}
