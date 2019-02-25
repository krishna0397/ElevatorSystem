<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
   <h2 style="color:brown">Edit Department Details <i class='far fa-edit'></i></h2><br>
	</div>
	
	<form:form name="EditDept" method="POST" action="/Elavator_System/deptupdate" onsubmit="return validation()">
		<table class="table" align="center">
			
			<form:hidden path="dept_id" name="id" id="id"/>
			
			<tr>
				<td>Date :</td>
				<td><form:input path="date" value="<%=new java.util.Date().toLocaleString() %>" class="form-control" name="date" id="ddate" readonly="true" required="required"/>
				<span id="deptdate" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Dept_name :</td>
				<td><form:input path="dept_name" name="name" class="form-control" id="dname" required="required"/>
				<span id="deptname" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Head of Dept :</td>
				<td><form:input path="dept_head" name="head" id="dhead" class="form-control" required="required"/>
				<span id="depthead" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>No_of_employee:</td>
				<td><form:input path="no_of_employee" name="emp" class="form-control" id="demp" required="required"/>
				<span id="deptemp" class="text-danger"></span>
				</td>
			</tr>

			<tr>
				<td></td>
				<td><input class="btn btn-primary btn-sm btn-success" type="submit" value="Save" /></td>
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
					document.getElementById("deptname").innerHTML="Please enter name of Department";
					return false;
			}
			
			if (head=="") {
				document.getElementById("depthead").innerHTML="Please enter Head of Department";
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