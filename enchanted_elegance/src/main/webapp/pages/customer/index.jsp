<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%@ page import="com.enchantedelegance.models.offermanagement.Offer" %>
<%@ page import="com.enchantedelegance.models.feedbackmanagement.Feedback" %>
<%@ page import="com.enchantedelegance.dao.offermanagement.OfferDAO" %>
<%@ page import="com.enchantedelegance.dao.feedbackmanagement.FeedbackDAO" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("user");
%>

<%
    OfferDAO offerDAO = new OfferDAO();

    // Get all offers
    List<Offer> offers = offerDAO.getAllOffers();

    // Ensure the list is never null
    if (offers == null) {
        offers = new java.util.ArrayList<>();
    }

    FeedbackDAO feedbackDAO = new FeedbackDAO();

    // Get all published feedbacks
    List<Feedback> feedbacks = feedbackDAO.getFeedbackPublished();

    // Ensure the list is never null
    if (feedbacks == null) {
        feedbacks = new java.util.ArrayList<>();
    }
%>

<html>
<head>
    <title>Enchanted Elegance Customer</title>
</head>
<body>
    <h2>Enchanted Elegance Customer</h2>
    <p><a href="/enchanted_elegance/pages/customer/booking.jsp">Book Online</a></p>
    <p><a href="/enchanted_elegance/pages/customer/contact.jsp">Contact</a></p>
    <p><a href="/enchanted_elegance/pages/customer/feedback.jsp">Feedback</a></p>

    <%
        if (user != null) {  // If user is logged in
    %>
        <p>Welcome, <strong><%= user.getName() %></strong>!</p>
        <p><a href="/enchanted_elegance/booking-list">Booking List</a></p>
        <p><a href="/enchanted_elegance/profile?id=<%= user.getId() %>">Profile</a> |
        <a href="/enchanted_elegance/logout">Logout</a></p>
    <%
        } else { // If user is not logged in
    %>
        <p><a href="/enchanted_elegance/pages/customer/login.jsp">Login</a> |
        <a href="/enchanted_elegance/pages/customer/register.jsp">Register</a></p>
    <%
        }
    %>



<%
        // Check if offers are available
        if (offers.isEmpty()) {
    %>
        <div></div>
    <%
        } else {
    %>
        <h3>Offers</h3>
        <ul>
        <%
            for (Offer offer : offers) {
        %>

            <li><img style="width:200px;height: 100px;object-fit: cover;" src="<%= offer.getImage() != null ? offer.getImage() : "" %>" alt="Offer Image">
            <strong><%= offer.getTitle() %></strong>: <%= offer.getDiscount() %> <%= offer.getDescription() %></li>
        <%
            }
        %>
        </ul>
    <%
        }
    %>








    <%
        // Check if published feedback is available
        if (feedbacks.isEmpty()) {
    %>
        <div></div>
    <%
        } else {
    %>
        <h3>Customer Feedback</h3>
        <ul>
        <%
            for (Feedback feedback : feedbacks) {
        %>

            <li><strong><%= feedback.getName() %></strong>: <%= feedback.getMessage() %> (<%= feedback.getDate() %>)</li>
        <%
            }
        %>
        </ul>
    <%
        }
    %>
</body>
</html>
