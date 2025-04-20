<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>

<%
    User user = (User) session.getAttribute("user");
%>



  <!-- new add styles -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <header class="site-navbar py-1" role="banner">

      <div class="container-fluid">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2" data-aos="fade-down">
            <h1 class="mb-0"><a href="/enchanted_elegance" class="text-black h2 mb-0 single-line">Enchanted Elegance</a></h1>
          </div>
          <div class="col-10 col-md-8 d-none d-xl-block" data-aos="fade-down">
            <nav class="site-navigation position-relative text-right text-lg-center" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li><a id="homeLink">Home</a></li>
                <li class="active"><a id="servicesLink">Services</a></li>
                <li><a id="haircutLink">Haircut</a></li>
                <li><a id="bookLink">Book Online</a></li>
                <li><a id="contactLink">Contact</a></li>
                <li><a id="aboutLink">About</a></li>
                <li><a id="feedbackLink">FeedBack</a></li>
              </ul>
            </nav>
          </div>

          <div class="col-6 col-xl-2 text-right" data-aos="fade-down">
            <div class="d-none d-xl-inline-block">
              <ul class="site-menu js-clone-nav ml-auto list-unstyled d-flex text-right mb-0" data-class="social">
                <% if (user == null) { // If user is not logged in %>
                <li>
                  <a id="loginLink" class="pl-0 pr-3 text-black">Login</a>
                </li>
                <li>
                  <a id="registerLink" class="pl-3 pr-3 text-black">Register</a>
                </li>
                <% } else { // If user is logged in %>
                <li class="authenticate-user-dropdown">
                  <a href="#" class="authenticate-user-dropdown-trigger pl-3 pr-3 text-black">
                    <i class="fa fa-user authenticate-user-icon-mr"></i> <%= user.getName() %>
                  </a>
                  <ul class="authenticate-user-dropdown-menu">
                    <li><a href="/enchanted_elegance/profile?id=<%= user.getId() %>" class="authenticate-user-dropdown-item">Profile</a></li>
                    <li><a id="myBookinsLink" class="authenticate-user-dropdown-item">Bookings</a></li>
                    <li><a id="logoutLink" class="authenticate-user-dropdown-item">Logout</a></li>
                  </ul>
                </li>
                <% } %>
              </ul>
            </div>

            <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#"
                class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      </div>

    </header>

    <footer id="footer" class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="mb-5">
              <h3 class="footer-heading mb-4">About Enchanted Elegance</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe pariatur reprehenderit vero atque,
                consequatur id ratione, et non dignissimos culpa? Ut veritatis, quos illum totam quis blanditiis,
                minima minus odio!</p>
            </div>
          </div>
          
          <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="row mb-5">
              <div class="col-md-12">
                <h3 class="footer-heading mb-4">Quick Menu</h3>
              </div>
              <div class="col-md-6 col-lg-6">
                <ul class="list-unstyled">
                  <li><a href="/enchanted_elegance">Home</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/services.jsp">Services</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/haircut.jsp">Haircut</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/booking.jsp">Book Online</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-6">
                <ul class="list-unstyled">
                  <li><a href="/enchanted_elegance/pages/customer/contact.jsp">Contact</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/about.jsp">About Us</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/feedback.jsp">Feedback</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/privacy-policy.jsp">Privacy Policy</a></li>
                </ul>
              </div>
            </div>
          </div>

          <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="mb-5">
              <h3 class="footer-heading mb-2">Subscribe Newsletter</h3>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit minima minus odio.</p>
              <form action="#" method="post">
                <div class="input-group mb-3">
                  <input type="text" class="form-control border-secondary text-white bg-transparent"
                    placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary text-white" type="button" id="button-addon2">Send</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="mb-5">
              <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
            </div>

            <p>
              Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made
              with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="/enchanted_elegance"
                target="_blank">Enchanted Elegance</a>
            </p>
          </div>
        </div>
      </div>
    </footer>


  <!-- new add script  -->
  <script src="/enchanted_elegance/pages/customer/js/components/links.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/components/alert.js"></script>

