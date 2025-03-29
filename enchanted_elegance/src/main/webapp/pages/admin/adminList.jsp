<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%
    Admin adminSession = (Admin) session.getAttribute("admin");
      if (adminSession == null) {
            response.sendRedirect("pages/admin/login.jsp"); // Redirect to the login page if not logged in
            return;
        }
%>

<html>
<head>
    <title>Admin List</title>
</head>
<body>
    <h1>Admin List</h1>
    <a href="../pages/admin/add-admin.jsp"> Add Admin</a>
    <br></br>
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
            List<Admin> admins = (List<Admin>) request.getAttribute("admins");
            if (admins != null && !admins.isEmpty()) {
                for (Admin admin : admins) {
        %>
        <tr>
            <td><%= admin.getId() %></td>
            <td><%= admin.getName() %></td>
            <td><%= admin.getMobile() %></td>
            <td><%= admin.getEmail() %></td>
            <td><%= admin.getPassword() %></td>
            <td>
                 <a href="../pages/admin/edit-admin-profile.jsp?id=<%= admin.getId() %>">Edit</a>
                 <form action="../admin/delete-account" method="post" style="display:inline;">
                     <input type="hidden" name="id" value="<%= admin.getId() %>">
                     <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                 </form>

            </td>

        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No admins found.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
