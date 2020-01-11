package com.panchaved.entity;

import java.io.Serializable;

public class Prescriptor implements Serializable {

	private static final long serialVersionUID = 1L;
	String prescription;
	String panchTreatments;
	String dietnexercise;
	String miscellaneous;
	
	public Prescriptor() {
		// TODO Auto-generated constructor stub
	}
	
	public Prescriptor(String prescription, String panchTreatments, String dietnexercise, String miscellaneous) {
		super();
		this.prescription = prescription;
		this.panchTreatments = panchTreatments;
		this.dietnexercise = dietnexercise;
		this.miscellaneous = miscellaneous;
	}

	public String getPrescription() {
		return prescription;
	}

	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}

	public String getPanchTreatments() {
		return panchTreatments;
	}

	public void setPanchTreatments(String panchTreatments) {
		this.panchTreatments = panchTreatments;
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
		return "Prescriptor [prescription=" + prescription + ", panchTreatments=" + panchTreatments + ", dietnexercise="
				+ dietnexercise + ", miscellaneous=" + miscellaneous + "]";
	}
	
	
}
