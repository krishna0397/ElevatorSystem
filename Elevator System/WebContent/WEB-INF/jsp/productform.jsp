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

    <title>Product Form</title>
    
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
	<h2 style="color:brown">Add New Product <i class="fas fa-plus-circle fa-xs"></i></h2></br>
	
	</div>
	<form:form name="ProductForm" method="post" action="productsave" onsubmit="return validation()">
		<table class="table"  align="center">
		
			<tr>
				<td>Date :</td>
				<td><form:input path="date" value="<%=new java.util.Date().toLocaleString() %>" class="form-control" readonly="true" name="date" id="pdate" required="required"/>
				<span id="proddate" class="text-danger"></span>
				</td>
			</tr>

			<tr>
				<td>Product Type :</td>
				<td><form:select path="product_type" class="form-control" name="type" id="ptype" required="required">
					<option>---Select Elevator---</option>
					<option>Hydraulic Elevator</option>
					<option>Resedential Elevator</option>
					<option>Passenger Elevator</option>
					<option>Climbing Elevator</option>
					<option>Freight Elevator</option>
					<option>Escalator</option>
					<option>Hospital Bed Elevator</option>
					<option>Observation Elevator</option>
					<option>Dumbwaiter Lift</option>
					<option>Pneumatic Elevator</option>
				</form:select>
				<span id="producttype" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Product Name :</td>
				<td><form:input path="product_name" class="form-control" name="name" id="pname" required="required"/>
				<span id="productname" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Product Quantity :</td>
				<td><form:input path="quantity" class="form-control" name="oty" id="pqty" required="required"/>
				<span id="productqty" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Cost Price of a Product:</td>
				<td><form:input path="costprice" class="form-control" name="amount" id="costamt" required="required"/>
				<span id="costamount" class="text-danger"></span>
				</td>
			</tr>
			
				<tr>
				<td>Selling Amount Per Quantity:</td>
				<td><form:input path="amount" class="form-control" name="amount" id="pamount" required="required"/>
				<span id="productamount" class="text-danger"></span>
				</td>
			</tr>

			<tr>
				<td></td>
				<td><input class="btn btn-primary btn-sm"  type="submit" value="Save" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger btn-sm" type="reset" value="reset">Reset</button></td>
			</tr>
		</table>
	</form:form>
	
	  
	  <script type="text/javascript">
	  	function validation()
	  	{
	  		var type=document.getElementById("ptype").value;
	  		var name = document.getElementById("pname").value;
	  		var quantity = document.getElementById("pqty").value;
	  		var costprice=document.getElementById("costamt").value;
	  		var amount = document.getElementById("pamount").value;
	  		
	  		if ((type=="---Select Elevator---") || (type=="")) {
				document.getElementById("producttype").innerHTML="Please select the Product";
				return false;
		    }
	  			  		
	  		if (name=="") {
				document.getElementById("productname").innerHTML="Please enter name of Product";
				return false;
		    }
	  		
	  		if(quantity==""){
	  			document.getElementById("productqty").innerHTML="Please enter the quantity of product";
	  			return false;
	  		}
	  		if(isNaN(quantity)){
	  			document.getElementById("productqty").innerHTML="qauntity should be only in number format";
	  			return false;
	  		}
	  		if(quantity<=0){
	  			document.getElementById("productqty").innerHTML="Quantity should not be nigative number";
	  			return false;
	  		}
	  		
	  		
	  		if(costprice<=0){
	  			document.getElementById("costamount").innerHTML="Amount should not be nigative number";
	  			return false;
	  		}
	  		
	  		if(costprice==""){
	  			document.getElementById("costamount").innerHTML="Please enter the Cost proce of product";
	  			return false;
	  		}
	  		if(isNaN(costprice)){
	  			document.getElementById("costamount").innerHTML="Amount should be only in number format";
	  			return false;
	  		}
	  		
	  		if(amount<=0){
	  			document.getElementById("productamount").innerHTML="Amount should not be nigative number";
	  			return false;
	  		}
	  		
	  		if(amount==""){
	  			document.getElementById("productamount").innerHTML="Please enter the amount of product";
	  			return false;
	  		}
	  		if(isNaN(amount)){
	  			document.getElementById("productamount").innerHTML="Amount should be only in number format";
	  			return false;
	  		}
	  		
	  		

	  		else{
	  			return true;
	  		}
		
	  	}
	  
	  
	  </script>
	  
	</div>
</body>
</html>			
			
			
			
			
			
			
		


