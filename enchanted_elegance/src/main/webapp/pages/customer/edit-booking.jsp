<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%@ page import="com.enchantedelegance.models.bookingmanagement.Booking" %>
<%@ page import="com.enchantedelegance.dao.bookingmanagement.BookingDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }

    // Get Booking ID from URL
    String bookingIdParam = request.getParameter("id");

    Booking booking = new Booking();
    BookingDAO bookingDAO = new BookingDAO();

    if (bookingIdParam != null && !bookingIdParam.isEmpty()) {
        int bookingId = Integer.parseInt(bookingIdParam);
        booking = bookingDAO.getBookingById(bookingId); // Fetch booking from DB
    }
%>

<html>
<head>
    <title>Edit Booking</title>
</head>
<body>
    <h2>Edit Booking</h2>

    <form action="/enchanted_elegance/edit-booking" method="post">

        <input type="hidden" name="id" value="<%= booking.getId() %>">
        <div>
            <label>Name</label>
            <input type="text" name="name" placeholder="Name" value="<%= booking.getName() %>" required>
        </div>

        <div>
            <label >Mobile</label>
            <input type="text" name="mobile" placeholder="Mobile" value="<%= booking.getMobile() %>" required>
        </div>

        <div>
            <label>Email</label>
            <input type="email" name="email" placeholder="Email"  value="<%= booking.getEmail() %>" required>
        </div>

        <div>
            <label>Date</label>
            <input type="date"  name="date" placeholder="Date of visit" value="<%= booking.getDate() %>" required>
        </div>



        <div>
            <label>Service You Want</label>
            <select name="treatment" required>
                <option value="haircut" <%= "haircut".equals(booking.getTreatment()) ? "selected" : "" %>>Hair Cut</option>
                <option value="coloring" <%= "coloring".equals(booking.getTreatment()) ? "selected" : "" %>>Hair Coloring</option>
                <option value="shave" <%= "shave".equals(booking.getTreatment()) ? "selected" : "" %>>Shave</option>
                <option value="conditioning" <%= "conditioning".equals(booking.getTreatment()) ? "selected" : "" %>>Hair Conditioning</option>
                <option value="other" <%= "other".equals(booking.getTreatment()) ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <div>
            <label >Notes</label>
            <textarea name="note" cols="30" rows="5"  placeholder="Write your notes or questions here..."><%= booking.getNote() %></textarea>
        </div>

        <div>
            <input type="submit" value="Send">
        </div>
    </form>

    <p><a href="/enchanted_elegance/booking-list">Cancel</a></p>
</body>
</html>
