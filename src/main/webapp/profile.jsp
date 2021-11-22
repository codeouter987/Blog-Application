<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.project1.entities.User"%>
    <%@page errorPage="Error404.jsp" %>
    <%@page import="com.project1.entities.Message"%>
    <%@page import="com.project1.helper.DBconnection"%>
    <%@page import="com.project1.dao.Postdao"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="com.project1.entities.Categories"%>
    
    <%
    
    User user=(User)session.getAttribute("currentUser");
    if (user==null){
    	response.sendRedirect("Login.jsp");
    }
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

<!-- Navbar -->


<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp">Codeouter Blogs</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Spring Boot</a>
          <a class="dropdown-item" href="#">JSP</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">contact us</a>
      </li>
 	   <li class="nav-item">
        <a class="nav-link" href="#" data-toggle ="modal" data-target="#add_post">Post</a>
      </li>
    </ul>
   <ul class="navbar-nav mr-right">
   <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%=user.getName() %> </a>
   </li>
       
   <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
   </li>
       
   </ul>
  </div>
</nav>


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
	        		
	        		
	        		<!-- Main start body of the page -->
	        		
	        		<main>
	        		
	        		
	        		
	        			
	        				<div class="row mt-4">
	        				
	        				<!-- First column -->
	        				 <div class="col-md-4">
	        				 	<!-- categories -->
							      <div class="list-group text-center">
									  <a href="#" onclick="getPosts(0)"class="list-group-item list-group-item-action primary-background">
									  
								All Posts
									  </a>
									  <!-- Categories -->
									  <%
									  
									  Postdao d = new Postdao(DBconnection.createcon());
									  ArrayList<Categories> list1 = d.getAllCategories();
									  for(Categories cc : list1){
										  
									 
									  
									  %>
									  <a href="#" onclick="getPosts(<%=cc.getCid()%>)" class="list-group-item list-group-item-action"><%= cc.getName() %></a>
									  
									  <%
									  
									  }
									  
									  %>
									        				 
	        				 </div>
	        				 </div>
	        				
	        				<!-- Second column -->
	        				 <div class="col-md-8">
	        				 	<!-- posts -->
	        				          	<div class ="container text-center" id="loader">
	        				          	
	        				          	<i class="fa fa-refresh fa-4x fa-spin"></i>
	        				          	<h3 class="mt-2">Loading.....</h3>

	        				          	
	        				          	</div>
	        				          	<div class="container-fluid" id="post-container"">
	        				          	
	        				          	
	        				          	
	        				          	
	        				          	
	        				          	</div>
	        				 </div>
	        		     </div>


	        		</main>
	        		
	        		
	        		
	        		
	        		
	        	   <!-- Main end body of the page -->	
	        		
	        		
	        		
<!-- Profile modal -->


<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">codeouter</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class= "container text-center">
      
      	<img  src="pic/<%= user.getProfile() %>" class= "img-fluid" style="border-radius:50%; max-width: 200px;"/>
      	<br>
        <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
      
      <br>
      <!-- Details -->
      
      <div id="profile-details">
      <table class="table">

  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%= user.getId() %></td>
  
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%= user.getEmail() %></td>
   
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%= user.getGender() %></td>
     
    </tr>
    
      <tr>
      <th scope="row"> Address:</th>
      <td><%= user.getAddress() %></td>
     
    </tr>
      <tr>
      <th scope="row">City :</th>
      <td><%= user.getCity() %></td>
     
    </tr>
      <tr>
      <th scope="row">State :</th>
      <td><%= user.getState() %></td>
     
    </tr>
      <tr>
      <th scope="row"> Zip :</th>
      <td><%= user.getZip() %></td>
     
    </tr>
      <tr>
      <th scope="row">Registerd on:</th>
      <td><%= user.getDateTime().toString() %></td>
     
    </tr>
  </tbody>
</table>
      </div>
      
      <!-- profile edit -->
      
      <div id ="profile-edit" style="display: none;">
      
      <h3 class="mt-2">Please Edit carefully</h3> 
      
      <form action="EditServlet" method="post" enctype="multipart/form-data">
      
      	<table class="table">
      	
      	
      	<tr>
      		<td>ID : </td>
      		<td> <%= user.getId() %></td>
      	
      	</tr>
      	
      	<tr>
      		<td>Profile: </td>
      		<td> <input type="file" name="pic" class="form-control"></td>
      	
      	</tr>
      	<tr>
      		<td>Name : </td>
      		<td> <input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
      	
      	</tr>
      	<tr>
      		<td>Password : </td>
      		<td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
      	
      	</tr>
      	
      	 <tr>
      		<td>Email : </td>
      		<td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
      	
      	</tr>
      	
      	
      	
      	<tr>
      		<td>Address : </td>
      		<td> <input type="text" class="form-control" name="user_address" value="<%= user.getAddress() %>"></td>
      	
      	</tr>
      	<tr>
      		<td>City : </td>
      		<td> <input type="text" class="form-control" name="user_city" value="<%= user.getCity() %>"></td>
      	
      	</tr>
      	<tr>
      		<td>State : </td>
      		<td> <input type="text" class="form-control" name="user_state" value="<%= user.getState() %>"></td>
      	
      	</tr>
      	<tr>
      		<td>Zip : </td>
      		<td> <input type="text" class="form-control" name="user_zip" value="<%= user.getZip() %>"></td>
      	
      	</tr>
      	</table>
      	
      	<div class="container">
      	
      	<button type="submit" class="btn primary-background">Save</button>
 		
 		</div>
      
      </form>     
      
      </div>
      </div>
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-btn" type="button" class="btn primary-background">Edit</button>
      </div>
    </div>
  </div>
</div>

<!-- end of profile modal -->


<!-- start add post modal -->

<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add_post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form id ="post_frm" action="AddPostServlet" method="post">
       
    
       
       <div class="form-group">
       
       <input type="text" placeholder="Enter post Title" class="form-control" name="pTitle"/>

       </div>
      
         <div class="form-group">
		       <select class="form-control" name="cid">
		       	<option selected disabled>--Select Category--</option>
		       	<% Postdao postd = new Postdao(DBconnection.createcon()); 
		       	
		       	ArrayList<Categories> list = postd.getAllCategories();
		       	for(Categories c : list){
		       		
		       		%>

		       		<option value="<%= c.getCid() %>"><%= c.getName() %></option>
		       			
		       		
		       		<%
		       		
		       	}
		
		       		%>
	
		       		
		       </select>
        </div>
         
       <div class="form-group">
       
       <textarea placeholder="Enter post Content" class="form-control"  name="pContent" style="height:200px;"></textarea>

       </div>
       
                
       <div class="form-group">
       
       <textarea placeholder="Enter post Program" class="form-control"  name="pCode" style="height:200px;"></textarea>

       </div>
       
                
       <div class="form-group">
       
       <label >Select your image</label><br>
		<input type="file"  name="pPic"/>
       </div>
       
       <div class="container text-center">
        <button type="submit" class="btn btn-outline-primary">Post</button>
      </div>
       
       </form>
      </div>
      
    </div>
  </div>
</div>





<!--  end add post modal -->


<!-- Javascript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script  src="JS/script.js" type="text/javascript"></script>

<script >

$(document).ready(function(){
	
	let editStatus = false;
	
	$('#edit-profile-btn').click(function(){
     
		if(editStatus == false){
			

			$("#profile-details").hide();
			
			$("#profile-edit").show();
			
			editStatus = true;
			$(this).text("Back")
		}else
			{


			$("#profile-details").show();
			
			$("#profile-edit").hide();
			
			editStatus = false;
			$(this).text("Edit")

			}
	
	})

});

</script>

<!-- add post js -->
<script>

$(document).ready(function(e){

	$("#post_frm").on("submit",function(event){
     //this code gets called  when form is submiited....
		
     event.preventDefault();
     console.log("you have sucessfully submit");
     
     let form = new FormData(this);
     
     //now requesting to server
     
     $.ajax({
    	 
    	 url: "AddPostServlet",
    	 type: 'POST',
    	 data: form,
	 		success: function(data, textStatus, jqXHR){
			//success...
			console.log(data);
			if(data.trim()=='done'){
    	 swal("Good job!", "save successfully!", "success");
     }else{
    	 
    	 swal("Error !", "Something went wrong try again!", "error");
     }
			
	 		},
			error: function(jqXHR,textStatus, errorThrown){
			//error..
		    	 swal("Error !", "Something went wrong try again!", "error");
			},
			processData: false,
			contentType: false
			 

     })

		})
		
})


</script>

<!-- Loading post  -->

<script>


function getPosts(cid){
	$("#loader").show();
	$("#post-container").hide();
	  $.ajax({
	    	 
	    	 url: "Load_posts.jsp",
	    	 data:{cid:cid},
	         success: function(data, textStatus, jqXHR){
				//success...
				console.log(data);
				$("#loader").hide();
				$('#post-container').show(data);
				$('#post-container').html(data);
	         }

	})	
} 

$(document).ready(function (e){

getPosts(0);
})


</script>

</body>
</html>