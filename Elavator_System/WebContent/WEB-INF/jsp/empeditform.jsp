<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.model.Emp" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Employee edit form</title>
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
   <h2 style="color:brown">Edit Employee <i class='far fa-edit'></i></h2><br>
	</div>
	
	<form:form name="EditForm" method="POST" action="/Elavator_System/empupdate" onsubmit="return validation()">
		<table align="center" class="table">
		<form:hidden path="employee_id" id="id" />
		
			<tr>
				<td>Date :</td>
				<td><form:input path="date" value="<%=new java.util.Date().toLocaleString() %>" class="form-control" readonly="true" name="date" id="edate" required="required"/>
				<span id="empdate" class="text-danger"></span>
				</td>
			</tr>
			
			<tr>
				<td>Employee Name :</td>
				<td><form:input path="employee_name" id="ename" class="form-control" pattern="^[A-Za-z ]+$" required="required" />
				<span id="empname" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Job Title:</td>
				<td><form:input path="job_title" id="ejob" class="form-control" required="required"/>
				<span id="empjob" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>DOB:</td>
				<td><form:input path="date_of_birth" class="form-control" onchange=" validDOB(this.value)" type="date" id="edob" required="required"/>
				<span id="empdob" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Employee Gender:</td>
				<td><form:radiobutton path="radio" name="gender" value="male"
						checked="checked" id="egender" />Male&nbsp;&nbsp;&nbsp;&nbsp;<form:radiobutton path="radio" name="gender" value="female" id="egender"/>Female</td>
				
			</tr>
			<tr>
				<td>Employee Mobileno:</td>
				<td><form:input path="employee_mobileno" class="form-control" id="emobileno" onchange="myFunction(this.value)" pattern="[7-9][0-9]{9}" onKeyPress= "return validateMobNo(event.key);" required="required"/>
				<span id="empmobileno" class="text-danger"></span>
				</td>
			</tr>
			<tr>
				<td>Employee Emailid:</td>
				<td><form:input path="employee_emailid" id="eemail" class="form-control" onchange="myFunction1(this.value)" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required="required"/>
				<span id="empemail" class="text-danger"></span>
				</td>
			</tr>
			

			<tr>
				<td></td>
				<td><input class="btn btn-primary btn-sm btn-success" type="submit" value="Save" /></td>
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
	</div>
</body>
</html>