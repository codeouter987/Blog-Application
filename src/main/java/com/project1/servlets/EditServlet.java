package com.project1.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.project1.dao.Userdao;
import com.project1.entities.Message;
import com.project1.entities.User;
import com.project1.helper.DBconnection;
import com.project1.helper.Helper;


 

/**
 * Servlet implementation class LoginServlet
 */
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       response.setContentType("text/html;charset=UTF-8");
	       try(PrintWriter out = response.getWriter()){

	    	 //fetch username and password from request......
	    	   
	
	    		   String userEmail = request.getParameter("user_email");
		    	   String userName = request.getParameter("user_name");
		    	   String userPassword = request.getParameter("user_password");
		    	   String userAddresss = request.getParameter("user_address");
		    	   String userCity = request.getParameter("user_city");
		    	   String userState = request.getParameter("user_state");
		    	   String userZip = request.getParameter("user_zip");
		    	   int zip = Integer.parseInt(userZip);

		    	   Part part = request.getPart("pic");
		    	   String filename = part.getSubmittedFileName();
		    	   
		    	   
		    	   HttpSession s = request.getSession();
		    	   User user = (User)s.getAttribute("currentUser");
		    	   
		    	   user.setEmail(userEmail);
		    	   user.setName(userName);
                   user.setPassword(userPassword);
                   user.setAddress(userAddresss);
                   user.setCity(userCity);
                   user.setState(userState);
                   user.setZip(zip);	    
                   
                   String oldFile = user.getProfile();
		    	   user.setProfile(filename);
		    	   
		    	   
		    	   //update database...
		    	   
		    	   Userdao userdao = new Userdao(DBconnection.createcon());
		    	   
		    	   boolean ans = userdao.updateUser(user);
		    	   if(ans) {
		    		   
		    		   
			    	   String path = request.getRealPath("/")+"pic"+File.separator+user.getProfile();

		    		   //delete file...
		    		  
			    	   String  oldPath = request.getRealPath("/")+"pic"+File.separator+oldFile;
			    	   
			    	   
			    	   if(!oldFile.equals("profile.png")) {
			    	   Helper.deleteFile(oldPath);
			    	   }
		    			   if(Helper.saveFile(part.getInputStream(), path)){

				    		      Message msg = new Message("Profile updated....","success","alert-success");
					    	
					    		   s.setAttribute("msg", msg);
		    			   }
		    		
		    	   }else {
		    		  
		    		  Message msg = new Message("Something went wrong..." ,"error","alert-danger");
				    	
		    		   s.setAttribute("msg", msg);
		    	   }
		    	   
		    	   response.sendRedirect("profile.jsp");
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

