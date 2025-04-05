<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%@ page import="com.enchantedelegance.dao.usermanagement.UserDAO" %>

<%
    UserDAO userDAO = new UserDAO();

    // Get user ID from URL (if available)
    String userIdParam = request.getParameter("id");
    User user = null;

    if (userIdParam != null && !userIdParam.isEmpty()) {
        int userId = Integer.parseInt(userIdParam);
        user = userDAO.getUserById(userId); // Fetch user from DB
    }

    // If no user from URL, use session user
    if (user == null) {
        user = (User) session.getAttribute("user");
    }

    // If no user found, redirect to login
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Profile &mdash; Enchanted Elegance</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/bootstrap.min.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/magnific-popup.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/jquery-ui.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/aos.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/style.css">

    <!-- new add styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    
  </head>
  <body>
  
  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

    <header class="site-navbar py-1" role="banner">

      <div class="container-fluid">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2" data-aos="fade-down">
            <h1 class="mb-0"><a href="/enchanted_elegance/pages/customer/index.jsp" class="text-black h2 mb-0 single-line">Enchanted Elegance</a></h1>
          </div>
          <div class="col-10 col-md-8 d-none d-xl-block" data-aos="fade-down">
            <nav class="site-navigation position-relative text-right text-lg-center" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li><a id="homeLink">Home</a></li>
                <li><a id="servicesLink">Services</a></li>
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
                  <a href="#" class="authenticate-user-dropdown-trigger pl-3 pr-3 auth-active">
                    <i class="fa fa-user authenticate-user-icon-mr"></i> <%= user.getName() %>
                  </a>
                  <ul class="authenticate-user-dropdown-menu">
                    <li><a href="/enchanted_elegance/profile?id=<%= user.getId() %>" class="authenticate-user-dropdown-item auth-active">Profile</a></li>
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
   
    <div class="bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-7 mt-3 mb-5">
            <div class="p-5 bg-white">
             <form id="editProfileForm" class="form-container" action="/enchanted_elegance/edit-profile" method="post" novalidate>
                <h2 class="mb-4 site-section-heading">Edit Profile</h2>
                <div class="row form-group">
                 <input type="hidden" name="id" value="<%= user.getId() %>">
                 <div class="col-md-12">
                         <label class="text-black required" for="name">Name</label>
                         <input type="text" id="name" name="name" class="form-control" 
                                placeholder="Full Name" required value=<%= user.getName() %>>
                         <small class="error-message" id="nameError"></small>
                     </div>
                 </div>
                 <div class="row form-group">
                     <div class="col-md-6">
                         <label class="text-black required" for="mobile">Mobile</label>
                         <input type="text" id="mobile" name="mobile" class="form-control" 
                                placeholder="Mobile Number" required value=<%= user.getMobile() %>>
                         <small class="error-message" id="mobileError"></small>
                     </div>
                     <div class="col-md-6">
                         <label class="text-black required" for="email">Email</label>
                         <input type="email" id="email" name="email" class="form-control" 
                                placeholder="Email" required value=<%= user.getEmail() %>>
                         <small class="error-message" id="emailError"></small>
                     </div>
                 </div>
                 <div class="row form-group">
                     <div class="col-md-6">
                         <label class="text-black required" for="password">Password</label>
                         <input type="password" id="password" name="password" class="form-control" 
                                placeholder="Password" required>
                         <small class="error-message" id="passwordError"></small>
                     </div>
                     <div class="col-md-6">
                         <label class="text-black required" for="confirmPassword">Confirm Password</label>
                         <input type="password" id="confirmPassword" class="form-control" 
                                placeholder="Confirm Password" required>
                         <small class="error-message" id="confirmPasswordError"></small>
                     </div>
                 </div>
                 <div class="row form-group">
                     <div class="col-md-12">
                         <input type="submit" value="Save Changes" class="btn btn-primary py-2 px-4 text-white">
                     </div>
                 </div>
             </form>   
            </div>
          </div>

          <div class="col-md-5">
          <div class="p-4 mb-3 mt-3 bg-white">
            <h3 class="h5 text-black mb-3"><i class="fa fa-cog mr-1 fa-spin "></i>Account Settings</h3>
            <div class="row">
                <% if (session.getAttribute("user") != null) { %>
                    <div class="col-md-6 mb-3 mb-md-0">
                        <p><a href="/enchanted_elegance/profile?id=<%= user.getId() %>" class="btn btn-primary px-4 py-2 text-white col-md-12"><i class="fa fa-user mr-1"></i>Profile</a></p>                   
                    </div>
                <% } %>
                <% if (session.getAttribute("user") != null) { %>
                <div class="col-md-6 mb-3 mb-md-0">
                    <form action="/enchanted_elegance/delete-account" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
                        <input type="hidden" name="id" value="<%= user.getId() %>">
                            <p><button type="submit" class="btn btn-danger px-4 py-2 text-white col-md-12"><i class="fa fa-trash mr-1"></i>Delete Account</button></p>                       
                    </form>
                </div>     
                <% } %>
                <div class="col-md-12 mb-3 mb-md-0">
                    <p><a href="../../logout" class="btn btn-dark px-4 py-2 text-white col-md-12"><i class="fa fa-sign-out mr-1"></i>Logout</a></p>                   
                </div>
            </div>         
         </div>
            
            <div class="p-4 mb-3 mt-3 bg-white">
              <p class="mb-0 font-weight-bold">New Booking</p>
              <p class="mb-4"><a href="booking.jsp">Click Here</a></p>

              <p class="mb-0 font-weight-bold">My All Bookings</p>
              <p class="mb-4"><a href="../../booking-list">Click Here</a></p>
              
              <p class="mb-0 font-weight-bold">Contact Enchanted Elegance</p>
              <p class="mb-4"><a href="contact.jsp">Click Here</a></p>
      
              <p class="mb-0 font-weight-bold">Give Feedback</p>
              <p class="mb-0"><a href="feedback.jsp">Click Here</a></p>

            </div>
          </div>
            
          </div>
        </div>
      </div>
    </div>


    <div class="site-section">
      <div class="container">
        <div class="row text-center">
          <div class="col-md-12">
            <h2 class="mb-4 text-black">We want your hair to look fabulous</h2>
            <p class="mb-0"><a href="#" class="btn btn-primary py-3 px-5 text-white">Visit Our Salon Now</a></p>
          </div>
        </div>
      </div>
    </div>

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
                  <li><a href="index.jsp">Home</a></li>
                  <li><a href="services.jsp">Services</a></li>
                  <li><a href="haircut.jsp">Haircut</a></li>
                  <li><a href="booking.jsp">Book Online</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-6">
                <ul class="list-unstyled">
                  <li><a href="contact.jsp">Contact</a></li>
                  <li><a href="about.jsp">About Us</a></li>
                  <li><a href="feedback.jsp">Feedback</a></li>
                  <li><a href="privacy-policy.jsp">Privacy Policy</a></li>
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
              with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="index.jsp"
                target="_blank">Enchanted Elegance</a>
            </p>
          </div>
        </div>
      </div>
    </footer>
  </div>

  <script src="/enchanted_elegance/pages/customer/js/jquery-3.3.1.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery-ui.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/popper.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/bootstrap.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/owl.carousel.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery.stellar.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery.countdown.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery.magnific-popup.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/bootstrap-datepicker.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/aos.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/main.js"></script>

  <!-- new add script  -->
  <script src="/enchanted_elegance/pages/customer/js/components/links.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/components/alert.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/components/edit-profile.js"></script>
  
    
  </body>
</html>