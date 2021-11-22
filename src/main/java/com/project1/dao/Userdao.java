package com.project1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project1.entities.User;

public class Userdao {
	private Connection con;

	public Userdao(Connection con) {
		this.con = con;
	}
	
	//method to insert user to data base:
	
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			
			//user --> database
			
			
			String query = "insert into user(name,email,password,gender,address,city,state,zip) values (?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getCity());
			pstmt.setString(7, user.getState());
			pstmt.setInt(8, user.getZip());
			
			pstmt.executeUpdate();
			f=true;	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
		
	}
	
	//get user by useremail and user password
	
	public User getUserByEmailAndPassword(String email,String password) {
		
		User user=null;
		
		try {
			
			String query="select * from user where email =? and password =?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				user=new User();
				//data from db
				String name = set.getString("name");
				//set to user object
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
                user.setGender(set.getString("gender"));
                
                user.setAddress(set.getString("address"));
                user.setCity(set.getString("city"));
                user.setState(set.getString("state"));
                user.setZip(set.getInt("zip"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}
	
	
public boolean updateUser(User user) {
		
	boolean f = false;
		
		try {
			
			String query="update user set name=? , email =? , password =? , gender=?, address=? , city=? , state=?, zip=?, profile=? where id =?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1 , user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getCity());
			pstmt.setString(7, user.getState());
			pstmt.setInt(8, user.getZip());
			pstmt.setString(9, user.getProfile());
			pstmt.setInt(10, user.getId());


			pstmt.executeUpdate();
			f=true;

			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return f;
	}
	
}
