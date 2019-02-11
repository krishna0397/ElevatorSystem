<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.Item"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	
	<link type="text/css" rel="stylesheet" href="resources/css1/sb-admin.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap-grid.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap-reboot.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/fontawesome.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/all.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/regular.min.css"/>
	
	<link type="text/css" rel="stylesheet" href="resources/css2/adminprofile.css"/>
	<link type="text/css" rel="stylesheet" href="resources/js2/adminprofile.js"/>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
    

	<title>Admin Profile</title>
	<style>
	.option{
   font-weight: 800;
	}
		.option-value{
   font-weight: 600;
	}
	</style>		
	</head>
	
<body>
		<nav class="navbar navbar-expand navbar-dark static-top" style="background-color: mediumvioletred;">

      <a class="navbar-brand mr-1" href="index.html" style="padding-bottom:33px">Elevator Admin</a>

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
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="${pageContext.request.contextPath}/messages"><i style="color: white; "class="fas fa-envelope fa-lg "></i></a>
        </li>
        </div>
        
          <div class="col-md-3" style="position:relative;">
        <li class="nav-item dropdown no-arrow" >         
          <a href="${pageContext.request.contextPath}/cart"><i  style="color: white;" class="fas fa-cart-plus fa-lg" ></i> </a>
          </li>
           <span class="badge btn btn-warning"style="position:absolute;right:10px;top:0px;border-radius:10px;color:white;">
           <%List<Item> cart = (List<Item>) session.getAttribute("cart"); out.print(cart.size());%></span>
          </div>
          
        <div class="col-md-4">
        <li align="right"  class="nav-item dropdown no-arrow">
          <a href="${pageContext.request.contextPath}/adminlogout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
          </li>
          </div>
          
        
        </ul>
      </nav>
	<br>
	
<div class="container">
      <div class="row shadow p-3 mb-5 bg-light rounded">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">

       <br>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading" style="background-color: cadetblue;">
              <h3 class="panel-title" style="font-size: large; font-weight:600; color: white;padding-left: 20px;padding-top: 10px;">Sheena Shrestha</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="resources/images/men.jpg" class="img-circle img-responsive"> </div>
                
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td class="option">Department:</td>
                        <td class="option-value">Administration</td>
                      </tr>
                      <tr>
                        <td class="option">Hire date:</td>
                        <td class="option-value">06/23/2013</td>
                      </tr>
                      <tr>
                        <td class="option">Date of Birth</td>
                        <td class="option-value">01/24/1988</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td class="option">Gender</td>
                        <td class="option-value">Female</td>
                      </tr>
                        <tr>
                        <td class="option">Home Address</td>
                        <td class="option-value">Mumbai,India</td>
                      </tr>
                      <tr>
                        <td class="option">Email</td>
                        <td class="option-value"><a href="mailto:info@support.com">sheena123@gmail.com</a></td>
                      </tr>
                        <td class="option">Phone Number</td>
                        <td class="option-value">123-4567-890(Landline)<br><br>+91 9856457812(Mobile)
                        </td>
                           
                      </tr>
                     
                    </tbody>
                  </table>
                  
                </div>
              </div>
            </div>
                
            
          </div>
        </div>
      </div>
    </div>
    </body>
    </html>        