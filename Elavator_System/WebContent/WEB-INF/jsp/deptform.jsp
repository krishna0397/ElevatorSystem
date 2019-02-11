<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Department Form</title>
    
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



</head>

  <body>

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
<div class="container table table-responsive">
<div class="card">
   <div class="card-header wells">
   <br>
	<h2 style="color:brown">Add New Departmet <i class="fas fa-plus-circle fa-xs"></i></h2></br>
	
	</div>
	<form:form name="DeptForm" method="post" action="deptsave" onsubmit="return validation()">
		<table class="table" align="center">

			<tr>
				<td>Date :</td>
				<td><form:input path="date" value="<%=new java.util.Date().toLocaleString() %>" class="form-control" name="date" id="ddate" readonly="true" required="required"/>
				<span id="deptdate" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Dept Name :</td>
				<td><form:input path="dept_name" class="form-control" name="name" id="dname" required="required"/>
				<span id="deptname" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Head of Dept :</td>
				<td><form:input path="dept_head" class="form-control" name="head" id="dhead" required="required"/>
				<span id="depthead" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>No Of Employee:</td>
				<td><form:input path="no_of_employee" class="form-control" name="emp"  id="demp" required="required"/>
				<span id="deptemp" class="text-danger"></span>
				</td>
			</tr>


			<tr>
				<td></td>
				<td><input class="btn btn-primary btn-sm" type="submit" value="Save" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger btn-sm" type="reset" value="reset">Reset</button></td>
			</tr>
		</table>
	</form:form>
	</div>
	
	<script type="text/javascript">
		function validation()
		{
			var name=document.getElementById("dname").value;
			var head=document.getElementById("dhead").value;
			var emp=document.getElementById("demp").value;
			
						
			if (name=="") {
					document.getElementById("deptname").innerHTML="Please enter name of Dpartment";
					return false;
			}
			
			if (head=="") {
				document.getElementById("depthead").innerHTML="Please enter Head of Dpartment";
				return false;
		}
			
			
			if (emp=="") {
				document.getElementById("deptemp").innerHTML="Please enter number of employees";
				return false;
			}
			
			if (emp<=0) {
				document.getElementById("deptemp").innerHTML="Please enter valid number";
				return false;
			}
			if(isNaN(emp))
				{
				document.getElementById("deptemp").innerHTML="It should be in only number format";
				return false;
				}
			
			else
				{
				return true;
				}
		}
	
	</script>
	</div>
</body>
</html>