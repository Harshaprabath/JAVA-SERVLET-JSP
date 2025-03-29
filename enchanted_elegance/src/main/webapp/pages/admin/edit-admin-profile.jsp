<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%@ page import="com.enchantedelegance.dao.adminmanagement.AdminDAO" %>

<%
     Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("../../admin?error=Please login first");
            return;
        }

    AdminDAO adminDAO = new AdminDAO();

    // Get admin ID from URL
    String adminIdParam = request.getParameter("id");

    if (adminIdParam != null && !adminIdParam.isEmpty()) {
        int adminId = Integer.parseInt(adminIdParam);
        admin = adminDAO.getAdminById(adminId); // Fetch admin from DB
    }

    // If no admin from URL, use session adminId
    if (admin == null) {
        admin = (Admin) session.getAttribute("admin");
    }

    // If no user found, redirect to login
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    //cancel button back to admin list or admin profile
     Admin sessionAdmin = (Admin) session.getAttribute("admin");
     int otherAdminId = Integer.parseInt(adminIdParam);
%>

<html>
<head>
    <title>Edit Admin Profile</title>
</head>
<body>
    <h2>Edit Admin Profile</h2>

    <form action="/enchanted_elegance/admin/edit-admin" method="post">
        <input type="hidden" name="id" value="<%= admin.getId() %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= admin.getName() %>" required><br>

        <label>Mobile:</label>
        <input type="text" name="mobile" value="<%= admin.getMobile() %>" required><br>

        <label>Email:</label>
        <input type="email" name="email" value="<%= admin.getEmail() %>" required><br>

        <label>Password:</label>
        <input type="password" name="password"><br>

        <button type="submit">Save Changes</button>
    </form>





     <% if (sessionAdmin.getId() == otherAdminId) { %>
              <p><a href="/enchanted_elegance/admin/profile?id=<%= admin.getId() %>">Cancel</a></p>
     <% } %>
     <% if (sessionAdmin.getId() != otherAdminId) { %>
                 <p><a href="/enchanted_elegance/admin/admin-list">Cancel</a></p>
     <% } %>

</body>
</html>
