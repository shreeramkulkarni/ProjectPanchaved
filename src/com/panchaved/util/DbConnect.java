package com.panchaved.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbConnect {
	public static Connection con=null;
    static String user = System.getenv("SQLUSERNAME");
    static String password = System.getenv("SQLPASSWORD");
            
    
    public static Connection Connect() 
    {
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println(user+" "+password);  

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/panchaved_data",user, password);  
            return con;
        } catch (ClassNotFoundException|SQLException ex) 
        {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            return null;
            
        }     
    }
}