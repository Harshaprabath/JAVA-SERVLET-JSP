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

<html>
<head>
    <title>Edit User Profile</title>
</head>
<body>
    <h2>Edit User Details</h2>

    <form action="/enchanted_elegance/edit-user" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= user.getName() %>" required><br>

        <label>Mobile:</label>
        <input type="text" name="mobile" value="<%= user.getMobile() %>" required><br>

        <label>Email:</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required><br>

        <label>Password:</label>
        <input type="password" name="password"><br>

        <button type="submit">Save Changes</button>
    </form>

    <p><a href="/enchanted_elegance/user-list">Cancel</a></p>
</body>
</html>
