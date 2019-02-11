<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

   <hr class="featurette-divider"></hr>
     <div class="container" >
       <div class="row">
        <div class="col-sm-6 col-sm-offset-3" style="padding:40px;">
           <div class="list-group">
          <a href="#" class="list-group-item list-group-item-action active">
                  Select your payment method
                </a>
                 <a href="credit" class="list-group-item list-group-item-action">Payment by Cerdit Card <i class="fa fa-credit-card"></i></a>
                 <a href="debit" class="list-group-item list-group-item-action">Payment by Debit Card <i class="fa fa-credit-card"></i></i></a>
                 <a href="cheque" class="list-group-item list-group-item-action">Payment by Cheque <i class="fa fa-money"></i></a>
             </div>
                          
              </div>
            </div>    
           </div>
	

               
   
  
        <script src="resources/paymentjs/paymentjs.js"></script>
        
        <script type="text/javascript">

        </script>
        
        
        <script src="jquery-3.3.1.min.js"></script>
    </body>
</html>