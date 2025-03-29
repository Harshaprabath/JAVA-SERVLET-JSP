<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("pages/customer/login.jsp?error=Please login first");
        return;
    }

%>


<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h1>User Profile</h1>
    <p><strong>ID:</strong> <%= user.getId() %></p>
    <p><strong>Name:</strong> <%= user.getName() %></p>
    <p><strong>Mobile:</strong> <%= user.getMobile() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>

    <% if (session.getAttribute("user") != null) { %>
        <a href="/enchanted_elegance/pages/customer/edit-profile.jsp">Edit Profile</a>
    <% } %>
    <% if (session.getAttribute("user") != null) { %>
        <form action="/enchanted_elegance/delete-account" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            <button type="submit" style="color: red;">Delete Account</button>
        </form>
    <% } %>


    <a href="logout">Logout</a>
</body>
</html>
