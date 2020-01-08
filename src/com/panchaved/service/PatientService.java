package com.panchaved.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.panchaved.enitity.Doctor;
import com.panchaved.enitity.Patient;
import com.panchaved.util.CaseTaking;
import com.panchaved.util.DbConnect;
import com.panchaved.util.DoctorQuery;
import com.panchaved.util.PatientQuery;
import com.panchaved.util.Prescriptor;

@Service
public class PatientService {


	public ArrayList<Patient> patients;
	public PatientService() {

		this.patients = new ArrayList<Patient>();
	}

	public void registerPatient() {
		Connection con = DbConnect.Connect();
		try {
			Statement stmt = con.createStatement();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


	public boolean insertPatient(Integer id, String patname, String gender, long contact, String bloodgrp,Date dob,String address,String district,String state,String remarks)
	{
		try {

			String sql ="insert into patient values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstm = PatientQuery.insertQueryPatient();
			pstm.setInt(1, id);
			pstm.setString(2, patname);
			pstm.setString(3, gender);
			pstm.setLong(4, contact);
			pstm.setString(5, bloodgrp);
			pstm.setDate(6, (java.sql.Date) dob);
			pstm.setString(7, address);
			pstm.setString(8, district);
			pstm.setString(9, state);
			pstm.setString(10, remarks);
			pstm.setString(11, "");
			int count = pstm.executeUpdate();
			if(count!=0) {
				return true; 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return false;
	}

	public ArrayList<Patient> getAllRecords(int page) {
		int o = (page-1) * 20;
		System.out.println(Integer.toString(o));
		ResultSet rs = PatientQuery.selectQueryPatient(Integer.toString(o));
		patients.clear();
		try {
			while(rs.next()) {
				int patientId = rs.getInt(1);
				String patientName = rs.getString("patientName");
				String gender = rs.getString(3);
				long phoneNo = rs.getLong(4);
				String bloodGroup = rs.getString(5); 
				java.util.Date dob = rs.getDate(6);
				String address =rs.getString(7);
				String district =rs.getString(8);
				String state = rs.getString(9);
				Patient patient = new Patient(patientId, patientName, gender, phoneNo, bloodGroup, (java.sql.Date) dob, address, district, state);
				patients.add(patient);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return (ArrayList<Patient>) patients;
	}

	public Patient getSelectedPatient(Integer id) {
		ResultSet rs = PatientQuery.selectWQueryPatient(id);
		patients.clear();
		Patient patient = null;

		try {
			while(rs.next()) {
				int patientId = rs.getInt(1);
				String patientName = rs.getString("patientName");
				String gender = rs.getString(3);
				long phoneNo = rs.getLong(4);
				String bloodGroup = rs.getString(5); 
				java.util.Date dob = rs.getDate(6);
				String address =rs.getString(7);
				String district =rs.getString(8);
				String state = rs.getString(9);
				String remarks = rs.getString(10);
				patient = new Patient(patientId, patientName, gender, phoneNo, bloodGroup, (java.sql.Date) dob, address, district, state,remarks);
				patients.add(patient);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return patient;
	}

	public boolean updatePatient(Patient pat) {


		try {

			PreparedStatement pstm = PatientQuery.updateQueryPatient();

			pstm.setString(1, pat.getPatientName());
			pstm.setString(2, pat.getGender());
			pstm.setLong(3, pat.getPhoneNo());
			pstm.setString(4, pat.getBloodGroup());
			pstm.setDate(5, pat.getDob());
			pstm.setString(6, pat.getAddress());
			pstm.setString(7, pat.getDistrict());
			pstm.setString(8, pat.getState());
			pstm.setString(9, pat.getRemarks());
			pstm.setInt(10, pat.getPatientId());
			int count = pstm.executeUpdate();
			if(count!=0) {
				return true; 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return false;

	}

	public void saveCasetaking(Patient pat,CaseTaking casetake) {
		
		String FOLDER = System.getenv("PANCH_HOME")+"Patient\\"+casetake.getPatientID()+"_"+pat.getPatientName();
		System.out.println(FOLDER);
		File newFolder = new File(FOLDER);
		newFolder.mkdirs();
		
		Date dateobj = new Date();
		casetake.setDate(dateobj);
		String fname = casetake.getPatientID()+"_"+pat.getPatientName();
		File yourFile = new File(System.getenv("PANCH_HOME")+"Patient\\"+fname+"\\"+fname+"_case.txt");//e.g 1_sukrut_case.txt
			
		try {
			if(!yourFile.exists()){
				System.out.println("Creating new FIle!!!");
				yourFile.createNewFile();
				ObjectOutputStream os1 = new ObjectOutputStream(new FileOutputStream(yourFile,true));
				os1.writeObject(casetake);
				os1.close();
			}else{
				System.out.println("OPening exixsting file");
				ObjectOutputStream os2 = new ObjectOutputStream(new FileOutputStream(System.getenv("PANCH_HOME")+"Patient\\"+fname+"\\"+fname+"_case.txt", true)) {
					protected void writeStreamHeader() throws IOException {
						reset();
					}
				};
				os2.writeObject(casetake);
				os2.close();					
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}

	public ArrayList<Object> getCaseTaking(Patient p) throws Exception {
		String fname = p.getPatientId()+"_"+p.getPatientName();
		ArrayList<Object> objects = new ArrayList<Object>(); 
		FileInputStream fis = new FileInputStream(System.getenv("PANCH_HOME")+"Patient\\"+fname+"\\"+fname+"_case.txt");

		ObjectInputStream ois = new ObjectInputStream(fis);
		

		Object obj =null;

		boolean isExist = true;

		while(isExist){
			if(fis.available() != 0){
				obj = ois.readObject();    
				objects.add(obj);
			}
			else{
				isExist =false;
			}
		}
		System.out.println(objects.size());
		for (Object object : objects) {
			System.out.println(object);
		} 
		return objects;     
	}
	
	public ArrayList<Patient> getSearchRecords(String searchText,int page) {
		int p = (page-1)*20;
		ResultSet rs = PatientQuery.searchQueryPatient(searchText,p);
		patients.clear();
		try {
			while(rs.next()) {
				int patientId = rs.getInt(1);
				String patientName = rs.getString("patientName");
				String gender = rs.getString(3);
				long phoneNo = rs.getLong(4);
				String bloodGroup = rs.getString(5); 
				java.util.Date dob = rs.getDate(6);
				String address =rs.getString(7);
				String district =rs.getString(8);
				String state = rs.getString(9);
				Patient patient = new Patient(patientId, patientName, gender, phoneNo, bloodGroup, (java.sql.Date) dob, address, district, state);
				patients.add(patient);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return (ArrayList<Patient>) patients;
	}
	
	public ArrayList<Integer> getIds(){
		ArrayList<Integer> id = new ArrayList<Integer>();
		try {
			ResultSet rs = PatientQuery.selectIds(); 
			while(rs.next())
				id.add(rs.getInt("patientId"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;	
	}
	
	
public void savePrescription(Patient pat,Prescriptor prescription) {
		
		String FOLDER = System.getenv("PANCH_HOME")+"Patient\\"+pat.getPatientId()+"_"+pat.getPatientName();
		System.out.println(FOLDER);
		File newFolder = new File(FOLDER);
		newFolder.mkdirs();
		
		String fname = pat.getPatientId()+"_"+pat.getPatientName();
		File yourFile = new File(System.getenv("PANCH_HOME")+"Patient\\"+fname+"\\"+fname+"_presc.txt");//e.g 1_sukrut_case.txt
			
		try {
			if(!yourFile.exists()){
				System.out.println("Creating new FIle!!!");
				yourFile.createNewFile();
				ObjectOutputStream os1 = new ObjectOutputStream(new FileOutputStream(yourFile,true));
				os1.writeObject(prescription);
				os1.close();
			}else{
				System.out.println("OPening exixsting file");
				ObjectOutputStream os2 = new ObjectOutputStream(new FileOutputStream(System.getenv("PANCH_HOME")+"Patient\\"+fname+"\\"+fname+"_presc.txt", true)) {
					protected void writeStreamHeader() throws IOException {
						reset();
					}
				};
				os2.writeObject(prescription);
				os2.close();					
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}
	
public ArrayList<Object> getPrescriptions(Patient p) throws Exception {
	String fname = p.getPatientId()+"_"+p.getPatientName();
	ArrayList<Object> objects = new ArrayList<Object>(); 
	FileInputStream fis = new FileInputStream(System.getenv("PANCH_HOME")+"Patient\\"+fname+"\\"+fname+"_presc.txt");

	ObjectInputStream ois = new ObjectInputStream(fis);
	

	Object obj =null;

	boolean isExist = true;

	while(isExist){
		if(fis.available() != 0){
			obj = ois.readObject();    
			objects.add(obj);
		}
		else{
			isExist =false;
		}
	}
	System.out.println(objects.size());
	for (Object object : objects) {
		System.out.println(object);
	} 
	return objects;     
}
	
}
