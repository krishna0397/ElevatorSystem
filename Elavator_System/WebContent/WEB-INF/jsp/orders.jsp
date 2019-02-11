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
        
        <div class="col-md-2">
        <li class="nav-item dropdown no-arrow">
           
        </li>
        </div>
        
        <div class="col-md-2">
        	<li align="right"  class="nav-item dropdown no-arrow">
          		<a href="logout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
        	</li>
        </div>
      </ul>
    </nav>
		

	<div class="container shadow p-3 mb-5 bg-light rounded table table-responsive">
	<h1 style="color:blueviolet; font-weight:600;" align="center">Ordered List</h1><br>
	<table class="table table-striped table-hover" align="center" border="2" width="70%" padding="5px">
		<tr>
			<th>Order Id</th>
			<th>Customer Id</th>
			<th>Product Id</th>
			<th>Order Date</th>
			<th>Mobile No</th>
			<th>Status</th>
		</tr>
		
		<c:forEach var="product" items="${list}">
			<tr>
				<td>${product.order_id}</td>
				<td>${product.customer_id}</td>
				<td>${product.product_id}</td>
				<td>${product.order_date}</td>
				<td>${product.mobileno}</td>
				<td>${product.status}</td>

			</tr>
		</c:forEach>
	</table>
<br>
	<h4><a href="makeorder" class="btn btn-primary">Make New Orders</a></h4>

</div>
</body>
</html>