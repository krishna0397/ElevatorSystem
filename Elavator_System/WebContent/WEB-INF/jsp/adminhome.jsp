<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.Item"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

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

  <body id="page-top">

<nav class="navbar navbar-expand navbar-dark static-top" style="background-color: black;">

      <a class="navbar-brand mr-1" href="#">Elevator Admin</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        
        <div class="col-md-4">
      	 <li class="nav-item dropdown no-arrow">
            <a href="${pageContext.request.contextPath}/adminhome" data-toggle="tooltip" title="Home"><i style="color: white; "class="fas fa-home fa-lg"></i></a>
            </li>
            </div>
        
        <div class="col-md-4">
        <li class="nav-item dropdown no-arrow">
           <a href="${pageContext.request.contextPath}/adminprofile" data-toggle="tooltip" title="Profile"><i style="color: white; "class="fas fa-user-circle fa-lg "></i></a>
        </li>
        </div>
        
        
        
          <div class="col-md-3" style="position:relative;">
        <li class="nav-item dropdown no-arrow" >         
          <a href="${pageContext.request.contextPath}/cart" data-toggle="tooltip" title="Cart"><i  style="color: white;" class="fas fa-cart-plus fa-lg" ></i> 
          </li>
           <span class="badge btn btn-warning"style="position:absolute;right:10px;top:0px;border-radius:10px;color:white;">
           <% List<Item> cart = (List<Item>)session.getAttribute("cart"); out.print(cart.size()); %></span>
          </div></a>
          
        <div class="col-md-4">
        <li align="right"  class="nav-item dropdown no-arrow">
          <a href="${pageContext.request.contextPath}/adminlogout" data-toggle="tooltip" title="Logout"><i  style="color: white;" class="fas fa-sign-out-alt fa-lg" ></i> </a>
          </li>
          </div>
          
        
        </ul>
      </nav>
	<br>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Overview</li>
          </ol>

          <!-- Icon Cards-->
          <div class="row justify-content-around shadow p-3 mb-5 bg-light rounded">
            <div class="col-xl-4 col-sm-4 mb-3">
              <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-user-circle"></i>
                  </div>
                  <div class="mr-5 head">Customers </div>
                  <span style="float:right;font-size:40px;">${custno}</span>
                  </div>
                 
                <a class="card-footer text-white clearfix small z-1" href="customers">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                       <i class="fas fa-user-circle"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-4 col-sm-4 mb-3">
              <div class="card text-white bg-warning o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-address-book"></i>
                  </div>
                  <div class="mr-5 head">Employees</div>
                  <span style="float:right;font-size:40px;">${empno}</span>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="employees">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-address-book"></i>
                  </span>
                </a>
              </div>
            </div>
            
             <div class="col-xl-4 col-sm-4 mb-3">
              <div class="card text-white bg-info o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-cart-plus"></i>
                  </div>
                  <div class="mr-5 head">Orders</div>
                  <span style="float:right;font-size:40px;">${orderno}</span>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="orderrequests">
                  <span class="float-left">View Orders</span>
                  <span class="float-right">
                    <i class="fas fa-cart-plus"></i>
                  </span>
                </a>
              </div>
            </div>
            
            
            <div class="col-xl-4 col-sm-4 mb-3">
              <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-shopping-cart"></i>
                  </div>
                  <div class="mr-5 head">Inventory</div>
                  <span style="float:right;font-size:40px;">${prodno}</span>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="inventory">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-fw fa-shopping-cart"></i>
                  </span>
                </a>
              </div>
            </div>
            
            <div class="col-xl-4 col-sm-4 mb-3">
              <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-layer-group"></i>
                  </div>
                  <div class="mr-4 head">Departments</div>
                  <span style="float:right;font-size:40px;">${deptno}</span>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="departments">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-layer-group"></i>
                  </span>
                </a>
              </div>
            </div>
            
            
            <div class="col-xl-4 col-sm-4 mb-3">
              <div class="card text-white o-hidden h-100" style="background-color:darkmagenta;">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fa fa-file"></i>
                  </div>
                  <div class="mr-5 head">Reports</div>
                  <span style="float:right;font-size:40px;"></span>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="reports">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fa fa-file"></i>
                  </span>
                </a>
              </div>
            </div>
            
            
          </div>
        </div>
        <!-- /.container-fluid -->

      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>

  </body>

</html>
