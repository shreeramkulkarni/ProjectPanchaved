package com.panchaved.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.panchaved.entity.Login;
import com.panchaved.util.LoginQuery;

@Service
public class LoginService {

	
public boolean updateLoginStatus(Login log) {
	PreparedStatement pstm = LoginQuery.updateQueryLogin();
	try {
	pstm.setString(1,log.getPassword());
	pstm.setString(2,log.getSecurityQuestion());
	pstm.setString(3,log.getSecurityAnswer());
	pstm.setString(4,log.getHandlerType());
	pstm.setLong(5,log.getUserID());
	
	
	int count = pstm.executeUpdate();
	if(count!=0) {
		return true; 
	}
	
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
	return false;
	}
public String getSecurityQuestion(long userID) {
	
	ResultSet rs = LoginQuery.getSecurityQQuery(userID);
	if(rs==null) {
		
		return null;
	}
	String securityQ = null;
	try {
		while (rs.next()) {
			
				securityQ = rs.getString("securityQuestion");
			
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return securityQ;
}

}
