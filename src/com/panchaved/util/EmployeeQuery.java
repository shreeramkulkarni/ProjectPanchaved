package com.panchaved.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EmployeeQuery {
	
	static Statement stm;
	static PreparedStatement pstm;
	private static Connection con = DbConnect.Connect();
	static ResultSet rs;
	
	public static PreparedStatement insertQueryEmployee() {
		try {
			String sql ="insert into employee values(?,?)";
			pstm = con.prepareStatement(sql);
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pstm;
	}
	
public static ResultSet getIds() {
		
		try {
			
			String sql ="select employeeID from employee;";
			pstm = con.prepareStatement(sql);
			return pstm.executeQuery();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

public static boolean getIds(long phn) {
	
	try {
		
		String sql ="select employeeID from employee where employeePhone=?;";
		pstm = con.prepareStatement(sql);
		pstm.setLong(1, phn);
		rs =  pstm.executeQuery();
		if(rs.next())
			return true;
	}catch (SQLException e) {
		e.printStackTrace();
	}
	
	return false;
}

}
