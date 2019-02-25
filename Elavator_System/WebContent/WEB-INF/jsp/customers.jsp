<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<link type="text/css" rel="stylesheet" href="resources/css/footer.css"/>

	  <style>
    #preloader{
    background-color: #fff;
    position: fixed;
    top: 0;
    bottom: 0;
    right: 0;
    left: 0;
}
#status{
    background-image: url("resources/images/Wedges.gif");
    background-repeat: no-repeat;
    width:70px;
    height: 70px;
    position: absolute;
    left: 45%;
    top: 70%;
  
}
    </style>
	
	  

</head>

  <body>
   <!--preloader-->
         <div id="preloader">
             <div id="status">&nbsp;</div>
         </div>

         <!--homepage-->    
         

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
      
      
<!--      <div class="row justify-content-around shadow p-3 mb-5 bg-light rounded"> -->
<!--     <div class="col-xl-5 col-sm-5 mb-3"> -->
<!--               <div class="card text-white bg-success o-hidden h-100"> -->
<!--                 <div class="card-body"> -->
<!--                   <div class="card-body-icon"> -->
<!--                     <i class="fas fa-plus"></i> -->
<!--                   </div> -->
<!--                   <div class="mr-5 head"><h2>Add New Customer</h2></div> -->
<!--                 </div> -->
<!--                 <a class="card-footer text-white clearfix small z-1" href="regform"> -->
<!--                   <span class="float-left">Add</span> -->
<!--                   <span class="float-right"> -->
<!--                     <i class="fas fa-plus"></i> -->
<!--                   </span> -->
<!--                 </a> -->
<!--               </div> -->
<!--             </div> -->
      

            <div class="col-xl-6 col-sm-5 mb-3">
              <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-user-circle"></i>
                  </div>
                  <div class="mr-5 head"><h2>View Customers</h2></div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="viewcustomer">
                  <span class="float-left">View Customers</span>
                  <span class="float-right">
                    <i class="fas fa-user-circle"></i>
                  </span>
                </a>
              </div>
  	</div>
      </div>
      
      
     
      
      
      
      
      <script>
      <!-- Custom scripts for all pages-->
      <script src="js/sb-admin.min.js"></script>
           <script src="resources/js/jquery-3.3.1.min.js"></script>

      <!-- Demo scripts for this page-->
      <script src="js/demo/datatables-demo.js"></script>
      <script src="js/demo/chart-area-demo.js"></script>
      <script>

      $(window).on('load',function(){
          $('#status').fadeOut();
          $('#preloader').delay(500).fadeOut();   
      })
      
      
      
      
      
      
      
      </script>
      
</body>
</html>