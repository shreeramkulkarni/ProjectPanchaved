package com.panchaved.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="patientBill")
public class PatientBill {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="billId")
	private int id;

	private int patientId;
	private String doctorName;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
	private Date dateOfBill;
	private int medicineCharges;
	private int serviceCharges;
	private int consultationFees;

	@OneToMany(mappedBy = "pb",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private List<PatientTreatment> pts = new ArrayList<PatientTreatment>();

	private int totalBillAmount;

	public PatientBill() {
		super();
		
	}
	public PatientBill(int billId, int patientId, String doctorName, Date dateOfBill, int medicineCharges,
			int serviceCharges, int consultationFees,  int totalBillAmount,List<PatientTreatment> pts) {
		super();
		this.id = billId;
		this.patientId = patientId;
		this.doctorName = doctorName;
		this.dateOfBill = dateOfBill;
		this.medicineCharges = medicineCharges;
		this.serviceCharges = serviceCharges;
		this.consultationFees = consultationFees;
		this.pts = pts;
		this.totalBillAmount = totalBillAmount;
	
	}

	public PatientBill(int patientId, String doctorName, Date dateOfBill, int medicineCharges, int serviceCharges,
			int consultationFees, int totalBillAmount, List<PatientTreatment> pts) {
		super();
		this.patientId = patientId;
		this.doctorName = doctorName;
		this.dateOfBill = dateOfBill;
		this.medicineCharges = medicineCharges;
		this.serviceCharges = serviceCharges;
		this.consultationFees = consultationFees;
		this.totalBillAmount = totalBillAmount;
		this.pts = pts;
		
		pts.forEach(x->System.out.println("this:"+this));
	}


	public PatientBill(int id, int patientId, String doctorName, Date dateOfBill, int medicineCharges,
			int serviceCharges, int consultationFees, int totalBillAmount) {
		super();
		this.id = id;
		this.patientId = patientId;
		this.doctorName = doctorName;
		this.dateOfBill = dateOfBill;
		this.medicineCharges = medicineCharges;
		this.serviceCharges = serviceCharges;
		this.consultationFees = consultationFees;
		this.totalBillAmount = totalBillAmount;
		
	}
	public int getBillId() {
		return id;
	}


	public void setBillId(int billId) {
		this.id = billId;
		
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


	public Date getDateOfBill() {
		return dateOfBill;

	}


	public void setDateOfBill(Date dateOfBill) {
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

	public List<PatientTreatment> getPts() {
		return pts;
	}


	public void setPts(List<PatientTreatment> pts) {

//		pts.forEach((x)->{x.setPb(this);});
		this.pts = pts;
	}

	@Override
	public String toString() {
		return "PatientBill [billId=" + id + ", patientId=" + patientId + ", doctorName=" + doctorName
				+ ", dateOfBill=" + dateOfBill + ", medicineCharges=" + medicineCharges + ", serviceCharges="
				+ serviceCharges + ", consultationFees=" + consultationFees + ", pts=" + pts + ", totalBillAmount="
				+ totalBillAmount + "]";
	}

}
