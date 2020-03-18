package com.panchaved.service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.panchaved.entity.*;
import com.panchaved.util.*;

@Component
public class DoctorService {
	
	public ArrayList<Doctor> doctors;

	public DoctorService() {
		super();
		this.doctors = new ArrayList<Doctor>();
	}
	
	public int removeDoctor(long doctorID) throws SQLException {
		PreparedStatement pstm = DoctorQuery.deleteQueryDoctor();
		try {
			pstm.setLong(1, doctorID);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pstm.executeUpdate();
	}
	
	public boolean registerDoctor(Login login) {
			
		return true;
	}
	public boolean insertDoctor(Doctor doc)
	{
		try {
			PreparedStatement pstm2 = EmployeeQuery.insertQueryEmployee(); //insert into employee table
			PreparedStatement pstm = DoctorQuery.insertQueryDoctor().get(0); //insert into doctor table
//			PreparedStatement pstm1 = DoctorQuery.insertQueryDoctor().get(1);
			ResultSet rs = EmployeeQuery.getIds();
			while(rs.next())
			{
				if(rs.isLast())
				{
					System.out.println("LAst ID: "+rs.getInt(1));
					break;
				}
			}
			pstm2.setInt(1, rs.getInt(1)+1);
			pstm2.setLong(2, doc.getDoctorID());
			pstm2.executeUpdate();
			
//			pstm1.setLong(1, doc.getDoctorID());
//			pstm1.setNull(2, java.sql.Types.NULL);
//			pstm1.setNull(3, java.sql.Types.NULL);
//			pstm1.setNull(4, java.sql.Types.NULL);
//			pstm1.setNull(5, java.sql.Types.NULL);
//			pstm1.executeUpdate();
			
			pstm.setLong(1, doc.getDoctorID());
			pstm.setString(2, doc.getDoctorName());
			pstm.setDate(3, doc.getDoctorDOB());
			pstm.setString(4, doc.getDoctorQualification());
			pstm.setString(5, doc.getDoctorAddress());
			pstm.setString(6, doc.getDoctorCity());
			
			int count = pstm.executeUpdate();
			if(count!=0) {
				return true; 
			}	
		} catch (SQLException e) {

			e.printStackTrace();
		}  
		return false;
	}
	
	public List getAllRecords(int page) { //Doctor's Service Mettod
		int o = (page-1) * 20;
		System.out.println(Integer.toString(o));
		ResultSet rs = DoctorQuery.selectQueryDoctor(Integer.toString(o));
		doctors.clear();
		System.out.println(Arrays.toString(doctors.toArray()));
		try {
			while(rs.next()) {
				
				long doctorId = rs.getLong(1);
				String doctorName = rs.getString(2);
				java.util.Date doctorDOB = rs.getDate(3);
				String  doctorQualification = rs.getString(4); 
				String doctorAddress =rs.getString(5);
				String doctorCity =rs.getString(6);
				Doctor doctor = new Doctor(doctorId, doctorName, doctorDOB, doctorQualification,
						doctorAddress, doctorCity);
				doctors.add(doctor);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		 
		return doctors;
	}


	public boolean updateDoc(Doctor doc) {
		
		
		try {
			System.out.println("doc"+doc);
			PreparedStatement pstm = DoctorQuery.updateQueryDoctor();
			
			pstm.setString(1, doc.getDoctorName());
			pstm.setDate(2, doc.getDoctorDOB());
			pstm.setString(3, doc.getDoctorQualification());
			pstm.setString(4, doc.getDoctorAddress());
			pstm.setString(5, doc.getDoctorCity());
			pstm.setLong(6, doc.getDoctorID());
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


	public Doctor getSelectedDoctor(long id) {
		// TODO Auto-generated method stub
		ResultSet rs = DoctorQuery.selectWQueryDoctor(id);
		doctors.clear();
		Doctor doctor =null;
		
		try {
			while(rs.next()) {
				
				long doctorID = rs.getLong(1);
				String doctorName = rs.getString(2);
				java.util.Date doctorDOB = rs.getDate(3);
				String  doctorQualification = rs.getString(4); 
				String doctorAddress =rs.getString(5);
				String doctorCity =rs.getString(6);
				doctor = new Doctor(doctorID, doctorName, doctorDOB, doctorQualification,
						doctorAddress, doctorCity);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return doctor;
	}
	
	public ArrayList<Integer> getIDs()
	{
		ArrayList<Integer> id = new ArrayList<Integer>();
		try {
			ResultSet rs = DoctorQuery.selectIds(); 
			while(rs.next())
				id.add(rs.getInt("doctorId"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;	
	}
	
}
