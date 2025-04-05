<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%@ page import="com.enchantedelegance.models.offermanagement.Offer" %>
<%@ page import="com.enchantedelegance.models.feedbackmanagement.Feedback" %>
<%@ page import="com.enchantedelegance.dao.offermanagement.OfferDAO" %>
<%@ page import="com.enchantedelegance.dao.feedbackmanagement.FeedbackDAO" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("user");
%>

<%
    OfferDAO offerDAO = new OfferDAO();

    // Get all offers
    List<Offer> offers = offerDAO.getAllOffers();

    // Ensure the list is never null
    if (offers == null) {
        offers = new java.util.ArrayList<>();
    }

    FeedbackDAO feedbackDAO = new FeedbackDAO();

    // Get all published feedbacks
    List<Feedback> feedbacks = feedbackDAO.getFeedbackPublished();

    // Ensure the list is never null
    if (feedbacks == null) {
        feedbacks = new java.util.ArrayList<>();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Home &mdash; Enchanted Elegance </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700">
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
  <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/loader.css">
  <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/custom.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>



<body>
  <div class="enchanted-loader-container">
        <div class="enchanted-loader"></div>
  </div>
  <div class="enchanted-main-content" style="display: none;">
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
                <li class="active"><a id="homeLink">Home</a></li>
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

    <div class="slide-one-item home-slider owl-carousel">
      <div class="site-blocks-cover" style="background-image: url(/enchanted_elegance/pages/customer/images/hero_bg_1.jpg);" data-aos="fade"
        data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">

            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
              <h5 class="text-white font-weight-light text-uppercase">Welcome to Enchanted Elegance</h5>
              <h2 class="text-white font-weight-light mb-2 display-1">Hair Salon Expert</h2>

              <p><a href="/enchanted_elegance/pages/customer/booking.jsp" class="btn btn-black py-3 px-5">Book Now!</a></p>
            </div>
          </div>
        </div>
      </div>

      <div class="site-blocks-cover" style="background-image: url(/enchanted_elegance/pages/customer/images/hero_bg_2.jpg);" data-aos="fade"
        data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">

            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
              <h2 class="text-white font-weight-light mb-2 display-1">Beautiful Hair, Healthy You!</h2>

              <p><a href="/enchanted_elegance/pages/customer/booking.jsp" class="btn btn-black py-3 px-5">Book Now!</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <% if (!offers.isEmpty()) { %>
    <div class="site-section">
      <div class="d-flex justify-content-center">
        <div class="col-md-7">
          <h2 class="site-section-heading font-weight-light text-black text-center">Today Offers</h2>
        </div>
      </div>
      <div class="off-body">
        <div class="off-carousel-container">
          <div class="owl-carousel owl-theme">
            <% for (Offer offer : offers) { %>
            <div class="off-card">
              <div class="off-container">
                <div class="off-image">
                  <img src="<%= offer.getImage() != null ? offer.getImage() : "https://placehold.co/250x250/EEE/31343C" %>" alt="Offer">
                </div>
                <div class="off-content">
                  <h2 class="off-title"><%= offer.getTitle() %></h2>
                  <h3 class="off-discount"><%= offer.getDiscount() %></h3>
                  <p class="off-description"><%= offer.getDescription() %></p>
                </div>
              </div>
            </div>
            <% } %>
          </div>
        </div>
      </div>
    </div>
    <% } %>

    <div class="site-section">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-lg-4 text-center">
        <h3 class="line-height-1 mb-3"><span class="d-block display-4 line-height-1 text-black">Welcome to</span>
          <span class="d-block display-4 line-height-1"><em class="text-primary font-weight-bold">Hair
              Salon</em></span>
        </h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt architecto ab hic rem placeat eius
          commodi eum eligendi recusandae sed qui cumque quibusdam.</p>
        <p><a href="#"><small class="text-uppercase font-weight-bold">Read More</small></a></p>
      </div>
      <div class="col-md-6 col-lg-4">
        <figure class="h-100 hover-bg-enlarge">
          <div class="bg-image h-100 bg-image-md-height" style="background-image: url('/enchanted_elegance/pages/customer/images/img_2.jpg');"></div>
        </figure>
      </div>
      <div class="col-md-6 col-lg-4">
        <div class="border p-4 d-flex align-items-center justify-content-center h-100">
          <div class="text-center">
            <h2 class="text-primary h2 mb-5">Opening Hours</h2>
            <p class="mb-4">
              <span class="d-block font-weight-bold">Mon – Fri </span>
              10:00 AM – 8:30 PM
            </p>

            <p class="mb-4">
              <span class="d-block font-weight-bold">Saturday</span>
              Closed
            </p>

            <p class="mb-4">
              <span class="d-block font-weight-bold">Sunday</span>
              10:00 AM – 8:30 PM
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="site-section">
  <div class="container">
    <div class="row justify-content-center mb-5">
      <div class="col-md-7">
        <h2 class="site-section-heading font-weight-light text-black text-center">Featured Services</h2>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
        <div class="h-100 p-4 p-lg-5 bg-light site-block-feature-7">
          <span class="icon flaticon-razor display-3 text-primary mb-4 d-block"></span>
          <h3 class="text-black h4">Barber Razor</h3>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.
          </p>
          <p><strong class="font-weight-bold text-primary">$29</strong></p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
        <div class="h-100 p-4 p-lg-5 bg-light site-block-feature-7">
          <span class="icon flaticon-location-pin display-3 text-primary mb-4 d-block"></span>
          <h3 class="text-black h4">Location Pin</h3>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.
          </p>
          <p><strong class="font-weight-bold text-primary">$46</strong></p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
        <div class="h-100 p-4 p-lg-5 bg-light site-block-feature-7">
          <span class="icon flaticon-shave display-3 text-primary mb-4 d-block"></span>
          <h3 class="text-black h4">Barber Shave</h3>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.
          </p>
          <p><strong class="font-weight-bold text-primary">$24</strong></p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="site-section bg-light">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 mb-5">
        <img src="/enchanted_elegance/pages/customer/images/person_1.jpg" alt="Image" class="img-md-fluid">
      </div>
      <div class="col-lg-6 bg-white p-md-5 align-self-center">
        <h2 class="display-1 text-black line-height-1 site-section-heading mb-4 pb-3">New hairstyle!</h2>
        <p class="text-black lead"><em>&ldquo;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique
            dolorem quisquam laudantium, incidunt id laborum, tempora aliquid labore minus. Nemo maxime, veniam!
            Fugiat odio nam eveniet ipsam atque, corrupti porro&rdquo;</em></p>
        <p class="lead text-black">&mdash; <em>Stellla Martin</em></p>
      </div>
    </div>
  </div>
</div>

    <!-- Other content sections here -->

    <% if (!feedbacks.isEmpty()) { %>
    <div class="site-section">
      <div class="d-flex justify-content-center">
        <div class="col-md-7">
          <h2 class="site-section-heading font-weight-light text-black text-center">FeedBacks</h2>
        </div>
      </div>
      <div class="feed-body">
        <div class="feed-carousel-container">
          <div class="owl-carousel owl-theme">
            <% for (Feedback feedback : feedbacks) { %>
            <div class="feed-card">
              <div class="feed-content">
                <h2 class="feed-name"><%= feedback.getName() %></h2>
                <p class="feed-message"><%= feedback.getMessage() %></p>
              </div>
              <h3 class="feed-date"><%= feedback.getDate() %></h3>
            </div>
            <% } %>
          </div>
        </div>
      </div>
    </div>
    <% } %>

    <div class="site-blocks-cover overlay inner-page-cover"
      style="background-image: url(/enchanted_elegance/pages/customer/images/hero_bg_2.jpg); background-attachment: fixed;">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-10" data-aos="fade-up" data-aos-delay="400">
            <h2 class="text-white font-weight-light mb-5 display-3">Experience Our Outstanding Services</h2>
            <a href="https://vimeo.com/channels/staffpicks/93951774"
              class="play-single-big d-inline-block popup-vimeo"><span class="icon-play"></span></a>
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

  <!-- home page script  -->
  <script src="/enchanted_elegance/pages/customer/js/components/loader.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/components/home.js"></script>

  <!-- new add script  -->
  <script src="/enchanted_elegance/pages/customer/js/components/links.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/components/alert.js"></script>

</body>
</html>