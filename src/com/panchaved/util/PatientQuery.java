package com.panchaved.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class PatientQuery {

	static Statement stm;
	static PreparedStatement pstm;
	private static Connection con = DbConnect.Connect();
	static ResultSet rs;

	public static ResultSet selectQueryPatient(String offset) {
		try {
			String sql ="select * from patient limit "+offset+",20";
			pstm = con.prepareStatement(sql);
			return pstm.executeQuery();
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	public static PreparedStatement insertQueryPatient() {
		try {
			String sql ="insert into patient values(?,?,?,?,?,?,?,?,?,?,?)";
			pstm = con.prepareStatement(sql);

		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pstm;
	}


	public static PreparedStatement updateQueryPatient() {
		try {
			String sql ="UPDATE `panchaved_data`.`patient` SET `patientName` = ?, `gender` = ?,"
					+ " `phoneNo` = ?, `bloodGroup` = ?, `dob` = ?, `address` = ?, `district` = ?, `state` = ?, `remarks` = ? "
					+ "WHERE (`patientId` = ?)";

			pstm = con.prepareStatement(sql);

		}catch (SQLException e) {

			e.printStackTrace();
		}
		return pstm;
	}
	public static PreparedStatement deleteQueryPatient() {
		try {
			String sql ="DELETE from `panchaved_data`.`patient` "
					+ "WHERE (`patientId` = ?)";

			pstm = con.prepareStatement(sql);

		}catch (SQLException e) {

			e.printStackTrace();
		}
		return pstm;
	}

	public static ResultSet selectWQueryPatient(Integer id) {

		try {

			String sql ="select * from patient where patientId="+id+"";
			pstm = con.prepareStatement(sql);
			return pstm.executeQuery();

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static ResultSet selectIds() {

		try {

			String sql ="select patientId from patient;";
			pstm = con.prepareStatement(sql);
			return pstm.executeQuery();

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static ResultSet searchQueryPatient(String searchText,int page) {
		try {

			String sql ="select * from patient where patientName like '"+searchText+"%' limit "+page+",20";
			pstm = con.prepareStatement(sql);
			return pstm.executeQuery();

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

}
