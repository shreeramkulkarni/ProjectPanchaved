package com.panchaved.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ForgotPasswordQuery {

	static Statement stm;
	static  PreparedStatement pstm=null;
	private static Connection con = DbConnect.Connect();
	static ResultSet rs;


	public static String forgotpasswordQuery(long userID,String secAns) {

		try {
			String sql ="select * from login where userID=? and securityAnswer=?";
			pstm = con.prepareStatement(sql);
			pstm.setLong(1, userID);
			pstm.setString(2, secAns);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getString("password");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return "Sorry!!! Wrong Credentials!.";
	}

	
}
