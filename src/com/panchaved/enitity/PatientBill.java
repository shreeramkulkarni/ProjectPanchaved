package com.panchaved.enitity;

import java.util.Map;

public class PatientBill {
	
	private String patientName;
	private int patientId;
	private String doctorName;
	private String dateOfBill;
	private int medicineCharges;
	private int serviceCharges;
	private int consultationFees;
	private int totalBillAmount;
	Map<String,String> billAttributeMap;
	
	public Map<String, String> getBillAttributeMap() {
		return billAttributeMap;
	}



	public void setBillAttributeMap(Map<String, String> billAttributeMap) {
		this.billAttributeMap = billAttributeMap;
	}



	public PatientBill() {
		// TODO Auto-generated constructor stub
	}
	
	
	



	public PatientBill(String patientName, int patientId, String doctorName, String dateOfBill, int medicineCharges,
			int serviceCharges, int consultationFees, int totalBillAmount, Map<String, String> billAttributeMap) {
		super();
		this.patientName = patientName;
		this.patientId = patientId;
		this.doctorName = doctorName;
		this.dateOfBill = dateOfBill;
		this.medicineCharges = medicineCharges;
		this.serviceCharges = serviceCharges;
		this.consultationFees = consultationFees;
		this.totalBillAmount = totalBillAmount;
		this.billAttributeMap = billAttributeMap;
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
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getDateOfBill() {
		return dateOfBill;
	}
	public void setDateOfBill(String dateOfBill) {
		this.dateOfBill = dateOfBill;
	}
	public int getMedicineCharges() {
		return medicineCharges;
	}
	public void setMedicineCharges(int medicineCharges) {
		this.medicineCharges = medicineCharges;
	}
	public int getServiceCharges() {
		return serviceCharges;
	}
	public void setServiceCharges(int serviceCharges) {
		this.serviceCharges = serviceCharges;
	}
	public int getConsultationFees() {
		return consultationFees;
	}
	public void setConsultationFees(int consultationFees) {
		this.consultationFees = consultationFees;
	}
	public int getTotalBillAmount() {
		return totalBillAmount;
	}
	public void setTotalBillAmount(int totalBillAmount) {
		this.totalBillAmount = totalBillAmount;
	}


	
	
}
