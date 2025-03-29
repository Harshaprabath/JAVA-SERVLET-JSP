<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Page</title>
</head>
<body>
    <form action="../../add-feedback" method="post">
        <h2>Feedback </h2>

        <div>
            <label>Name</label>
            <input type="text" name="name" placeholder="Name" value="<%= user.getName() %>" readonly>
        </div>
         <div>
            <label>Email</label>
            <input type="email" name="email" placeholder="Email" value="<%= user.getEmail() %>" readonly>
        </div>
        <div>
            <label >Mobile</label>
            <input type="text" name="mobile" placeholder="Mobile"  value="<%= user.getMobile() %>" readonly>
        </div>
        <div>
            <label >Message</label>
            <textarea name="message" cols="30" rows="5" placeholder="Write your feedback here..." required></textarea>
        </div>

        <div>
            <input type="submit" value="Send">
        </div>
    </form>
</body>
</html>