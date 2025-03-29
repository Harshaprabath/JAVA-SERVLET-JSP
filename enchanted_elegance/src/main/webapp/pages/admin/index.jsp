<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
      if (admin == null) {
            response.sendRedirect("login.jsp"); // Redirect to the login page if not logged in
            return;
        }
%>

<html>
<head>
    <title>Enchanted Elegance Admin</title>
</head>
<body>
    <h2>Enchanted Elegance Admin</h2>

    <%
        if (admin != null) {  // If user is logged in
    %>
        <a href= "../../user-list">User List</a>
        <br>
        <a href= "../../admin/admin-list">Admin List</a>
        <br>
        <a href= "../../admin/booking-list">Booking List</a>
        <br>
        <a href= "../../admin/contact-list">Contact List</a>
        <br>
        <a href= "../../admin/feedback-list">Feedback List</a>
        <br>
        <a href= "../../admin/offer-list">Offer List</a>

        <p>Welcome, <strong><%= admin.getName() %></strong>!</p>
        <p><a href="/enchanted_elegance/admin/profile?id=<%= admin.getId() %>">Profile</a> |
        <a href="/enchanted_elegance/admin/logout">Logout</a></p>
    <%
        } else { // If user is not logged in
    %>
        <p><a href="../../admin">Login</a> |
        <a href="/enchanted_elegance/pages/customer/register.jsp">Register</a></p>
    <%
        }
    %>

</body>
</html>
