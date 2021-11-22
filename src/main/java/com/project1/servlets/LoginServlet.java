package com.project1.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project1.dao.Userdao;
import com.project1.entities.Message;
import com.project1.entities.User;
import com.project1.helper.DBconnection;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       response.setContentType("text/html;charset=UTF-8");
	       try(PrintWriter out = response.getWriter()){
	    	   

 		  
	    	   
	    	 //fetch username and password from request......
	    	   
	    

	    	  
	    		   
	    		   String userEmail = request.getParameter("email");
		    	   String userPassword = request.getParameter("password");
		    	   
		    	   
		    	   
		    	   
		    	   
		    	   
	    		   //create a user dao object....
		    	   
		    	   Userdao dao= new Userdao(DBconnection.createcon());
		    	   
		    	   User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		    	   
		    	   if(u==null) {
		    		   
		    		   //login..
		    		   //error
		    		  Message msg = new Message("Invalid details! try again..","error","alert-danger");
		    		  
		    		  response.sendRedirect("Login.jsp");

		    		   HttpSession s =  request.getSession();
		    		   s.setAttribute("msg", msg);
		    	   }else {
		    		   
		    		   //login success.....
		    		   
		    		   HttpSession s =  request.getSession();
		    		   s.setAttribute("currentUser", u);
		    		   response.sendRedirect("profile.jsp");
		    		   
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
