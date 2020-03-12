package com.panchaved.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;

import com.panchaved.entity.Patient;
import com.panchaved.entity.Prescription;
import com.panchaved.repository.PrescriptionRepo;
import com.panchaved.util.DbConnect;
import com.panchaved.util.PatientQuery;
import com.panchaved.util.PrescriptionQuery;
import com.panchaved.entity.CaseTaking;

@Service
public class PatientService {
	@Autowired
	PrescriptionRepo pr;
	
	final String PATFILE = System.getenv("PANCH_HOME")+"Patient\\";
	
	public ArrayList<Patient> patients;

	public PatientService() {

		this.patients = new ArrayList<Patient>();
	}
	public List<Prescription> getPrescriptions(int patientId){
		
		return pr.findByPatientId(patientId);
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

		return patients;
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

	public void saveCasetaking(CaseTaking casetake) {
		int patientIdCase = casetake.getPatientID();
		String FOLDER = PATFILE+casetake.getPatientID()+"\\Case\\";
		System.out.println(FOLDER);
		File patientDirectory = new File(FOLDER);
		if(!patientDirectory.exists()) {
			
			patientDirectory.mkdirs();
		}

		Date dateobj = new Date();
		casetake.setDate(dateobj);
		String patientFilePath =  patientIdCase+"\\Case\\"+casetake.getPatientID();
		
		File yourFile = new File(PATFILE+patientFilePath+"_case.ser");//e.g 1_case.ser

		try {
			if(!yourFile.exists()){
				System.out.println("Creating new FIle!!!");
				yourFile.createNewFile();
				ObjectOutputStream os1 = new ObjectOutputStream(new FileOutputStream(yourFile,true));
				os1.writeObject(casetake);
				os1.close();
			}else{
				System.out.println("OPening exixsting file");
				ObjectOutputStream os2 = new ObjectOutputStream(new FileOutputStream(PATFILE+patientFilePath+"_case.ser", true)) {
					@Override
					protected void writeStreamHeader() throws IOException {
						reset();
					}
				};
				os2.writeObject(casetake);
				os2.close();					
			}
		} catch (IOException e) {
			e.printStackTrace();

		}
	}

	public ArrayList<Object> getCaseTaking(Patient p) throws Exception {
		String patientFilePath = p.getPatientId()+"\\Case\\"+p.getPatientId();
		ArrayList<Object> objects = new ArrayList<Object>(); 
		FileInputStream fis = new FileInputStream(PATFILE+patientFilePath+"_case.ser");

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

		return patients;
	}

	public int removePatient(int patientId) throws SQLException {
		Patient p = getSelectedPatient(patientId);
		String patientFilePath = PATFILE+patientId;
		
		File patientFile = new File(patientFilePath);
		PreparedStatement pstm = PatientQuery.deleteQueryPatient();
		try {
			pstm.setInt(1, patientId);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(patientFile.exists()) {
	
			if(!FileSystemUtils.deleteRecursively(patientFile)) {
				return 0;
			}
			
			return pstm.executeUpdate();
		}
		return pstm.executeUpdate();
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


	public void savePrescription(Prescription prescription) {
		pr.save(prescription);
		
	}


}
