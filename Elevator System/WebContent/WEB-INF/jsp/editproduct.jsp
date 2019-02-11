<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Edit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>


</head>
<body>
<br>
	<div class="container shadow p-3 mb-5 bg-light rounded table table-responsive">
	<div class="card">
   <div class="card-header wells">
   <br>
   <h2 style="color:brown">Edit Products Details <i class='far fa-edit'></i></h2><br>
	</div>
	
	<form:form name="EditProduct" method="POST" action="/Elavator_System/productupdate" onsubmit="return validation()">
		<table class="table" align="center">
			<form:hidden path="product_id" name="id" id="id"/>
			
			<tr>
				<td>Date :</td>
				<td><form:input path="date" value="<%=new java.util.Date().toLocaleString() %>" class="form-control" name="date" id="pdate" readonly="true" required="required"/>
				<span id="proddate" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Product Type :</td>
				<td><form:input path="product_type" class="form-control" name="type" id="ptype" required="required"/>
					
				<span id="producttype" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Product_name :</td>
				<td><form:input path="product_name" class="form-control" name="name" id="pname" required="required"/>
				<span id="productname" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Product Quantity:</td>
				<td><form:input path="quantity" class="form-control" name="qty" id="pqty" required="required"/>
				<span id="productqty" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Cost Price of a Quantity:</td>
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
				<td><input class="btn btn-primary btn-sm btn-success" type="submit" value="Edit Save" /></td>
			</tr>
		</table>
	</form:form>
	</div>

	
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