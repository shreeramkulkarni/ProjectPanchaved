package com.panchaved.enitity;

import java.sql.Date;

import org.springframework.stereotype.Component;


public class Patient {
	private String patientName;
	

	private int patientId;
	private String gender;
	private long phoneNo;
	private String bloodGroup;
	

	private java.sql.Date dob;
	private String address;
	private String district;
	private String state;
	private String remarks;
	private String casetaking;


	public Patient(int patientId, String patientName, String gender, long phoneNo, String bloodGroup, Date dob, String address,
			String district, String state,String remarks) {
		super();
		this.setPatientId(patientId);
		this.patientName = patientName;
		this.gender = gender;
		this.phoneNo = phoneNo;
		this.bloodGroup = bloodGroup;
		this.dob = dob;
		this.address = address;
		this.district = district;
		this.state = state;
		this.remarks = remarks;
	}
	
	public Patient(int patientId, String patientName, String gender, long phoneNo, String bloodGroup, Date dob, String address,
			String district, String state,String remarks,String casetaking) {
		super();
		this.setPatientId(patientId);
		this.patientName = patientName;
		this.gender = gender;
		this.phoneNo = phoneNo;
		this.bloodGroup = bloodGroup;
		this.dob = dob;
		this.address = address;
		this.district = district;
		this.state = state;
		this.remarks = remarks;
		this.casetaking = casetaking;
	}

	@Override
	public String toString() {
		return "Patient [patientId=" + patientId + ", patientName=" + patientName + ", gender=" + gender + ", phoneNo="
				+ phoneNo + ", bloodGroup=" + bloodGroup + ", dob=" + dob + ", address=" + address + ", district="
				+ district + ", state=" + state + ", remarks =" + remarks +"]";
	}

	public Patient() {}

	
	public Patient(int patientId, String patientName, String gender, long phoneNo, String bloodGroup,
			java.sql.Date dob, String address, String district, String state) {
		// TODO Auto-generated constructor stub
		super();
		this.setPatientId(patientId);
		this.patientName = patientName;
		this.gender = gender;
		this.phoneNo = phoneNo;
		this.bloodGroup = bloodGroup;
		this.dob = dob;
		this.address = address;
		this.district = district;
		this.state = state;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	
	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	
	public String getGender(){
		return gender;
	}

	public void setGender(String gender){
		this.gender=gender;
	}
	

	public java.sql.Date getDob(){
		return dob;
	}

	public void setDob(java.sql.Date dob){
		this.dob=dob;
	}

	public String getAddress(){
		return address;
	}

	public void setAddress(String address){
		this.address=address;
	}

	public String getDistrict(){
		return district;
	}

	public void setDistrict(String district){
		this.district=district;
	}

	public String getState(){
		return state;
	}

	public void setState(String state){
		this.state=state;
	}
	public long getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(long phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}
	
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCasetaking() {
		return casetaking;
	}

	public void setCasetaking(String casetaking) {
		this.casetaking = casetaking;
	}


}
