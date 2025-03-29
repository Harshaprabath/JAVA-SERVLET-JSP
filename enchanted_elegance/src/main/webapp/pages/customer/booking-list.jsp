<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%@ page import="com.enchantedelegance.models.bookingmanagement.Booking" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }

%>
<html>
<head>
    <title>Booking List</title>
</head>
<body>
    <h1>Booking List</h1>
    <table border="1">
        <tr>
              <th>ID</th>
              <th>userID</th>
              <th>Name</th>
              <th>Mobile</th>
              <th>Email</th>
              <th>Treatment</th>
              <th>Booking Date</th>
              <th>Note</th>
              <th>Action</th>
        </tr>
        <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if (bookings != null && !bookings.isEmpty()) {
                for (Booking booking : bookings) {
        %>
        <tr>
            <td><%= booking.getId() %></td>
            <td><%= booking.getUserId() %></td>
            <td><%= booking.getName() %></td>
            <td><%= booking.getMobile() %></td>
            <td><%= booking.getEmail() %></td>
            <td><%= booking.getTreatment() %></td>
            <td><%= booking.getDate() %></td>
            <td><%= booking.getNote() %></td>
            <td>
                 <a href="pages/customer/edit-booking.jsp?id=<%= booking.getId() %>">Edit</a>
                 <form action="delete-booking" method="post" style="display:inline;">
                     <input type="hidden" name="id" value="<%= booking.getId() %>">
                     <input type="hidden" name="from" value="user">
                     <button type="submit" onclick="return confirm('Are you sure?')">Remove</button>
                 </form>

            </td>

        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="9">No bookings found.</td>
        </tr>
        <% } %>
    </table>
    <p><a href="/enchanted_elegance/pages/customer/booking.jsp">Book Online</a></p>
</body>
</html>
