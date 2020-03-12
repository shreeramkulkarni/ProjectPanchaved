package com.panchaved.entity;

import java.io.Serializable;
import java.util.Date;

public class CaseTaking implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	private int patientID;
	private Date date;
	private String co;
	private String ho;
	private String physicalFindings;
	private String oe;
	private String investigations;
	private String cns_rs;
	private String pa;
	
	public CaseTaking() {
		
	}
	
	public CaseTaking(int patientID, Date date, String co, String ho, String physicalFindings, String oe,
			String investigations, String cns_rs, String pa) {
		super();
		this.patientID = patientID;
		this.date = date;
		this.co = co;
		this.ho = ho;
		this.physicalFindings = physicalFindings;
		this.oe = oe;
		this.investigations = investigations;
		this.cns_rs = cns_rs;
		this.pa = pa;
	}

	public int getPatientID() {
		return patientID;
	}

	public void setPatientID(int patientID) {
		this.patientID = patientID;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCo() {
		return co;
	}

	public void setCo(String co) {
		this.co = co;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getPhysicalFindings() {
		return physicalFindings;
	}

	public void setPhysicalFindings(String physicalFindings) {
		this.physicalFindings = physicalFindings;
	}

	public String getOe() {
		return oe;
	}

	public void setOe(String oe) {
		this.oe = oe;
	}

	public String getInvestigations() {
		return investigations;
	}

	public void setInvestigations(String investigations) {
		this.investigations = investigations;
	}

	public String getCns_rs() {
		return cns_rs;
	}

	public void setCns_rs(String cns_rs) {
		this.cns_rs = cns_rs;
	}

	public String getPa() {
		return pa;
	}

	public void setPa(String pa) {
		this.pa = pa;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
