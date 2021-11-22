<%@page import="com.project1.helper.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Register Page</title>

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
	
<main class=" primary-background p-5 banner-background" style="height:200vh">

	<div class="container">
		<div class="row">
	        <div class="col-md-4 offset-md-4">
	        	<div class="card" style="  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
	        		<div class="card-header primary-background text-white text-center">
	        		<br>
	        		<span class="fa fa-user-circle fa-3x"></span>
	        			<p> Register</p>
	        		</div>
	        		<h5 id ="msg" class="center-align"></h5>
	            <div class="card-body">
	            	
	            	
	<form action="RegisterServlet" method="post" id ="user_frm">
  <div class="form-row">
  
    <div class="form-group">
      <label for="inputEmail4">Username</label>
      <input  name="user_name" type="text" class="form-control" id="inputEmail4" placeholder="Enter your Name">
    </div>
    <div class="form-group">
      <label for="inputEmail4">Email</label>
      <input name="user_email" type="email" class="form-control" id="username" placeholder="Enter your email">
    </div>
    <div class="form-group">
      <label for="inputPassword4">Password</label>
      <input name="user_password" type="password" class="form-control" id="inputPassword4" placeholder="Enter your Password">
    </div>
  </div>
  <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio"  id="gender" name="gender" value="Male">Male
    <input type="radio"  id="gender" name="gender" value="Female">Female
    
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address</label>
    <input name="user_address" type="text" class="form-control" id="inputAddress2" placeholder="Enter your Address">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input name="user_city" type="text" class="form-control" id="inputCity">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select name="user_state" id="inputState" class="form-control">
        <option selected>Choose</option>
        <option>Maharashtra</option>
        <option>keral</option>
        <option>Delhi</option>
      </select>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <input name="user_zip" type="text" class="form-control" id="inputZip">
    </div>
  </div>
  
  <div class="form-group">
    <div class="form-check">
      <input name="user_check" class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
       Agree Terms and Conditions
      </label>
    </div>
  </div>
  
  <div class="container text-center" id="loader" style="display:none;">
  
  <span class="fa fa-refresh fa-spin fa-4x"></span>
  <h4>Please wait...</h4>
  </div>

  <button type="submit" id="submit-btn" class="btn btn-primary">Sign in</button>
 
</form>
							            	
	  	        </div>
	  	        <div class="card-footer">
	  	          <h6 class="text-center">Accont already? <a href="Login.jsp"> Login</a> </h6>
	  	        </div>
	  	        
	  	        
	            </div>
	        </div>
	    </div>
	    </div>
</main>





<!-- Javascript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script  src="JS/script.js" type="text/javascript"></script>
	 
	 <script>
	    $(document).ready(function(){
		 
		 $("#user_frm").on('submit',function(event) {
			 event.preventDefault();
			 
			 //var f = $(this).serialize();
			 
			 let f = new FormData(this);
			 
			$("#submit-btn").hide();
			$("#loader").show();
			
			 
		
			 
			 
			 $.ajax({
				 url: "RegisterServlet",
				 data: f,
				 type: 'POST',
				 success: function(data, textStatus, jqXHR){
				
				
					 console.log(data.trim());
					 if(data.trim()==='done'){
						    $("#submit-btn").show();
							$("#loader").hide();
						 $('#msg').html("Successfully Registered !!");
						 $('#msg').addClass("green-text");

					 }else{
						 $('#msg').html("Something went wrong on server..!!");

					 }
					 
				 },
				 error: function(jqXHR,textStatus, errorThrown){
			
					 console.log("error........");
					 $("#submit-btn").show();
				     $("#loader").hide();
					
				     
					 $('#msg').html("Something went wrong on server..!!");
					 $('#msg').addClass("red-text");
				 },
				 
				 processData: false,
				 contentType: false
				 
			 })
		 });
		 
 		});
	 </script>

</body>
</html>