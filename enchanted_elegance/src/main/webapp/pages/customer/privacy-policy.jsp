<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>

<%
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Privacy Policy &mdash; Enchanted Elegance</title>
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

            <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;">
              <a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main content remains unchanged from your original -->
    <div class="bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mt-4 mb-4">
            <h2 class="mb-4 site-section-heading">Privacy Policy</h2>
            <h3 class="mb-1 ">[YOUR SALON NAME]</h3>
            <p class="mb-4 ">Last Updated: [DATE]</p>


            <h5 class="mb-1 text-black">
              1. INTRODUCTION
            </h5>
            Welcome to [YOUR SALON NAME] ("we," "our," or "us"). We are committed to protecting your personal
            information and your right to privacy. This Privacy Policy explains how we collect, use, disclose, and
            safeguard your information when you visit our salon, use our services, or engage with us through our
            website
            or social media platforms.
            </br>
            Please read this privacy policy carefully. If you do not agree with the terms of this privacy policy,
            please
            do not access our services.
            </br>
            </br>
            <h5 class="mb-1 text-black">
              2. INFORMATION WE COLLECT
            </h5>

            <div class="mb-2 text-black">
              Personal Information
            </div>
            We may collect personal information that you voluntarily provide to us when you:
            </br>
            <ul>
              <li>
                Schedule appointments
              </li>
              <li>
                Register for our services
              </li>
              <li>
                Sign up for our loyalty program
              </li>
              <li>
                Complete forms or surveys
              </li>
              <li>
                Contact us
              </li>
            </ul>

            This information may include:
            </br>
            <ul>
              <li>
                Name
              </li>
              <li>
                Email address
              </li>
              <li>
                Phone number
              </li>
              <li>
                Postal address
              </li>
              <li>
                Date of birth
              </li>
              <li>
                Payment information
              </li>
              <li>
                Service history and preferences
              </li>
              <li>
                Health information relevant to services (allergies, skin conditions, etc.)
              </li>
              <li>
                Photos (before/after treatment, with your consent)
              </li>
            </ul>
            <div class="mb-2 text-black">
              Information Automatically Collected
            </div>
            When you visit our website, we may automatically collect certain information about your device, including:
            </br>
            <ul>
              <li>
                IP address
              </li>
              <li>
                Browser type
              </li>
              <li>
                Operating system
              </li>
              <li>
                Referring URLs
              </li>
              <li>
                Time spent on pages
              </li>
              <li>
                Pages visited
              </li>
              <li>
                Other browsing information
              </li>
            </ul>
            </br>

            <h5 class="mb-1 text-black">
              3. HOW WE USE YOUR INFORMATION
            </h5>
            <div class="mb-2 text-black">
              Personal Information
            </div>
            We may use the information we collect for various purposes, including:
            </br>
            <ul>
              <li>
                Providing, personalizing, and improving our services
              </li>
              <li>
                Processing and managing appointments
              </li>
              <li>
                Communicating with you about services, promotions, and events
              </li>
              <li>
                Sending appointment reminders
              </li>
              <li>
                Maintaining and customizing your account
              </li>
              <li>
                Processing payments
              </li>
              <li>
                Administering loyalty programs
              </li>
              <li>
                Responding to inquiries and providing customer support
              </li>
              <li>
                Conducting market research and analyzing business trends
              </li>
              <li>
                Fulfilling our legal obligations
              </li>
              <li>
                Resolving disputes and troubleshooting problems
              </li>
              <li>
                Preventing potentially prohibited or illegal activities
              </li>
            </ul>
            <h5 class="mb-1 text-black">
              4. SHARING YOUR INFORMATION
            </h5>
            We may share your personal information with:
            </br>

            <div class="mb-2 text-black">
              Service Providers
            </div>

            We may share your information with third-party vendors, service providers, contractors, or agents who
            perform services for us or on our behalf.
            <div class="mb-2 text-black">
              Business Transfers
            </div>

            If we are involved in a merger, acquisition, financing, or sale of business assets, your information may
            be
            transferred as part of that transaction.
            <div class="mb-2 text-black">
              Legal Requirements

            </div>

            We may disclose your information where required to do so by law or in response to valid requests by public
            authorities.
            <div class="mb-2 text-black">
              With Your Consent
            </div>

            We may share your information with your consent or as otherwise disclosed at the time of data collection
            or
            sharing.
            </br>
            </br>
            <h5 class="mb-1 text-black">
              5. DATA RETENTION
            </h5>
            We will retain your personal information only for as long as is necessary for the purposes set out in this
            privacy policy, unless a longer retention period is required or permitted by law.
            </br>
            </br>
            <h5 class="mb-1 text-black">
              6. SECURITY OF YOUR INFORMATION
            </h5>
            We use appropriate technical and organizational measures to protect the security of your personal
            information. However, no electronic transmission or storage of information can be entirely secure, and we
            cannot guarantee that the information we collect will be free from security breaches.
            </br>
            </br>
            <h5 class="mb-1 text-black">
              7. YOUR RIGHTS AND CHOICES
            </h5>
            Depending on your location, you may have certain rights regarding your personal information, including:
            <ul>
              <li>The right to access your personal information</li>
              <li>The right to correct inaccurate or incomplete information</li>
              <li>The right to request deletion of your personal information</li>
              <li>The right to restrict or object to our processing of your personal information</li>
              <li>The right to data portability</li>
              <li>The right to withdraw consent at any time</li>
            </ul>
            To exercise these rights, please contact us using the information provided in the "Contact Us" section
            below.
            </br>
            </br>
            <h5 class="mb-1 text-black">
              8. MARKETING COMMUNICATIONS
            </h5>
            You can opt out of receiving promotional communications from us by following the unsubscribe instructions
            provided in those communications or by contacting us directly.
            </br>
            </br>
            <h5 class="mb-1 text-black">
              9. CHILDREN'S PRIVACY
            </h5>
            Our services are not directed to individuals under the age of 16. We do not knowingly collect personal
            information from children. If we learn that we have collected personal information from a child under the
            age of 16, we will take steps to delete such information.
            </br>
            </br>
            <h5 class="mb-1 text-black">
              10. CHANGES TO THIS PRIVACY POLICY
            </h5>
            We may update this privacy policy from time to time. The updated version will be indicated by an updated
            "Last Updated" date. We encourage you to review this privacy policy frequently to be informed of how we
            are
            protecting your information.
            </br>
            </br>
            <h5 class="mb-1 text-black">
              11. CONTACT US
            </h5>
            <div class="mb-1 text-black">
              If you have questions or comments about this privacy policy, please contact us at:
            </div>
            <div >
              [YOUR SALON NAME]
              </br>
              [ADDRESS]
              </br>
              [CITY, STATE ZIP]
              </br>
              [PHONE NUMBER]
              </br>
              [EMAIL ADDRESS]
            </div>
            </br>
            <h5 class="mb-1 text-black">
              12. JURISDICTION-SPECIFIC PROVISIONS
            </h5>
            <div class="mb-1 text-black">
              California Residents
            </div>
            If you are a California resident, you may have additional rights under the California Consumer Privacy Act
            (CCPA) or the California Privacy Rights Act (CPRA).
            <div class="mb-1 text-black">
              European Economic Area Residents
            </div>
            If you are a resident of the European Economic Area (EEA), you have certain data protection rights under
            the
            General Data Protection Regulation (GDPR).
            </br>
            [Include additional sections as required by local laws applicable to your salon's location and customer
            base]
            </br>
            </br>

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
                  <li><a href="/enchanted_elegance/pages/customer/index.jsp">Home</a></li>
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
              with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="/enchanted_elegance/pages/customer/index.jsp"
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

  <!-- new add script -->
  <script src="/enchanted_elegance/pages/customer/js/components/links.js"></script>

</body>
</html>