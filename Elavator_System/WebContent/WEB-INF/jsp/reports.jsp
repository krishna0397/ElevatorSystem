<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Dashboard</title>
    
    <link type="text/css" rel="stylesheet" href="resources/css1/sb-admin.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap-grid.min.css"/>
    <link type="text/css" rel="stylesheet" href="resources/vendor1/css/bootstrap-reboot.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/fontawesome.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/all.min.css"/>
	<link type="text/css" rel="stylesheet" href="resources/vendor1/fontawesome-free/css/regular.min.css"/>
	
    
    
    <style>
    .head{font-size:40px;}
    </style>

</head>
<body>

  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark static-top" style="background-color: mediumvioletred">

      <a class="navbar-brand mr-1" href="#">Elevator Admin</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        
        <div class="col-md-4">
      	 <li class="nav-item dropdown no-arrow">
            <a href="adminhome"><i style="color: white; "class="fas fa-home fa-lg"></i></a>
            </li>
            </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="adminprofile"><i style="color: white; "class="fas fa-user-circle fa-lg "></i></a>
        </li>
        </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="messages"><i style="color: white; "class="fas fa-envelope fa-lg "></i></a>
        </li>
        </div>
        
        <div class="col-md-2">
        <li align="right"  class="nav-item dropdown no-arrow">
          <a href="adminlogout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
          </li>
          </div>
          </ul>
    </nav>
    <br>
    
	<div class="row justify-content-around shadow p-3 mb-5 bg-light rounded">    
    <div class="col-xl-6 col-sm-6 mb-3">
              <div class="card text-white bg-info o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-eye"></i>
                  </div>
                  <div class="mr-5 head">Profit OR Loss Reports</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="profitloss">
                  <span class="float-left">View</span>
                  <span class="float-right">
                    <i class="fas fa-eye"></i>
                  </span>
                </a>
              </div>
            </div>
            
             <div class="col-xl-6 col-sm-6 mb-3"> 
               <div class="card text-white bg-primary o-hidden h-100"> 
                 <div class="card-body"> 
                   <div class="card-body-icon"> 
                     <i class="fa fa-eye"></i> 
                   </div> 
                   <div class="mr-5 head">Bill Reports</div> 
                 </div> 
                 <a class="card-footer text-white clearfix small z-1" href="billreport"> 
                   <span class="float-left">View</span> 
                   <span class="float-right"> 
                     <i class="fa fa-eye"></i> 
                   </span> 
                 </a> 
               </div>
            </div>
          </div>
</body>
</html>