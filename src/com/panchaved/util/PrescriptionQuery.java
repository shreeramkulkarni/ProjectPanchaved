package com.panchaved.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PrescriptionQuery {

	static Statement stm;
	static PreparedStatement pstm;
	private static Connection con = DbConnect.Connect();
	static ResultSet rs;
	public static PreparedStatement insertQueryPrescription() {
		try {
			String sql ="INSERT INTO `panchaved_data`.`prescription` (`medicines`, `treatments`, `dietNexercise`, `miscellaneous`, `prescriptionDate`, `patientId`) values(?,?,?,?,?,?)";
			pstm = con.prepareStatement(sql);

		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pstm;
	}

}
