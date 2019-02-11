<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.model.Emp" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Employee Form</title>
    
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
	<h2 style="color:brown">Add New Employee <i class="fas fa-plus-circle fa-xs"></i></h2></br>
	</div>
	<form:form name="EmpForm" method="post" action="save" onsubmit="return validation()">
		<table class="table "  align="center">
		
			<tr>
				<td>Date :</td>
				<td><form:input path="date" value="<%=new java.util.Date().toLocaleString() %>" class="form-control" readonly="true" name="date" id="edate" required="required"/>
				<span id="empdate" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Employee Name :</td>
				<td><form:input path="employee_name" class="form-control" name="name" id="ename" required="required"/>
				<span id="empname" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Job title :</td>
				<td><form:input path="job_title" class="form-control" name="job" id="ejob" required="required"/>
				<span id="empjob" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Date of Birth :</td>
				<td><form:input path="date_of_birth" class="form-control" type="date" onchange=" validDOB(this.value)" placeholder="DD/MM/YYYY"  name="dob" id="edob" required="required"/>
				<span id="empdob" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Employee Gender:</td>
				<td><form:radiobutton path="radio" name="gender" value="male" checked="checked" id="egender" />Male  
					&nbsp;&nbsp;&nbsp;<form:radiobutton path="radio" name="gender" value="female" id="egender"/>Female</td>
			</tr>
			
			<tr>
				<td>Employee MobileNo :</td>
				<td><form:input path="employee_mobileno" class="form-control" name="mobileno" id="emobileno" onchange="myFunction(this.value)" pattern="[7-9][0-9]{9}" onKeyPress= "return validateMobNo(event.key);" required="required"/>
				<span id="empmobileno" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Employee EmailId:</td>
				<td><form:input path="employee_emailid" class="form-control" name="email" id="eemail" onchange="myFunction1(this.value)" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required="required"/>
				<span id="empemail" class="text-danger"></span>
				</td>
			</tr>
			
		

			<tr>
				<td></td>
				<td><input class="btn btn-primary btn-sm" type="submit" value="Save" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger btn-sm" type="reset" value="reset">Reset</button></td>
			</tr>
		</table>
	</form:form>
	</div>
	
	<% 
                //com.dao.CustomerDao cdao=new com.dao.CustomerDao();
                //java.util.List<Customer> clist=cdao.getCustomer();
                List<Emp> elist=(List<Emp>)request.getAttribute("emplist");
              	StringBuffer sb=new StringBuffer();
              	for(int i=0;i<elist.size();i++)
              	{
              		if(sb.length()>0)
              		{
              			sb.append(",");
              		}
              		sb.append('"').append(elist.get(i).getEmployee_mobileno()).append('"');
              	}
              	
              	StringBuffer sb1=new StringBuffer();
              	for(int i=0;i<elist.size();i++)
              	{
              		if(sb1.length()>0)
              		{
              			sb1.append(",");
              		}
              		sb1.append('"').append(elist.get(i).getEmployee_emailid()).append('"');
              	}
              %>
	
	
		         <script>
        function myFunction(val) {
       		var emplist=[<%= sb.toString()%>];
       		for(i=0;i<emplist.length;i++)
       			{
      				if(val === emplist[i])
       					{
        					alert("Mobile number is already registerd.Plz provide another no");
        					document.getElementById("emobileno").value="";
        			    }	
       			}
        }
        
        
        
        function myFunction1(val)
        {
        	var emplist=[<%= sb1.toString()%>];
       		for(i=0;i<emplist.length;i++)
       			{
      				if(val === emplist[i])
       					{
        					alert("Email is already registerd.Plz provide another email");
        					document.getElementById("eemail").value="";
        			    }	
       			}
        }
        
        
        </script>
	
	
		<script type="text/javascript">
		
		function validateMobNo(key)
		{
			return (key>='0' && key<='9')
		}
		
		
		function validDOB(val)
		{	
			var date=new Date();  
			
			var date1=new Date(val);
			
			if(date1 > date)
				{
					alert("Please enter valid Date Of Birth");
					documnent.getElementById("edob").value="";

				}
		}
			
	
	</script>
	
	
</body>
</html>