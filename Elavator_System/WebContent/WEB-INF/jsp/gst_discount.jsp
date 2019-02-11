<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.Item"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

  <head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Dashboard</title>
    
    <link type="text/css" rel="stylesheet" href="resources/css1/sb-admin.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap-grid.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap-reboot.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/fontawesome.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/all.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/regular.min.css"/>
	
    
    
    <style>
    .head{font-size:40px;}
    </style>


  </head>

  <body id="page-top">

	<nav class="navbar navbar-expand navbar-dark static-top" style="background-color: mediumvioletred">

      <a class="navbar-brand mr-1" href="index.html">Elevator Admin</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        
        <div class="col-md-4">
      	 <li class="nav-item dropdown no-arrow">
            <a href="adminhome"><i style="color: white; "class="fas fa-home fa-lg"></i></a>
            </li>
            </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="adminprofile"><i style="color: white; "class="fas fa-user-circle fa-lg "></i></a>
        </li>
        </div>
        
        
        <div class="col-md-2">
        <li align="right"  class="nav-item dropdown no-arrow">
          <a href="adminlogout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
          </li>
          </div>
        </ul>
      </nav>
	

	<br>
	<div class="row" style="padding:20px;">
		<div class="col-md-6 container shadow p-3 mb-5 bg-light rounded table table-responsive">
		<h3>Current GST & DISCOUNT</h3>
			<table class="table table-striped table-hover text-center" align="center" border="2" width="70%" >
			
		<tr>
			<th>GST</th>
			<th>DISCOUNT</th>
			
		</tr>
		
		<c:forEach var="gstdiscount" items="${list}">
			<tr>
				<td>${gstdiscount.gst}%</td>
				<td>${gstdiscount.discount}%</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
	
     <div class="col-md-5 container shadow p-3 mb-5 bg-light rounded table table-responsive">
	<form:form name="gstdiscount" method="post" action="gstdiscountsave">

	  
	
		Enter GST : <form:input path="gst" class="form-control" name="gst" id="gst" pattern= "[0-9]{2}" required="required"/><br>
		Enter DISCOUNT : <form:input path="discount" class="form-control" name="discount" id="discount" pattern= "[0-9]{2}" required="required"/><br>
		
		<input class="btn btn-primary btn-sm"  type="submit" value="Update GST & DISCOUNT" />
			</form:form>	
	
		</div>
	</div>

	
	 <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>
	
</body>
</html>