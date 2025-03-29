<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("../admin?error=Please login first");
        return;
    }

%>


<html>
<head>
    <title>Admin Profile</title>
</head>
<body>
    <h1>Admin Profile</h1>
    <p><strong>ID:</strong> <%= admin.getId() %></p>
    <p><strong>Name:</strong> <%= admin.getName() %></p>
    <p><strong>Mobile:</strong> <%= admin.getMobile() %></p>
    <p><strong>Email:</strong> <%= admin.getEmail() %></p>

    <% if (session.getAttribute("admin") != null) { %>
        <a href="/enchanted_elegance/pages/admin/edit-admin-profile.jsp?id=<%= admin.getId() %>">Edit Profile</a>
    <% } %>
    <% if (session.getAttribute("admin") != null) { %>
        <form action="/enchanted_elegance/admin/delete-account" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
            <input type="hidden" name="id" value="<%= admin.getId() %>">
            <button type="submit" style="color: red;">Delete Account</button>
        </form>
    <% } %>


    <a href="../admin/logout">Logout</a>
</body>
</html>
