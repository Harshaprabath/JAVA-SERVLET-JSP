<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
      if (admin == null) {
            response.sendRedirect("login.jsp"); // Redirect to the login page if not logged in
            return;
        }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Admin</title>
</head>
<body>
    <h1>Add New Admin</h1>
    <form action="../../admin/add-admin" method="post">
        Name: <input type="text" name="name" required><br><br>
        Mobile: <input type="text" name="mobile" required><br><br>
        Email: <input type="email" name="email" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <input type="submit" value="Add">
    </form>
    <br>
    <a href="../../admin">Cancel</a>
</body>
</html>