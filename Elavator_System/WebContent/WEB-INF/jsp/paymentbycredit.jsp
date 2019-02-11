<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>Credit Card Payment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <link href="resources/paymentcss/paymentcss.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-k2/8zcNbxVIh5mnQ52A0r3a6jAgMGxFJFE2707UxGCk= sha512-ZV9KawG2Legkwp3nAlxLIVFudTauWuBpC10uEafMHYL0Sarrz5A7G79kXh5+5+woxQ5HM559XX2UZjMJ36Wplg==" crossorigin="anonymous">
  		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  		
  		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src='https://js.stripe.com/v2/' type='text/javascript'></script>
		
		<style>
    .cc-img {
        margin: 0 auto;
    }
</style>
</head>
<body>

<div class="container">

<div class="page-header">
    <h1>Payment By Credit Card</h1>
</div>

<!-- Credit Card Payment Form - START -->
<form:form method="get" action="creditpayment">
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h3 class="text-center">Payment Details</h3>
                        <div class="col-md-6" style="padding:0;margin:0;width:100px;height:40px">
				        	<img class="centered" src="resources/images/paymentmethod.jpg" height="100px" width=290px"/>
    	    			</div>
                        
                    </div>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                     <label>CARD NUMBER</label>
                                    <div class="input-group">
                                        <form:input path="creditcardno" type="tel" class="form-control" minlength='16' maxlength='16' pattern="[0-9]{16}" onKeyPress= "return validateMobNo(event.key);" placeholder="Valid Card Number" required="required"/>
                                        <span class="input-group-addon"><span class="fa fa-credit-card"></span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label><span class="hidden-xs">EXPIRATION DATE</span></label>
                                    <form:input path="expdate" type="text" maxlength='7' class="form-control" placeholder="MM / YY" pattern="(?:0[1-9]|1[0-2])/[0-9]{2}" required="required"/>
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label>CV CODE</label>
                                    <form:input path="creditcvv" type="password" minlength='3' maxlength='3' pattern="[0-9]{3}" class="form-control" placeholder="CVC" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>CARD OWNER</label>
                                    <form:input path="creditname" type="text" class="form-control" placeholder="Card Owner Names" required="required"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <button class="btn btn-warning btn-lg btn-block">Process payment</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</form:form>

</div>
		<script type="text/javascript">
		
		function validate()
        {

        	var expyear=document.getElementById("year").value;
        	
        	var date=new Date();
        	var year=date.getFullYear();
        	
 
        	if(expyear < year)
        		{
        		//document.getElementById("expyear").innerHTML="Please Enter Valid Expiry Year";
        		alert("Please enter valid expiry date");
        		return false;
        		}
        	
        	else
        		{
        		return true;
        		}
        }
		
		function validateMobNo(key)
		{
			return (key>='0' && key<='9')
		}
	</script>
</body>
</html>
		
