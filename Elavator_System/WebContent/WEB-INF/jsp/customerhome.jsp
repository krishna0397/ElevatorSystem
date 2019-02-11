<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
    

	<title>customer Profile</title>	
	
	
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
		<nav class="navbar navbar-expand navbar-dark static-top" style="background-color:darkorange">

      <a class="navbar-brand mr-3" style="padding-bottom:35px;" href="#">Customer Dashboard</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>     

      <ul class="navbar-nav ml-auto ml-md-0">
      
      <div class="col-md-4">
      	 <li class="nav-item dropdown no-arrow">
            <a href="customerhome"><i style="color: white; "class="fas fa-home fa-lg"></i></a>
            </li>
            </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="orders/${cust.customer_id}"><i style="color: white; "class="fas fa-shopping-cart fa-lg "></i></a>
        </li>
        </div>
        
        <div class="col-md-2">
        	<li align="right"  class="nav-item dropdown no-arrow">
          		<a href="logout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
        	</li>
        </div>
      </ul>
    </nav>
	
	<div class="container">
      <div class="row shadow-sm p-3 mb-5 bg-light rounded"><br>
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
           
       <br>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading"  style="background-color: darksalmon;">
            <div class="row">
            
             <div class="clo-md-2">
                           <h3 class="panel-title" style="font-size: large; font-weight:600; color: white;padding-left: 20px;padding-top: 10px;"> ${cust.customer_name}</h3>
             
            </div>
            
             <div class="col-md-2  col-md-offset-8">
             <A style="color: white;" align="right" class="btn btn-primary" href="editcustomer/${cust.customer_id}"><span class="fas fa-edit"></span> Edit Profile</A>
             
            </div>
            
            
            </div>
                 
            </div>
  
            <br>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"><i class="fas fa-user-circle fa-lg" style="font-size:100px"></i> </div>
                
               <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td class="option">Customer Id:</td>
                        <td class="option-value">${cust.customer_id}</td>
                      </tr>
                      
                      <tr>
                        <td class="option">Name:</td>
                        <td class="option-value">${cust.customer_name}</td>
                      </tr>
                      
                       <tr>
                        <td class="option">Username:</td>
                        <td class="option-value">${cust.username}</td>
                      </tr>
                      
                      <tr>
                        <td class="option">Email:</td>
                        <td class="option-value">${cust.customer_email}</td>
                      </tr>
                   
                       <tr>
                        <td class="option">Address:</td>
                        <td class="option-value">${cust.customer_address}</td>
                      </tr>
                      
                        <tr>
                        <td class="option">Mobile No:</td>
                        <td class="option-value">${cust.customer_mobileno}</td>
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