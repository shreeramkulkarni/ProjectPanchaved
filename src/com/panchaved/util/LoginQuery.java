package com.panchaved.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class LoginQuery {

	static Statement stm;
	static  PreparedStatement pstm;
	private static Connection con = DbConnect.Connect();
	static ResultSet rs;


	public static boolean selectQueryLogin(long userID,String password,String handlerType) {

		try {
			String sql = "select * from login where userID=? and password=? and handlerType=?";
			pstm = con.prepareStatement(sql);
			pstm.setLong(1, userID);
			pstm.setString(2, password);
			pstm.setString(3, handlerType);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return false;
	}
	
	public static boolean checkNullPassword(long userID) {
		String sql="select password from login where userID=?";
		try
		{
		pstm = con.prepareStatement(sql);
		pstm.setLong(1, userID);
		rs = pstm.executeQuery();
		if(!rs.next())
		{
			return false;
		}else 
			{
				if(rs.getString(1)!=null)
					return true;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public static boolean checkID(long userID) {
		String sql="select password from login where userID=?";
		try
		{
		pstm = con.prepareStatement(sql);
		pstm.setLong(1, userID);
		rs = pstm.executeQuery();
		if(!rs.next())
			return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public static PreparedStatement updateQueryLogin() {
		try {
			String sql ="UPDATE login SET  password = ?, securityQuestion = ?, securityAnswer = ?, handlerType = ? "
					+ "WHERE (userID = ?)";
			pstm = con.prepareStatement(sql);
			
		}catch (SQLException e) {
		
			e.printStackTrace();
		}
		return pstm;
	}
	
	public static ResultSet getSecurityQQuery(long userID) {

		try {
			String sql ="select securityQuestion from login where userID=? ";
			pstm = con.prepareStatement(sql);
			pstm.setLong(1, userID);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return pstm.executeQuery();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return null;
	}
}
