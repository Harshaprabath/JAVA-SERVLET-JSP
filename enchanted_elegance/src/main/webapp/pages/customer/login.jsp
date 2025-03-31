<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("/enchanted_elegance/pages/customer/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Login &mdash; Enchanted Elegance</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/bootstrap.min.css">
  <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/style.css">

</head>

<body>
  <div class="site-wrap">
    <div class="bg-light login-register-bg">
      <div class="container">
        <div class="row d-flex justify-content-center align-items-center min-vh-100">
          <div class="col-md-6 mt-2 mb-2">
            <form action="/enchanted_elegance/login" id="loginForm" method="post" class="p-5 bg-white">
              <h2 class="mb-4 site-section-heading">Login</h2>

              <% if (request.getParameter("error") != null) { %>
                <div class="server-error"><%= request.getParameter("error") %></div>
              <% } %>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="email">Email</label>
                  <input type="email" id="email" name="email" class="form-control" placeholder="Email" required>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="password">Password</label>
                  <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <button type="submit" class="btn btn-primary py-2 px-4 text-white">Login</button>
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12 text-center">
                  <p>Don't have an account? <a href="/enchanted_elegance/pages/customer/register.jsp" class="text-primary">Register here</a></p>
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
  <script src="/enchanted_elegance/pages/customer/js/main.js"></script>

  <script src="/enchanted_elegance/pages/customer/js/components/alert.js"></script>
  
  </script>
</body>
</html>