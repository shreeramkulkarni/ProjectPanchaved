package com.panchaved.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class DoctorQuery {
	private static ArrayList<PreparedStatement> statements;
	static Statement stm;
	static PreparedStatement pstm1;
	static PreparedStatement pstm;
	private static Connection con = DbConnect.Connect();
	private static Connection con1 = DbConnect.Connect();
	static ResultSet rs;

	public static PreparedStatement deleteQueryDoctor() {
		try {
			String sql ="DELETE from `panchaved_data`.`employee` "
					+ "WHERE (`employeePhone` = ?)";

			pstm = con.prepareStatement(sql);

		}catch (SQLException e) {

			e.printStackTrace();
		}
		return pstm;
	}
	public static ResultSet selectQueryDoctor(String offset) {
		try {
			String sql ="select * from doctor limit "+offset+",20";
			pstm = con.prepareStatement(sql);
			return pstm.executeQuery();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static ArrayList<PreparedStatement> insertQueryDoctor() {
		
		try {
			String sql ="insert into doctor values(?,?,?,?,?,?)";
			String sql1 = "insert into login values(?,?,?,?,?)";
			pstm = con.prepareStatement(sql);
			pstm1 = con.prepareStatement(sql1);
			statements = new ArrayList<PreparedStatement>();
			statements.add(pstm);
			statements.add(pstm1);
			
 		}catch (SQLException e) {
		
			e.printStackTrace();
		}
		return statements ;
	}
	
	public static PreparedStatement updateQueryDoctor() {
		try {
			String sql ="UPDATE doctor SET  doctorName = ?, doctorDOB = ?, doctorQualification = ?, doctorAddress = ?, doctorCity = ? "
					+ "WHERE (doctorId = ?)";
			pstm = con.prepareStatement(sql);
			
		}catch (SQLException e) {
		
			e.printStackTrace();
		}
		return pstm;
	}


	public static ResultSet selectWQueryDoctor(long id) {
		try {
			System.out.println("id :"+id);
			String sql ="select * from doctor where doctorID=?";
			
			pstm = con.prepareStatement(sql);
			pstm.setLong(1, id);
			return pstm.executeQuery();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
public static ResultSet selectIds() {
		
		try {
			
			String sql ="select doctorId from doctor;";
			pstm = con.prepareStatement(sql);
			return pstm.executeQuery();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
}
