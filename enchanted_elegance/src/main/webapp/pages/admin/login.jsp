<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin != null) {
        response.sendRedirect("/enchanted_elegance/pages/admin/index.jsp?error=Already login");
        return;
    }

    // Check for error messages from the servlet
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Login &mdash; Enchanted Elegance</title>
  <link rel="shortcut icon" type="image/png" href="images/logos/favicon.png" />
  <link rel="stylesheet" href="css/styles.min.css" />
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="/enchanted_elegance" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <h4><span class="text-primary">E</span>nchanted <span class="text-primary">E</span>legance</h4>
                </a>
                <p class="text-center">Admin Login</p>  
                <% if (request.getParameter("error") != null) { %>
                    <div class="server-error text-center"><%= request.getParameter("error") %></div>
                <% } %>                      
                   <form id="loginForm" action="../../admin/login" method="post">
                       <div class="mb-3">
                           <label for="email" class="form-label required">Email</label>
                           <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                           <span id="emailError" class="error-message"></span>
                       </div>
                       
                       <div class="mb-4">
                           <label for="password" class="form-label required">Password</label>
                           <input type="password" class="form-control" id="password" name="password">
                           <span id="passwordError" class="error-message"></span>
                       </div>
                       <div class="d-flex align-items-center justify-content-between mb-4">
                           <div class="form-check">
                               <input class="form-check-input primary" type="checkbox" value="" id="rememberDevice">
                               <label class="form-check-label text-dark" for="rememberDevice">
                                   Remember this Device
                               </label>
                           </div>
                           <a class="text-primary fw-bold" href="./index.html">Forgot Password?</a>
                       </div>
                       <button type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Sign In</button>
                   </form>             
                 </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="libs/jquery/dist/jquery.min.js"></script>
  <script src="libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/login-form.js"></script>
  <script src="js/alert.js"></script>
</body>

</html>