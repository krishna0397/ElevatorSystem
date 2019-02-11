<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>

	<link type="text/css" rel="stylesheet" href="resources/css1/sb-admin.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap-grid.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap-reboot.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/fontawesome.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/all.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/regular.min.css"/>
	
	<link type="text/css" rel="stylesheet" href="resources/css2/adminprofile.css"/>
	<link type="text/css" rel="stylesheet" href="resources/js2/adminprofile.js"/>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
    
	
<style>
table,th,td{text-align:center;}
</style>
</head>
<body>
		
		<nav class="navbar navbar-expand navbar-dark static-top" style="background-color:darkorange">

      <a class="navbar-brand mr-3" style="padding-bottom:35px;" href="#">Customer Dashboard</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>     

      <ul class="navbar-nav ml-auto ml-md-0">
      
      <div class="col-md-4">
      	 <li class="nav-item dropdown no-arrow">
            <a href="customerhome"><i style="color: white; "class="fas fa-home fa-lg"></i></a>
            </li>
            </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="orders/${cust.customer_id}"><i style="color: white; "class="fas fa-shopping-cart fa-lg "></i></a>
        </li>
        </div>
        
        <div class="col-md-2">
        	<li align="right"  class="nav-item dropdown no-arrow">
          		<a href="logout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
        	</li>
        </div>
      </ul>
    </nav>
		
		   <div class="card">
               <div class="card-header">
                  <h1>Orders</h1>
               </div>
           <div class="card-body">
             <h5 class="card-title">Ooops.....</h5>
             <p class="card-text"><h2>You have not orderd anything<h2></h2></p>
             <a href="makeorder" class="btn btn-primary">Make Order</a>
          </div>
          </div>
		
		
</body>
</html>