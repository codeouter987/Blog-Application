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

import com.project1.dao.Postdao;
import com.project1.entities.Posts;
import com.project1.entities.User;
import com.project1.helper.DBconnection;
import com.project1.helper.Helper;


@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      try(PrintWriter out = response.getWriter()){
    	  
    	  int cid = Integer.parseInt(request.getParameter("cid")); 
    	  String pTitle = request.getParameter("pTitle");
    	  String pContent = request.getParameter("pContent");
    	  String pCode = request.getParameter("pCode");
    	  Part part = request.getPart("pPic");
    	  
    	  //getting currentuser id//
    	  HttpSession session = request.getSession();
    	  User user = (User) session.getAttribute("currentUser");
    	  
    	  	//out.println(part.getSubmittedFileName());
    	  	
    	  	Posts p = new Posts(cid,pTitle,pContent,pCode,part.getSubmittedFileName(),null,user.getId());
    	  	
    	  	Postdao dao = new Postdao(DBconnection.createcon());
	    	   if(dao.savePost(p)) {
	    		  
	    		   String path = request.getRealPath("/")+"blog_pic"+File.separator+part.getSubmittedFileName();
	    		   Helper.saveFile(part.getInputStream(), path);
	    		   out.println("done");
	    	   }else {
	    		   out.println("error");
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

