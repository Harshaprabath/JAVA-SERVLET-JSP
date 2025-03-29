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
    <title>Booking Page</title>
</head>
<body>
    <form action="../../add-booking" method="post">
        <h2>Book Now</h2>
        <input type="hidden"name="userId" value="<%= user.getId() %>">
        <div>
            <label>Name</label>
            <input type="text" name="name" placeholder="Name" value="<%= user.getName() %>" required>
        </div>

        <div>
            <label >Mobile</label>
            <input type="text" name="mobile" placeholder="Mobile" value="<%= user.getMobile() %>" required>
        </div>

        <div>
            <label>Email</label>
            <input type="email" name="email" placeholder="Email"  value="<%= user.getEmail() %>" required>
        </div>

        <div>
            <label>Date</label>
            <input type="date"  name="date" placeholder="Date of visit" required>
        </div>



        <div>
            <label>Service You Want</label>
            <select name="treatment" required>
                <option value="haircut">Hair Cut</option>
                <option value="coloring">Hair Coloring</option>
                <option value="shave">Shave</option>
                <option value="conditioning">Hair Conditioning</option>
                <option value="other">Other</option>
            </select>
        </div>

        <div>
            <label >Notes</label>
            <textarea name="note" cols="30" rows="5" placeholder="Write your notes or questions here..."></textarea>
        </div>

        <div>
            <input type="submit" value="Send">
        </div>
    </form>
</body>
</html>