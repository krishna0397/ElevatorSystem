<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap-grid.min.css">
	<script src="bootstrap/js/bootstrap.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>

<title>Customer Registration Form</title>
</head>
<body>
<br>
<div class="container table table-responsive">
 <div class="card">
   <div class="card-header wells">
   <br>
	<h2 style="color:brown">Add New Customer <i class="fas fa-plus-circle fa-xs"></i></h2></br>
	
	</div>
 <form:form name="RegForm" method="post" action="customersave" onsubmit="return validation()">
		<table class="table text-justified" align="center">

			<tr>
				<td>Date :</td>
				<td><form:input path="date" value="<%=new java.util.Date().toLocaleString() %>" class="form-control" name="date" id="cdate" required="required"/>
				<span id="ctdate" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Customer_Name :</td>
				<td><form:input path="customer_name" class="form-control" name="name" id="cname" required="required"/>
				<span id="ctname" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><form:input path="customer_email" class="form-control" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" name="email" id="cemail" required="required"/>
				<span id="ctemail" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Address :</td>
				<td><form:input path="customer_address" class="form-control" name="address" id="caddress" required="required"/>
				<span id="ctaddress" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Mobile No:</td>
				<td><form:input path="customer_mobileno" class="form-control" name="mobileno" id="cmobileno" pattern="[7-9][0-9]{9}" onKeyPress= "return validateMobNo(event.key);" required="required"/>
				<span id="ctmobileno" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Username :</td>
				<td><form:input path="username" class="form-control" name="username" id="cusername" required="required"/>
				<span id="ctusername" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><form:input path="password" class="form-control" type="password" name="password" id="cpassword" pattern=".{6,}" title="Should be minimum 6 character" required="required"/>
				<span id="ctpassword" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Confirm Password:</td>
				<td><form:input path="confirmpassword" class="form-control" type="password" name="confirm" id="cconfirm" required="required"/>
				<span id="ctconfirm" class="text-danger"></span>
				</td>
			</tr>

			<tr>
				<td></td>
				<td><input class="btn btn-primary btn-sm" type="submit" value="Save"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger btn-sm" type="reset" value="reset">Reset</button></td>
			</tr>
		</table>
	</form:form>
		
	<script type="text/javascript">
		function validation() {
			
			var password = document.getElementById("cpassword").value;
			var confirm = document.getElementById("cconfirm").value;
			
			if(password!=confirm){
				alert("Password must be same");
				return false;
			}
			
			
			else{
				return true;
			}
		}
		
		
		function validateMobNo(key)
		{
			return (key>='0' && key<='9')
		}

			
	</script>
	</div>
  </div>
</body>
</html>







