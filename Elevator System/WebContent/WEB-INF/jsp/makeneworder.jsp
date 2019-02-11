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
	<div class="container shadow p-3 mb-5 bg-light rounded table table-responsive">
	<h1 style="color:blueviolet; font-weight:600;" align="center">Product List</h1><br>
	<button>Search <i class="fa fa-search"></i></button> <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
	<br><br>
	<table class="table table-striped table-hover " id="myTable" align="center" border="2" width="70%" padding="5px">
		<tr>
			<th>Product Id</th>
			<th>Product Name</th>
			<th>Product Quantity</th>
			<th>Amount per Quatity</th>
			<th>Order</th>
		</tr>
		
		<c:forEach var="product" items="${list}">
			<tr>
				<td>${product.product_id}</td>
				<td>${product.product_name}</td>
				<td>${product.quantity}</td>
				<td>${product.amount}</td>
				
				<c:choose>
				<c:when test="${product.quantity>0}">
					<td><a class="btn btn-primary btn-sm btn-info" href="${pageContext.request.contextPath}/${product.product_id}">Order  <i class="fa fa-credit-card"></a></td>
				</c:when>
				<c:otherwise>
					<td><a class="btn btn-primary btn-sm btn-danger" href="#">Stock Empty  <i class="fa fa-times-circle"></a></td>
				</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>


</div>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</body>
</html>