

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/fontawesome.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/all.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/regular.min.css"/>

    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
<style>
.invoice-title h2, .invoice-title h3 {
    display: inline-block;
}

.table > tbody > tr > .no-line {
    border-top: none;
}

.table > thead > tr > .no-line {
    border-bottom: none;
}

.table > tbody > tr > .thick-line {
    border-top: 2px solid;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<body>
	<form action="payamount" method="POST">

	
<div class="container" style="position:relative;" id="bill">
    <div class="row">
   	
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<a href="#" id="printbtn" class="btn btn-primary btn-info btn-sm pull-right" style="position:absolute; top:10px;right:20px;" onclick=" document.getElementById('printbtn').style.visibility = 'hidden'; document.getElementById('cnfrpaid').style.visibility = 'hidden';document.getElementById('gstdiscount').style.visibility = 'hidden'; window.print(); document.getElementById('cnfrpaid').style.visibility = 'visible';document.getElementById('gstdiscount').style.visibility = 'visible';
    			document.getElementById('cnfrpaid').style.visibility = 'visible';">Print <i class="fa fa-print" style="font-size:15px;"></i></a><br><br>
    			<h2>Elevators  Traders</h2><h4 style="font-size:20px;"class="pull-right">Bill Id:ES<% int random=(int)(Math.random()*10000); out.print(random); %> 
    			</h4>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Billed By:</strong><br>
    					Elevator's House,<br>
    					Pune, 412412<br>
    					Maharashtra<br>
    				</address>	
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>Shipped To:</strong><br>
    					 ${list.customer_address}<br>   					
    				</address>
    			</div>
    		</div>
    		
    		<div class="row">
    	<div class="col-xs-6">
    	<address style="color:brown;">
    	<strong>Payment Method: ${list.payment_method}</strong><br>
    		 <br>
    		
    	</address>
   		 </div>
    </div>
    		
    		<div class="row">
    			<div class="col-xs-6">
    				
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<!-- <strong>Bill Date:</strong><br> -->
    <script>  
	var date=new Date();  
	var day=date.getDate();  
	var month=date.getMonth()+1;  
	var year=date.getFullYear();
	document.write("<br> <strong>Bill Date:</strong>"+day+"/"+month+"/"+year);  
	</script>      <br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Product summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    				
    	<table cellpadding="2" cellspacing="2" border="0" class="table table-striped table-hover" align="center">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>
		</tr>
		<c:set var="total" value="0"></c:set>
		<c:forEach var="item" items="${sessionScope.cart }">
			<c:set var="total"
				value="${total + item.product.amount * item.quantity }"></c:set>
			<tr>
				
				<td>${item.product.product_id }</td>
				<td>${item.product.product_name}</td>
			
				<td>${item.product.amount }</td>
				<td>${item.quantity }</td>
				<td>${item.product.amount * item.quantity }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6"  style="position:relative;"><br><strong><span  style="position:absolute;right:50px;bottom:15px;">TOTAL = ${total} Rs</span></strong><br></td>
		</tr>
	</table>
		        <c:forEach var="item1" items="${sessionScope.gd }">    
			    <div class="row">
			   
			       <div class="col-md-10">
			        <h4> The GST : ${item1.gst }%</h4>
			       </div>
			        <div class="col-md-2">
			        <c:set class="" var="gstpercent" value="${item1.gst }"/>
					<c:set var="amt1" value="${total * gstpercent/100}"/>
					<h4><c:out value="${amt1}"/></h4>
					</div>
				</div>
				<div class="row">
				<div class="col-md-10">
				<h4> The DISCOUNT : ${item1.discount }%</h4>
                      </div>
                   <div class="col-md-2">
                   <c:set var="discountpercent" value="${item1.discount }"/>
					<c:set var="amt2" value="${total * discountpercent/100}"/>
                    <h4><c:out value="${amt2}"/></h4><br>

                    
  				</div>
  				</div>
<!--   				<a href="gstdiscountform" class="btn btn-primary"  id="gstdiscount">Change GST & DISCOUNT <i class="fa fa-edit"></i></a> -->
  				 
  				
  				<div class="row">
				<div class="col-md-10">
                    <h4><u><i><b style="color:blue">Total Amount to be paid: </b></i></u></h4>
                     </div>
                   <div class="col-md-2">
                    <h3><c:out value="${total+amt1-amt2}"/></h3><br>
  				</div>
  				</div>
    			</c:forEach>
    			<a href="paidsuccess"><button id="cnfrpaid"class="btn btn-success btn-md">Confirm And Paid</button></a>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
</form>
                              <script>
                               function printPage(){
                            		 //  document.getElementById("printbtn").style.visibility = "hidden";
                            		   window.print();
                            		 //  document.getElementById("printbtn").style.visibility = "visible";
                               		}
                               }
                               
                               function setGst()
                                {
 								//var gst=document.getElementById("gst").value;
 								console.log("gst");
 								//document.getElementByTagName("c:set").value=gst;
								
                                }
                              
                              </script>
	


</body>
</html>

