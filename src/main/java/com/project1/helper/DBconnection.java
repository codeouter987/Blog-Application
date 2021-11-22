package com.project1.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

	
	private static Connection con;
	public static Connection createcon() {
		
		try {
			
			
			if(con==null) {
				
				// driver class load 
				
				Class.forName("com.mysql.jdbc.Driver");
				
				//craete a connection ..
				
				con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vijay","root","Lufa@7917");
				
			}
			else {
				
			}
			
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		return con;
	}
}
