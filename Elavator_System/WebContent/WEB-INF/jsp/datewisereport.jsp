<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.Item"%>
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

  <body id="page-top">

     <nav class="navbar navbar-expand navbar-dark static-top" style="background-color: mediumvioletred;">

      <a class="navbar-brand mr-1" href="index.html" style="padding-bottom:33px">Elevator Admin</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        
        <div class="col-md-4">
      	 <li class="nav-item dropdown no-arrow">
            <a href="${pageContext.request.contextPath}/adminhome"><i style="color: white; "class="fas fa-home fa-lg"></i></a>
            </li>
            </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="${pageContext.request.contextPath}/adminprofile"><i style="color: white; "class="fas fa-user-circle fa-lg "></i></a>
        </li>
        </div>
         
        
          <div class="col-md-3" style="position:relative;">
        <li class="nav-item dropdown no-arrow" >         
          <a href="${pageContext.request.contextPath}/cart"><i  style="color: white;" class="fas fa-cart-plus fa-lg" ></i> </a>
          </li>
           <span class="badge btn btn-warning"style="position:absolute;right:10px;top:0px;border-radius:10px;color:white;">
           <%List<Item> cart = (List<Item>) session.getAttribute("cart"); out.print(cart.size());%></span>
          </div>
          
        <div class="col-md-4">
        <li align="right"  class="nav-item dropdown no-arrow">
          <a href="${pageContext.request.contextPath}/adminlogout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
          </li>
          </div>
          
        
        </ul>
      </nav>
	<br>
    
	<div class="container shadow-sm p-3 mb-5 bg-light rounded table table-responsive" style="position:relative;">
	<h1 style="color:blueviolet;font-weight:600;" align="center">Profit Or Loss Report</h1><br>
	<br>
	<form action="${pageContext.request.contextPath}/search">
	<pre>
	<label>From</label>:  <input type="date" name="date1"/>     <label>To:  </label><input type=date name="date2"/> 	<button class="btn btn-warning btn-sm"type="submit">Search <i class='fa fa-search'></i> </button>
	</pre>
	</form>
	<br>
	<table class="table table-striped table-hover" align="center" border="2" width="70%" padding="5px">
		<tr>
			<th>Order Id</th>
			<th>Product Id</th>
			<th>Product Name</th>
			<th>Cost Price</th>
			<th>Selling Price</th>
			<th>Profit OR Loss</th>
			
			
		</tr>
		<c:set var="total" value="0"></c:set>
		<c:forEach var="order" items="${list}">
			<tr>
				<td>${order.order_id}</td>
				<td>${order.product_id}</td>
				<td>${order.product_name}</td>
				<td>${order.totalcostprice}</td>
				<td>${order.totalsellingprice}</td>
				<td>${order.profit}</td>
				
				<c:set var="total" value="${total+order.profit}"></c:set>
				
				
				
				
				
				
				
<%-- 				<c:choose> --%>
<%-- 				<c:when test="${product.status == 'Not Approved'}"> --%>
<%-- 				<td><a style="color:white;" class="btn btn-danger btn-sm btn-text-white">${product.status} <i class="fa fa-toggle-on"></i></a></td> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 				<td><a style="color:white;" class="btn btn-success btn-sm ">${product.status} <i class="fa fa-toggle-on"></i></a></td> --%>
<%-- 				</c:otherwise> --%>
<%-- 			    </c:choose> --%>
<%--                <td><a href="approved/${product.order_id}" class="btn btn-info btn-sm">Approve<i class="fa fa-check"></i></a></td> --%>
           
				
			</tr>
		</c:forEach>
		<div class="panel col-md-3" style="background-color:aliceblue; color:darkgreen;position:absolute;top:5px;left:10px;height:11%">
		<div >
		<h4><strong>Total Profit</strong></h4>
		
		<h3>Rs. ${total} </h3>
		</div>
		</div>
	</table>
</div>
</body>
</html>