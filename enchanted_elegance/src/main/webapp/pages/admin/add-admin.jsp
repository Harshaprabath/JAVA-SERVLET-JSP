<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
      if (admin == null) {
            response.sendRedirect("/enchanted_elegance/pages/admin/login.jsp?error=Please login first"); // Redirect to the login page if not logged in
            return;
        }
%>

<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Add Admin &mdash; Enchanted Elegance</title>
  <link rel="stylesheet" href="/enchanted_elegance/pages/admin/css/styles.min.css" />
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
      <!-- Sidebar scroll-->
      <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
          <a href="/enchanted_elegance/pages/admin/index.jsp" class="text-nowrap">
            <h4><span class="text-primary">E</span>nchanted <span class="text-primary">E</span>legance</h4>
          </a>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <ul id="sidebarnav">
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Home</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/pages/admin/index.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                <span class="hide-menu">Dashboard</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Admin</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/admin-list" aria-expanded="false">
                <span>
                  <i class="ti ti-user"></i>
                </span>
                <span class="hide-menu">All Admins</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link active" href="/enchanted_elegance/pages/admin/add-admin.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-user-plus"></i>
                </span>
                <span class="hide-menu">Add Admin</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Customer</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/user-list" aria-expanded="false">
                <span>
                  <i class="ti ti-user"></i>
                </span>
                <span class="hide-menu">All Users</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Booking</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/booking-list" aria-expanded="false">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
                <span class="hide-menu">All Booking</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Offer</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/offer-list" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                <span class="hide-menu">All Offers</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/pages/admin/add-offer.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-plus"></i>
                </span>
                <span class="hide-menu">Add Offers</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Contact</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/contact-list" aria-expanded="false">
                <span>
                  <i class="ti ti-bell-ringing"></i>
                </span>
                <span class="hide-menu">All Contacts</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Feedback</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/feedback-list" aria-expanded="false">
                <span>
                  <i class="ti ti-mood-happy"></i>
                </span>
                <span class="hide-menu">All Feedbacks</span>
              </a>
            </li>
          </ul>
          </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                <i class="ti ti-bell-ringing"></i>
                <div class="notification bg-primary rounded-circle"></div>
              </a>
            </li>
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <a href="/enchanted_elegance" target="_blank" class="btn btn-primary">Visi Site</a>
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <img src="/enchanted_elegance/pages/admin/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                  <%-- active --%>
                    <a href="/enchanted_elegance/admin/profile?id=<%= admin.getId() %>" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-user fs-6"></i>
                      <p class="mb-0 fs-3">My Profile</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-mail fs-6"></i>
                      <p class="mb-0 fs-3">My Account</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-list-check fs-6"></i>
                      <p class="mb-0 fs-3">My Task</p>
                    </a>
                    <a href="/enchanted_elegance/admin/logout" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <div class="container-fluid">
          <!-- Row 1 -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body p-4 p-md-5">
                <h2 class="mb-3 mb-md-3">Add New Admin</h2>
                <form id="adminAddForm" class="w-100" action="/enchanted_elegance/admin/add-admin" method="post">
                <div class="row g-3">                   
                    <div class="col-12">                   
                    <div class="form-floating">
                        <input type="text" class="form-control form-control-lg" id="nameInput" placeholder="Name" name="name" >
                        <label for="nameInput" class="required">Name</label>
                        <div id="nameError" class="error-message"></div>
                    </div>                      
                    </div>
                    <div class="col-6">                   
                    <div class="form-floating">
                        <input type="text" class="form-control form-control-lg" id="mobileInput" placeholder="Mobile" name="mobile" >
                        <label for="mobileInput" class="required">Mobile</label>
                        <div id="mobileError" class="error-message"></div>
                    </div>                     
                    </div>
                    <div class="col-6">
                    <div class="form-floating">
                        <input type="text" class="form-control form-control-lg" id="emailInput" placeholder="Email Address" name="email" >
                        <label for="emailInput" class="required">Email Address</label>
                        <div id="emailError" class="error-message"></div>
                    </div>
                    </div>
                    <div class="col-6">
                    <div class="form-floating">
                        <input type="password" class="form-control form-control-lg" id="passwordInput" placeholder="Password" name="password" >
                        <label for="passwordInput" class="required">Password</label>
                        <div id="passwordError" class="error-message"></div>
                    </div>
                    </div>
                    <div class="col-6">
                    <div class="form-floating">
                        <input type="password" class="form-control form-control-lg" id="confirmPasswordInput" placeholder="Password">
                        <label for="confirmPasswordInput" class="required">Confirm Password</label>
                        <div id="confirmPasswordError" class="error-message"></div>
                    </div>
                    </div>
                    <div class="mt-3">
                    <button type="submit" class="btn btn-primary py-2 rounded-2">
                        Save 
                    </button>
                    </div>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>  
    </div>
  </div>
  <script src="/enchanted_elegance/pages/admin/libs/jquery/dist/jquery.min.js"></script>
  <script src="/enchanted_elegance/pages/admin/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/sidebarmenu.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/app.min.js"></script>
  <script src="/enchanted_elegance/pages/admin/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="/enchanted_elegance/pages/admin/libs/simplebar/dist/simplebar.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/dashboard.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/alert.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/admin-add-form.js"></script>
</body>

</html>