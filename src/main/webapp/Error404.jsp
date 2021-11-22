<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sorry something went wrong ...</title>
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

<div class="container text-center">

<img class="img-fluid" src="images/error.png"/>
<%= exception %>
<h4 class="display-3">Sorry !!! Something went wrong.....</h4>
<a href=index.jsp class="btn primary-background btn-lg text-white"> Home </a>


</div>

</body>
</html>