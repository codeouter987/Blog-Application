<%@page import="com.project1.helper.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Main Page</title>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="CSS/style.css" rel="stylesheet" type="text/css"/>
<style>

.banner-background{

clip-path: polygon(0 0, 100% 0, 100% 87%, 50% 100%, 0 88%, 0 93%);
}


</style>

</head>

<!-- Font-icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>
	<!-- navbar -->
	<%@include file = "navbar.jsp" %>
	
	<!-- banner -->
	
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
			    <h3 class="display-3"> Welcome to codeouter</h3>
				
				<p>Your clear path to becoming a successful developer Learn through online best free projects and guided learning maps.<br>Develop your skills and start your career.</p>
				<p>The purpose of this latest post is to give you an idea of some of the best projects you can use to sharpen your coding skills.</p>
		    
		    	
		    	<button class="btn btn-outline-light btn-lg"><span class="fa fa-check-circle-o"></span>Start ! its free </button>
		   		<a href="Login.jsp" class="btn btn-outline-light btn-lg"><span class="	fa fa-user-circle-o fa-spin"></span>Login</a>
		   		
		    </div>
		</div>
	
	</div>
	
	<!-- cards -->
	
	<div class="container">
	
		<div class="row mb-2">
		
			<div class="col-md-4">
			
				<div class="card">
 
                <div class="card-body">
                <h5 class="card-title">Spring Boot Implementation of Login and Register</h5>
                <p class="card-text">In this tutorial,we will learn how to implement full login and register using spring boot.</p>
                <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
                </div>
                </div>
                <div class="col-md-4">
                <div class="card">
            
                <div class="card-body">
                <h5 class="card-title">Spring Boot Implementation of Login and Register</h5>
                <p class="card-text">In this tutorial,we will learn how to implement full login and register using spring boot.</p>
                <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
                </div>
                </div>
                <div class="col-md-4">
                <div class="card">
               
                <div class="card-body">
                <h5 class="card-title">Spring Boot Implementation of Login and Register</h5>
                <p class="card-text">In this tutorial,we will learn how to implement full login and register using spring boot.</p>
                <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
                </div>
                </div>
               
           </div>
	   </div>
	   
	   
	<div class="container">
	
		<div class="row">
		
			<div class="col-md-4">
			
				<div class="card">
             
                <div class="card-body">
                <h5 class="card-title">Spring Boot Implementation of Login and Register</h5>
                <p class="card-text">In this tutorial,we will learn how to implement full login and register using spring boot.</p>
                <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
                </div>
                </div>
                <div class="col-md-4">
                <div class="card">
         
                <div class="card-body">
                <h5 class="card-title">Spring Boot Implementation of Login and Register</h5>
                <p class="card-text">In this tutorial,we will learn how to implement full login and register using spring boot.</p>
                <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
                </div>
                </div>
                <div class="col-md-4">
                <div class="card">
             
                <div class="card-body">
                <h5 class="card-title">Spring Boot Implementation of Login and Register</h5>
                <p class="card-text">In this tutorial,we will learn how to implement full login and register using spring boot.</p>
                <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
                </div>
                </div>
               
           </div>
	   </div>
	

	
		
	
<!-- Javascript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script  src="JS/script.js" type="text/javascript"></script>

</body>
</html>