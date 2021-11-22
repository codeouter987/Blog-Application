<%@page import="com.project1.helper.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="com.project1.entities.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Login Page</title>

<!-- Font-icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="CSS/style.css" rel="stylesheet" type="text/css"/>
<style>

.banner-background{

clip-path: polygon(0 0, 100% 0, 100% 87%, 50% 100%, 0 88%, 0 93%);
}


</style>

</head>
<body>
<!-- navbar -->
	<%@include file = "navbar.jsp" %>
	
<main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">

	<div class="container">
		<div class="row">
	        <div class="col-md-4 offset-md-4">
	        	<div class="card" style="  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
	        		<div class="card-header primary-background text-white text-center">
	        		<br>
	        		<span class="fa fa-user-plus fa-3x"></span>
	        			<p> Login</p>
	        		</div>
	        		<% 
	        		
	        		Message m = (Message)session.getAttribute("msg");
	        		if(m!=null){

	        		%>
	        		<div class="alert <%= m.getCssClass() %>" role="alert">
	        			<%=m.getContent() %>
					</div>
	        		
	        		<%
	        		
	        			session.removeAttribute("msg");
	        		}
	        		%>
	        		
	            <div class="card-body">
	            	
	            	
						<form action="LoginServlet" method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input  name ="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						<div class="container text-center">
						  <button type="submit" class="btn btn-primary">Submit</button>
						</div>
						</form>
							            	
	  	        </div>
	            </div>
	        </div>
	    </div>
	    </div>
</main>




<!-- Javascript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script  src="JS/script.js" type="text/javascript"></script>
</body>
</html>