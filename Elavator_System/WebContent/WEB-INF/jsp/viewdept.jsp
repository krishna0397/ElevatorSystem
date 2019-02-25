<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.Item"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	  
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>

<style>
table,th,td{text-align:center;}
</style>
	

</head>

  <body>

    <nav class="navbar navbar-expand navbar-dark static-top" style="background-color: mediumvioletred;">

      <a class="navbar-brand mr-1" href="#">Elevator Admin</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        
        <div class="col-md-4">
      	 <li class="nav-item dropdown no-arrow">
            <a href="${pageContext.request.contextPath}/adminhome" data-toggle="tooltip" title="Home"><i style="color: white; "class="fas fa-home fa-lg"></i></a>
            </li>
            </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="${pageContext.request.contextPath}/adminprofile" data-toggle="tooltip" title="Profile"><i style="color: white; "class="fas fa-user-circle fa-lg "></i></a>
        </li>
        </div>
        
        
          <div class="col-md-3" style="position:relative;">
        <li class="nav-item dropdown no-arrow" >         
          <a href="${pageContext.request.contextPath}/cart" data-toggle="tooltip" title="Cart"><i  style="color: white;" class="fas fa-cart-plus fa-lg" ></i>
          </li>
           <span class="badge btn btn-warning"style="position:absolute;right:10px;top:0px;border-radius:10px;color:white;">
           <%List<Item> cart = (List<Item>) session.getAttribute("cart"); out.print(cart.size());%></span>
          </div>
          </a>
          
        <div class="col-md-4">
        <li align="right"  class="nav-item dropdown no-arrow">
          <a href="${pageContext.request.contextPath}/adminlogout" data-toggle="tooltip" title="Logout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
          </li>
          </div>
          
        
        </ul>
      </nav>
	<br>

<div class="container shadow p-3 mb-5 bg-light rounded table table-responsive">
<h1 align="center" style="color:blueviolet">Department List</h1><br>
<button>Search <i class="fa fa-search"></i></button> <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
	<br><br>
	<table class="table table-striped table-hover" id="myTable" align="center" border="2" width="70%" cellpadding="2">
		<tr>
			<th>Sr.No.</th>
			<th>Id</th>
			<th>Date</th>
			<th>Name</th>
			<th>Dept_head</th>
			<th>No_of_employee</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		
		<% int i=1; %>
		<c:forEach var="dept" items="${list}">
			<tr>
				<td><%= i %><% i++; %></td>
				<td>${dept.dept_id}</td>
				<td>${dept.date}</td>
				<td>${dept.dept_name}</td>
				<td>${dept.dept_head}</td>
				<td>${dept.no_of_employee}</td>

				<td><a class="btn btn-primary btn-sm btn-info" href="editdept/${dept.dept_id}">Edit <i class='far fa-edit'></i></a></td>
				<td><a class="btn btn-primary btn-sm btn-danger" href="deletedept/${dept.dept_id}">Delete <i class='far fa-trash-alt'></i></a></td>
			</tr>
		</c:forEach>
	</table>
	<br />

	<a class="btn btn-primary btn-sm" href="deptform">Add New Department</a>
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
		    td1 = tr[i].getElementsByTagName("td")[3];

		    if (td || td1) {
		      txtValue = td.textContent || td.innerText;
		      txtValue1 = td1.textContent || td1.innerText;
		      if (txtValue.toUpperCase().indexOf(filter) > -1 || txtValue1.toUpperCase().indexOf(filter) > -1 ) {
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