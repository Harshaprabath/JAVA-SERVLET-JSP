<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("/enchanted_elegance/pages/customer/index.jsp");
        return;
    }
    
    // Check for error messages from the servlet
    String errorMessage = (String) request.getAttribute("errorMessage");
    String name = request.getParameter("name") != null ? request.getParameter("name") : "";
    String mobile = request.getParameter("mobile") != null ? request.getParameter("mobile") : "";
    String email = request.getParameter("email") != null ? request.getParameter("email") : "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register &mdash; Enchanted Elegance</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/bootstrap.min.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/style.css">
    <%-- form validation --%>
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/auth.css">
    
</head>
<body>
    <div class="site-wrap">
        <div class="bg-light login-register-bg">
            <div class="container">
                <div class="row d-flex justify-content-center align-items-center min-vh-100">
                    <div class="col-md-8 mt-2 mb-2">
                        <form id="registerForm" class="form-container" action="/enchanted_elegance/register" method="post" novalidate>
                            <h2 class="mb-4 site-section-heading">Register</h2>
                            
                            <% if (errorMessage != null) { %>
                                <div class="alert alert-danger" role="alert">
                                    <%= errorMessage %>
                                </div>
                            <% } %>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <label class="text-black" for="name">Name</label>
                                    <input type="text" id="name" name="name" class="form-control" 
                                           placeholder="Full Name" required value="<%= name %>">
                                    <small class="error-message" id="nameError"></small>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-6">
                                    <label class="text-black" for="email">Email</label>
                                    <input type="email" id="email" name="email" class="form-control" 
                                           placeholder="Email" required value="<%= email %>">
                                    <small class="error-message" id="emailError"></small>
                                </div>

                                <div class="col-md-6">
                                    <label class="text-black" for="mobile">Mobile</label>
                                    <input type="text" id="mobile" name="mobile" class="form-control" 
                                           placeholder="Mobile Number" required value="<%= mobile %>">
                                    <small class="error-message" id="mobileError"></small>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-6">
                                    <label class="text-black" for="password">Password</label>
                                    <input type="password" id="password" name="password" class="form-control" 
                                           placeholder="Password" required>
                                    <small class="error-message" id="passwordError"></small>
                                </div>

                                <div class="col-md-6">
                                    <label class="text-black" for="confirmPassword">Confirm Password</label>
                                    <input type="password" id="confirmPassword" class="form-control" 
                                           placeholder="Confirm Password" required>
                                    <small class="error-message" id="confirmPasswordError"></small>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <input type="submit" value="Register" class="btn btn-primary py-2 px-4 text-white">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-12 text-center">
                                    <p>Already have an account? 
                                        <a href="/enchanted_elegance/pages/customer/login.jsp" class="text-primary">Login here</a>
                                    </p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/enchanted_elegance/pages/customer/js/jquery-3.3.1.min.js"></script>
    <script src="/enchanted_elegance/pages/customer/js/bootstrap.min.js"></script>

    <script src="/enchanted_elegance/pages/customer/js/components/alert.js"></script>

    <script src="/enchanted_elegance/pages/customer/js/components/register.js"></script>
</body>
</html>