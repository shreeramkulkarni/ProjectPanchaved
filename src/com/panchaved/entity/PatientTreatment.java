package com.panchaved.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class PatientTreatment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private int quantity;
	private int rate;
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(referencedColumnName = "billId")
	private PatientBill pb;
	
	
	public PatientTreatment() {
		super();
	}
	public PatientTreatment(int id, String name, int quantity, int rate) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.rate = rate;
	}
	
	public PatientTreatment(int id, String name, int quantity, int rate, PatientBill pb) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.rate = rate;
		this.pb = pb;
	}
	
	@JsonIgnore
	public void setPb(PatientBill pb) {
		this.pb = pb;
	}
	@JsonIgnore
	public PatientBill getPb() {
		return pb;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	
	@Override
	public String toString() {
		return "PatientTreatment [id=" + id + ", name=" + name + ", quantity=" + quantity + ", rate=" + rate + "]";
	}
	
	
}
