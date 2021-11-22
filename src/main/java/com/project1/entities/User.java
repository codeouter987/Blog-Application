package com.project1.entities;

import java.sql.*;

public class User {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String address;
	private String city;
	private String state;
	private int zip;
	private Timestamp dateTime;
	private String profile;
	
	

	
	public User(int id, String name, String email, String password, String gender, String address, String city,
			String state, int zip, Timestamp dateTime) {
	
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.dateTime = dateTime;
	}

	
	
	
	
	public User() {
		
	}


	



	public User(String name, String email, String password, String gender, String address, String city, String state,
			int zip) {
	
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
	
	}



	//getter and setters

	public int getId() {
		return id;
	}





	public void setId(int id) {
		this.id = id;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getPassword() {
		return password;
	}





	public void setPassword(String password) {
		this.password = password;
	}





	public String getGender() {
		return gender;
	}





	public void setGender(String gender) {
		this.gender = gender;
	}





	public String getAddress() {
		return address;
	}





	public void setAddress(String address) {
		this.address = address;
	}





	public String getCity() {
		return city;
	}





	public void setCity(String city) {
		this.city = city;
	}





	public String getState() {
		return state;
	}





	public void setState(String state) {
		this.state = state;
	}





	public int getZip() {
		return zip;
	}





	public void setZip(int zip) {
		this.zip = zip;
	}





	public Timestamp getDateTime() {
		return dateTime;
	}





	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}





	public String getProfile() {
		return profile;
	}





	public void setProfile(String profile) {
		this.profile = profile;
	}





	
	
	
	
	
	
}
