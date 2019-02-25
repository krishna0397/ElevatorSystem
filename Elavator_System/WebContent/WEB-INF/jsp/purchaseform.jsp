<%@page import="com.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="com.model.Customer" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Payment CheckOut</title>
        <link href="resources/paymentcss/paymentcss.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-k2/8zcNbxVIh5mnQ52A0r3a6jAgMGxFJFE2707UxGCk= sha512-ZV9KawG2Legkwp3nAlxLIVFudTauWuBpC10uEafMHYL0Sarrz5A7G79kXh5+5+woxQ5HM559XX2UZjMJ36Wplg==" crossorigin="anonymous">
  		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  		
  		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src='https://js.stripe.com/v2/' type='text/javascript'></script>
		<style>
			#payoption{
				font-style:italic;
				font-weight:bold;	
			}	
			
			#btnsubmit:hover #msg{
			display: block;
			
			}
		</style>
    </head>
    
    
    <body style="font-family: 'Open Sans', sans-serif;">
    
        <div class="container">
        <div class="row">
        <div class="col-md-6">
        	<div class="centered title"><h1>Welcome to our checkout.</h1></div>
    	    </div>
    
    	<div class="col-md-6" style="padding:0;margin:0;width:100px;height:40px">
 
        	<img class="centered" src="resources/images/paymentmethod.jpg" height="100px" width="400px"/>
    	    </div>
    	   </div>
    	</div>

  <form:form action="paymentoption" method="post" name="purchase" onsubmit="return validate()">
   <hr class="featurette-divider"></hr>
     <div class="container" >
       <div class="row">
        <div class="col-sm-6 col-sm-offset-3" style="border:2px solid red;">
         <div class="tab-content">
  		   <div id="stripe" class="tab-pane fade in active">					 
            <br>
          <div class='form-row'>
              <div class='form-group required'>
               <div class='error form-group hide'>
                <div class='alert-danger alert'>
                  Please correct the errors and try again.
              </div>
            </div>
            </div>
            </div>
            
             <div class='form-row'>
              <div class='form-group required'>
                <label class='control-label'>Order Id</label>
                <form:input  path="product_id" value="${count+1}" class="form-control" readonly="true" required="required"/>
                </div>
            </div>
            
            <div class='form-row'>
              <div class='form-group card required'>
                  <label class='control-label'>Customer Name</label>
                <form:input path="customer_name" autocomplete='off' class='form-control' size='20' type='text' pattern="^[A-Za-z ]+$" id="cname" placeholder="Name" required="required"/>
                <span id="custname" class="text-danger"></span>
              </div>
            </div>
            
             <div class='form-row'>
              <div class='form-group card required'>
                <label class='control-label'>Email</label>
                <form:input path="customer_email" autocomplete='off' class='form-control' size='20' type='text' id="email" onchange="myFunction1(this.value)" placeholder="Email" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required="required"/>
                <span id="cemail" class="text-danger"></span>
              </div>
            </div>
            
            <div class='form-row'>
              <div class='form-group cvc required'>
                <label class='control-label'>Address</label>
                <form:textarea path="customer_address" autocomplete='off' class='form-control' placeholder='Address' size='4' type='text' id="address" required="required"/>
                <span id="caddress" class="text-danger"></span>
              </div>
              </div>
              
              <div class='form-row'>
              <div class='form-group expiration required'>
              
            
                <label class='control-label'>Mobile Number</label>
                <form:input path="customer_mobileno" class='form-control' placeholder='Mobile No' size='2' type='text' id="mob" onchange="myFunction(this.value)" onKeyPress= "return validateMobNo(event.key);" pattern="[7-9][0-9]{9}" required="required"/>
                <span id="mobno" class="text-danger"></span>
              </div>
              </div>
                
                	<a href="cancelorder"class='btn btn-danger' onclick="return cancelOrder()">Cancel Order</a> 
                    <button id="btnsubmit" class='pull-right btn btn-primary' type='submit' onmouseover="document.getElementById('msg').style.display='block';" onmouseout="document.getElementById('msg').style.display= 'none';" style="position:relative;"> Proceed To Payment</button> <span  class='alert-danger alert' id="msg" style="border:2px solid black;position:absolute;bottom:40px;right:0px;height:80px;width:250px;display:none;">Are you sure to contiue? You cannot cancel the order once you proceed for payment</span>
  
                     <br>
                     <br>
              </div>
            </div>    
           </div>
		</div>
		</div>

               
  </form:form>
    <% 
                //com.dao.CustomerDao cdao=new com.dao.CustomerDao();
                //java.util.List<Customer> clist=cdao.getCustomer();
                List<Customer> clist=(List<Customer>)request.getAttribute("custlist");
              	StringBuffer sb=new StringBuffer();
              	for(int i=0;i<clist.size();i++)
              	{
              		if(sb.length()>0)
              		{
              			sb.append(",");
              		}
              		sb.append('"').append(clist.get(i).getCustomer_mobileno()).append('"');
              	}
              	
              	StringBuffer sb1=new StringBuffer();
              	for(int i=0;i<clist.size();i++)
              	{
              		if(sb1.length()>0)
              		{
              			sb1.append(",");
              		}
              		sb1.append('"').append(clist.get(i).getCustomer_email()).append('"');
              	}
              %>
        <script src="resources/paymentjs/paymentjs.js"></script>
        
        <script type="text/javascript">
        function validate()
        {
        	
        }
        
        
        function validateMobNo(key)
		{
			return (key>='0' && key<='9')
		}
        
        function continueForPayment()
        {
        	var result=confirm("Are you sure to contiue? You cannot cancel the order once you click OK");
        	if(result==true)
        		{
        		return true;
        		}
        }

        
        function cancelOrder()
        {
        	confirm("Are You sure to cancel the order?");
        }
        </script>
         <script>
        function myFunction(val) {
       		var custlist=[<%= sb.toString()%>];
       		for(i=0;i<custlist.length;i++)
       			{
      				if(val === custlist[i])
       					{
        					alert("Mobile number is already registerd.Plz provide another no");
        					document.getElementById("mob").value="";
        			    }	
       			}
        }
        
        
        
        function myFunction1(val)
        {
        	var custlist=[<%= sb1.toString()%>];
       		for(i=0;i<custlist.length;i++)
       			{
      				if(val === custlist[i])
       					{
        					alert("Email is already registerd.Plz provide another email");
        					document.getElementById("email").value="";
        			    }	
       			}
        }
        
        </script>
        
        
        <script src="jquery-3.3.1.min.js"></script>
    </body>
</html>