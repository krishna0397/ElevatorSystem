<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

    <meta charset="utf-8" />
    <title>Credit Card Payment Form Template | PrepBootstrap</title>
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
    <h1>Payment By Cheque</h1>
</div>

<!-- Cheque Payment Form - START -->

<form:form method="get" action="chequepayment">
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
                                    <label>NAME ON CHEQUE</label>
                                    <div class="input-group">
                                        <form:input path="nameoncheque" type="text" class="form-control" placeholder="Name on Cheque" required="required"/>
                                        <span class="input-group-addon"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label><span class="hidden-xs">ACCOUNT NUMBER</span></label>
                                    <form:input path="accno" type="tel" class="form-control" placeholder="Account Number" required="required"/>
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label><span class="hidden-xs">CHEQUE NO</span></label>
                                    <form:input path="chequeno" type="tel" class="form-control" placeholder="Cheque Number" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>DATE</label>
                                    <form:input path="date" type="date" class="form-control" placeholder="Date" required="required" />
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
		
</body>
</html>
