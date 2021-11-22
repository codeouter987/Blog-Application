package com.project1.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.project1.entities.Message;
import com.project1.entities.User;
import com.project1.helper.DBconnection;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       response.setContentType("text/html;charset=UTF-8");
	       try(PrintWriter out = response.getWriter()){
	    	   
		    		   HttpSession s =  request.getSession();
		    		   s.removeAttribute("currentUser");
		    		   
			           Message m = new Message("Logout succesfully","success","alert-success");

			           
			           s.setAttribute("msg", m);
			           
		    		   response.sendRedirect("Login.jsp");
		    	
	       }catch(Exception e) {
	    		   e.printStackTrace();
	    		  
	    	   }
	
	       }
	       
	   
	    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}



	       }
	
