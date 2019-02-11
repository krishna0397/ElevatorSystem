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
<div class="container shadow p-3 mb-5 bg-light rounded table table-responsive">
<h1 style="color:cyan" align="center">Edit Admin Details</h1>  
       <form:form name="EditForm" method="POST" action="/Elavator_System/customerupdate" onsubmit="return validation()">    
        <table class="table table-striped table-hover" align="center" border="2">    
         
         <tr>    
          <td>Department: </td>   
          <td><form:hidden path="customer_id"  name="id" id="cid"/>
          <span id="ctname"></span>
          </td>  
         </tr>
         <tr>    
          <td>Customer_name : </td>   
          <td><form:input path="customer_name"  name="name" id="cname"/>
          <span id="ctname"></span>
          </td>  
         </tr>    
         <tr>    
          <td>Email:</td>    
          <td><form:input path="customer_email" name="email" id="cemail" />
          <span id="ctemail"></span>
          </td>  
         </tr> 
         <tr>    
          <td>Address:</td>    
          <td><form:input path="customer_address" name="address" id="caddress" />
          <span id="ctaddress"></span>
          </td>  
         </tr>   
         <tr>    
          <td>Mobile No:</td>    
          <td><form:input path="customer_mobileno" name="mobileno" id="cmobileno" />
          <span id="ctmobileno"></span>
          </td>  
         </tr> 
         <tr>  
         <td>Username :</td>
		<td><form:input path="username" name="username" id="cusername"/>
		<span id="ctusername"></span>
		</td> 
		</tr>  
         <tr>    
          <td>Password:</td>    
          <td><form:input path="password" type="password" name="password" id="cpassword" />
          <span id="ctpassword"></span>
          </td>  
         </tr>
         <tr>    
          <td>Confirm Password:</td>    
          <td><form:input path="confirmpassword" type="password" name="confirm" id="cconfirm" />
          <span id="ctconfirm"></span>
          </td>  
         </tr>   
           
         <tr>    
          <td> </td>    
          <td><input class="btn btn-primary btn-sm btn-success" type="submit" value="Edit Save" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary btn-sm" type="reset" value="reset">Reset</button></td>    
         </tr>    
        </table>    
       </form:form>    


	<script type="text/javascript">
		function validation() {
 			var name = document.getElementById("cname").value;
			var email = document.getElementById("cemail").value;
 			var address = document.getElementById("caddress").value;
 			var mobileno = document.getElementById("cmobileno").value;
 			var username = document.getElementById("cusername").value;
 			var password = document.getElementById("cpassword").value;
 			var confirm = document.getElementById("cconfirm").value;
			
			
			if (name=="") {
					document.getElementById("ctname").innerHTML="Please enter your name";
					return false;
					
			}
			
			
			
			if (email=="") {
				document.getElementById("ctemail").innerHTML="Please enter your email";
 				return false;
 			}
			if (false==validateemail(email)) {
				document.getElementById("ctemail").innerHTML="Please enter valid email";
 				return false;
				}
			
			
			
			 if (address=="") {
				document.getElementById("ctaddress").innerHTML="Please enter your address";
 				return false;
 			}
			
			
			
			if (mobileno=="") {
				document.getElementById("ctmobileno").innerHTML="Please enter mobile number";
 				return false;
 			}
			
			if (false==phonenumber(mobileno)) {
				document.getElementById("ctmobileno").innerHTML="Please enter valid mobile number";
 				return false;
			}
			
			if(isNaN(mobileno))
			{
				document.getElementById("ctmobileno").innerHTML="Mobile Number should be in only number format";
				return false;
			}

 				
 				
			
			if (username=="") {
				document.getElementById("ctusername").innerHTML="Please enter username";
 				return false;
 			}
			
			
			
			
			if (password=="") {
				document.getElementById("ctpassword").innerHTML="Please enter password";
 				return false;
 			}
			if (password.length<6) {
				document.getElementById("ctpassword").innerHTML="Password should be at least 6 character";
 				return false;
 			}
			
			
			
			
			if (confirm=="") {
				document.getElementById("ctconfirm").innerHTML="Please Re-enter password";
 				return false;
 			}
			
			
			
			if(password!=confirm){
				document.getElementById("ctconfirm").innerHTML="Password must be same";
				return false;
			}
			
			
			
			else{
				return true;
			}
		}
		
		
		
		function phonenumber(inputtext)
		{
			var phoneno = /^\d{10}$/;
			if(inputtext.match(phoneno))
			{
				return true;
			}
			else
	        {
			    return false;
            }
			
		}
			
		
		
		 function validateemail(cemail)
	     {
	    	 var pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	    	 if(pattern.test(cemail))
	    		{
	    		   return true;
	    		}
	    	 else
	    		 {
	    		    return false;
	    		 }
	     }
			
		
		
	</script>


</div>
</body>
</html>