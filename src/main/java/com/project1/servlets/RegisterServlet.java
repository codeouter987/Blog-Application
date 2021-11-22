package com.project1.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project1.dao.Userdao;
import com.project1.entities.User;
import com.project1.helper.DBconnection;



@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       response.setContentType("text/html;charset=UTF-8");
	       try(PrintWriter out = response.getWriter()){
	    	   

    		   Thread.sleep(3000);
	    	   
	    	 //getting all the incoming detail from the request...
	    	   
	    
	    	   String check = request.getParameter("user_check");

	    	   if(check==null) {
	    		   out.println("Please check box is not checked");
	    	   }else {
	    		   
	    		   String name = request.getParameter("user_name");
		    	   String email = request.getParameter("user_email");
		    	   String password=request.getParameter("user_password");
		    	   String gender = request.getParameter("gender");
		    	   String address = request.getParameter("user_address");
		    	   String city = request.getParameter("user_city"); 
		    	   String state = request.getParameter("user_state");
		    	   String zip1 = request.getParameter("user_zip");
		    	   int zip = Integer.parseInt(zip1);
		    	   
		    	   
		    	   //craete user object and set all  data to that object..
		    	   
		    	   User user = new User(name, email, password, gender, address, city, state, zip);
		    	   
		    	   
	    		   //create a user dao object....
		    	   
		    	   Userdao dao= new Userdao(DBconnection.createcon());
		    	   if(dao.saveUser(user)) {
		    		   out.print("done");
		    	   }
		    	   else {
		    		   out.print("error");
		    	   }
	    		   
	    		   
	    	   }
	    	  
	    	   }
	    	   catch(Exception e) {
	    		   e.printStackTrace();
	    		  
	    	   }
	
	    	   
	       }
	    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}



}
