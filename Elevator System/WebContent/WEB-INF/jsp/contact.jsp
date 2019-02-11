<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Elevators Home Page</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="resources/fonts/font-awesome-4.7.-/font-awesome.min.css"> 
    
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap-reboot.css">
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap-grid.css">

    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
	   


    <link rel="stylesheet" href="resources/css/aos.css">
    <link rel="stylesheet" href="resources/css/style.css">
    
  </head>
  <body>
  
  <div class="site-wrap">
    <header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <input type="text" class="form-control border-0">
              </form>
            </div>

            
              <div class="site-logo">
                <a href="index" class="js-logo-clone">Elevators</a>
              </div>
            

            
              </div> 
            </div>

          </div>
        </div>
      </div> 
       <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
              <a href="index">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;
			  <a href="about">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;
           	  <a href="product">Product</a>&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="contact">Contact Us</a>&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="login">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;
			
          </ul>
        </div>
      </nav>
    </header>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Contact Us</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">Get In Touch</h2>
          </div>
          
          <div class="col-md-7">
            <form:form action="message" name="msgForm" method="POST">
              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                	
					<tr>
							<td><form:hidden path="date" value="<%=new java.util.Date().toLocaleString() %>" class="form-control" name="date" id="cdate" required="required"/>
							<span id="ctdate" class="text-danger"></span>
						</td>	
				</tr>
                
                  <div class="col-md-6">
                    <label for="fname" class="text-black">First Name <span class="text-danger">*</span></label>
                    <form:input path="fname" type="text" class="form-control" id="c_fname" name="fname"/>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="lname" class="text-black">Last Name <span class="text-danger">*</span></label>
                    <form:input path="lname"  type="text" class="form-control" id="c_lname" name="lname"/>
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="email" class="text-black">Email <span class="text-danger">*</span></label>
                    <form:input path="email" type="email" class="form-control" id="c_email" name="email" placeholder="emial"/>
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="subject" class="text-black">Subject </label>
                    <form:input path="subject" type="text" class="form-control" id="c_subject" name="subject"/>
                  </div>
                </div>

                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="message" class="text-black">Message </label>
                    <form:textarea path="msg" name="msg" id="c_message" cols="30" rows="7" class="form-control"/>
                  </div>
                </div>
                
              
                
                <div class="form-group row">
                  <div class="col-lg-12">
                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Send Message">
                  </div>
                </div>
                
              </div>
            </form:form>
          </div>
          
      <div class="col-md-5 ml-auto">
        <div class="p-4 border mb-3">
          <div class="col-md-8 col-lg-8">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4"><br><br>Contact Info</h3><br>
              <ul class="list-unstyled">
                <li class="address">Elevators System,
                2nd lane,
                Kothrud,Pune,
                India</li>
                <li class="phone">+91 9875 929 210</li>
                <li class="email">elevatorsystem@gmail.com</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    
  </div>

   <script src="resources/js/jquery-3.3.1.min.js"></script>
  <script src="resources/js/jquery-ui.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/aos.js"></script>
  <script src="resources/js/main.js"></script>
  <script src="resources/js/slick.min.js"></script>
    
  </body>
</html>