<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
      if (admin == null) {
            response.sendRedirect("pages/admin/login.jsp"); // Redirect to the login page if not logged in
            return;
        }
%>
<html>
<head>
    <title>User List</title>
</head>
<body>
    <h1>User List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Password</th>
            <th>Action</th>
        </tr>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (User user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getMobile() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPassword() %></td>
            <td>
                 <a href="pages/admin/edit-user-adminaccess.jsp?id=<%= user.getId() %>">Edit</a>
                 <form action="delete-account" method="post" style="display:inline;">
                     <input type="hidden" name="id" value="<%= user.getId() %>">
                     <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                 </form>

            </td>

        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No users found.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
