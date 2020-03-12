package com.panchaved.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonFormat;
@Entity
public class Prescription implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int prescriptionId;
	
	@Column(name = "patientId")
	private int patientId;
	
	private String prescription;
	
	@Column(name ="dietNexercise" )
	private String dietnexercise;
	
	private String miscellaneous;
	
	@Column(name = "treatments")
	private String treatment;
	
	@Column(name = "prescriptionDate")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
	private Date prescriptionDate;
	

	public Prescription(int patientId, int prescriptionId, String prescription, 
			String dietnexercise, String miscellaneous, String treatment, Date prescriptionDate) {
		super();
		this.patientId = patientId;
		this.prescriptionId = prescriptionId;
		this.prescription = prescription;
		this.dietnexercise = dietnexercise;
		this.miscellaneous = miscellaneous;
		this.treatment = treatment;
		this.prescriptionDate = prescriptionDate;
	}
	public Prescription() {
		// TODO Auto-generated constructor stub
	}


	public Prescription(String prescription, String dietnexercise, String miscellaneous,
			String treatment, Date prescriptionDate) {
		super();
		this.prescription = prescription;
		this.dietnexercise = dietnexercise;
		this.miscellaneous = miscellaneous;
		this.treatment = treatment;
		this.prescriptionDate = prescriptionDate;
	}


	public Date getPrescriptionDate() {
		return prescriptionDate;
	}



	public void setPrescriptionDate(Date prescriptionDate) {
		this.prescriptionDate = prescriptionDate;
	}



	public String getPrescription() {
		return prescription;
	}

	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}

	public String getDietnexercise() {
		return dietnexercise;
	}

	public void setDietnexercise(String dietnexercise) {
		this.dietnexercise = dietnexercise;
	}

	public String getMiscellaneous() {
		return miscellaneous;
	}

	public void setMiscellaneous(String miscellaneous) {
		this.miscellaneous = miscellaneous;
	}

	@Override
	public String toString() {
		return "Prescription [prescription=" + prescription + ", dietnexercise=" + dietnexercise 
				+ ", miscellaneous=" + miscellaneous + ", treatment=" + treatment
				+ ", prescriptionDate=" + prescriptionDate + "]";
	}

	public String getTreatment() {
		return treatment;
	}

	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}


	public int getPrescriptionId() {
		return prescriptionId;
	}


	public void setPrescriptionId(int prescriptionId) {
		this.prescriptionId = prescriptionId;
	}


	public int getPatientId() {
		return patientId;
	}


	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	
	
	
}
