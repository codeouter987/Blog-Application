package com.project1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.project1.entities.Categories;
import com.project1.entities.Posts;

public class Postdao {

	Connection con;
	
	public Postdao(Connection con) {
		this.con = con;
	}
	
	
	public ArrayList<Categories> getAllCategories(){
		
		ArrayList<Categories> list = new ArrayList<>();
		try {
			
			String query = "select * from categories";
			Statement st = this.con.createStatement();
			
			ResultSet set = st.executeQuery(query);
			while(set.next()) {
				
				int cid = set.getInt("cid");
				String name=set.getString("name");
				String description = set.getString("description");
				
				Categories c = new Categories(cid,name,description);
				list.add(c);

			}

			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	
	}
	
	
	
	public boolean savePost(Posts p){
		
		boolean f = false;
		
		try {
			
			
			String q = "insert into posts(userID,pTitle,pContent,pCode,pPic,cid) values (?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, p.getUserID());
			pstmt.setString(2, p.getpTitle());
			pstmt.setString(3, p.getpContent());
			pstmt.setString(4, p.getpCode());
			pstmt.setString(5, p.getpPic());
			pstmt.setInt(6, p.getCid());
			
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	return f;

}
	
	
	
	public List<Posts> getAllPosts(){
		List<Posts> list = new ArrayList<>();
		
		
		//Fetch all Posts
		
		try {
			
			PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
			
			ResultSet set = p.executeQuery();
			while(set.next()) {
				
				int userID = set.getInt("userID");
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int cid = set.getInt("cid");
				
				
				
				Posts post = new Posts(userID, pid,pTitle,pContent,pCode,pPic,date,cid);
				
				list.add(post);
						
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
		
	}
	public List<Posts> getPostByCid (int cid){
        List<Posts> list = new ArrayList<>();
		
		
		//Fetch all Posts by cid
try {
			
			PreparedStatement p = con.prepareStatement("select * from posts where cid = ?");
			
			p.setInt(1,cid);
			
			
			ResultSet set = p.executeQuery();
			while(set.next()) {
				
				int userID = set.getInt("userID");
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
			
				
				
				
				Posts post = new Posts(userID, pid,pTitle,pContent,pCode,pPic,date,cid);
				
				list.add(post);
						
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
		
	}
		

}
