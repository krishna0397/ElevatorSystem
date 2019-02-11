<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.Item"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Cart Page</title>
    
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

<style>
table,th,td{text-align:center;}
</style>
	

</head>

  <body>

    <nav class="navbar navbar-expand navbar-dark static-top" style="background-color: mediumvioletred;">

      <a class="navbar-brand mr-1" href="index.html">Elevator Admin</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        
        <div class="col-md-4">
      	 <li class="nav-item dropdown no-arrow">
            <a href="${pageContext.request.contextPath}/adminhome"><i style="color: white; "class="fas fa-home fa-lg"></i></a>
            </li>
            </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="${pageContext.request.contextPath}/adminprofile"><i style="color: white; "class="fas fa-user-circle fa-lg "></i></a>
        </li>
        </div>
        
        
          <div class="col-md-3" style="position:relative;">
        <li class="nav-item dropdown no-arrow" >         
          <a href="${pageContext.request.contextPath}/cart"><i  style="color: white;" class="fas fa-cart-plus fa-lg" ></i> </a>
          </li>
           <span class="badge btn btn-warning"style="position:absolute;right:10px;top:0px;border-radius:10px;color:white;"><%List<Item> cart = (List<Item>) session.getAttribute("cart");
           out.print(cart.size());%></span>
          </div>
          
        <div class="col-md-4">
        <li align="right"  class="nav-item dropdown no-arrow">
          <a href="${pageContext.request.contextPath}/adminlogout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
          </li>
          </div>
          
        
        </ul>
      </nav>
	<br>
		
	<div class="container shadow p-3 mb-5 bg-light rounded table table-responsive" style="margin-top:20px; position:relative;">
	<h2 style="margin-left:10px;">Cart <i class="fas fa-cart-plus"></i></h2>
	<a class="btn btn-danger btn-sm float-right" style="margin-right:20px; position:absolute;right:20px;top:30px;"  href="${pageContext.request.contextPath }/reset">Reset</a>
	<table cellpadding="2" cellspacing="2" border="0" class="table table-striped table-hover" align="center">
		<tr>
			<th>Option</th>
			<th>Id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>
		</tr>
		<c:set var="total" value="0"></c:set>
		<c:forEach var="item" items="${sessionScope.cart }">
			<c:set var="total"
				value="${total + item.product.amount * item.quantity } "></c:set>
			<tr>
				<td align="center"><a
					href="${pageContext.request.contextPath }/remove/${item.product.product_id }"
					onclick="return confirm('Are you sure?')">Remove</a></td>
				<td>${item.product.product_id }</td>
				<td>${item.product.product_name}</td>
			
				<td>${item.product.amount }</td>
				<td> <a href="${pageContext.request.contextPath }/decrement/${item.product.product_id }"><i class="fas fa-minus-circle"></i> </a>
				 	${item.quantity } 
				 <a href="${pageContext.request.contextPath }/increment/${item.product.product_id }"><i class="fas fa-plus-circle"></i> </a>  
				
				</td>
				
				
							
				<td>${item.product.amount * item.quantity }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6"  style="position:relative;"><br><strong><span  style="position:absolute;right:50px;bottom:15px;">TOTAL = ${total} Rs</span></strong><br></td><br>
		</tr>
	</table>
	<br>
		<a class="btn btn-primary btn-sm" style="margin-left:20px;" href="${pageContext.request.contextPath }/makeorder"><i class="fas fa-arrow-circle-left"></i> Continue Shopping</a>
		<a class="btn btn-primary btn-sm float-right" id="buyprod" style="margin-right:20px;display:none;"  href="${pageContext.request.contextPath }/buy">Buy Products <i class="fas fa-arrow-circle-right"></i></a>
		
		<% List<Item> list=(List<Item>)session.getAttribute("cart");
					boolean cartsize=list.isEmpty();
				%>
		<script>
					var cartsize=<%=cartsize%>
					
					if(!cartsize)
						{
							document.getElementById("buyprod").style.display="block";
						}
				</script>
	

	</div>
</body>
</html>