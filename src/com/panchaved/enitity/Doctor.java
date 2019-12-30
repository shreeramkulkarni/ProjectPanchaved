package com.panchaved.enitity;

import java.util.Date;


public class Doctor {

	
	private  long doctorID;
	private String doctorName;
	private java.sql.Date doctorDOB;
	private String doctorQualification;
	private String doctorAddress;
	private String doctorCity;
	
	public Doctor() {}
	
	public Doctor(long doctorID,String doctorName, Date doctorDOB, String doctorQualification,
			String doctorAddress, String doctorCity) {
		super();
		this.doctorID = doctorID;
		this.doctorName = doctorName;
		this.doctorDOB = (java.sql.Date) doctorDOB;
		this.doctorQualification = doctorQualification;
		this.doctorAddress = doctorAddress;
		this.doctorCity = doctorCity;
	}
	
	
	public long getDoctorID() {
		return doctorID;
	}


	public void setDoctorID(long doctorID) {
		this.doctorID = doctorID;
	}


	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public java.sql.Date getDoctorDOB() {
		return doctorDOB;
	}
	public void setDoctorDOB(Date doctorDOB) {
		this.doctorDOB = (java.sql.Date)doctorDOB;
	}
	public String getDoctorQualification() {
		return doctorQualification;
	}
	public void setDoctorQualification(String doctorQualification) {
		this.doctorQualification = doctorQualification;
	}
	public String getDoctorAddress() {
		return doctorAddress;
	}
	public void setDoctorAddress(String doctorAddress) {
		this.doctorAddress = doctorAddress;
	}
	public String getDoctorCity() {
		return doctorCity;
	}
	public void setDoctorCity(String doctorCity) {
		this.doctorCity = doctorCity;
	}
	
	@Override
	public String toString() {
		return "Doctor [doctorID=" + doctorID + ", doctorName=" + doctorName
				+ ", doctorDOB=" + doctorDOB + ", doctorQualification=" + doctorQualification + ", doctorAddress="
				+ doctorAddress + ", doctorCity=" + doctorCity + "]";
	}
}
