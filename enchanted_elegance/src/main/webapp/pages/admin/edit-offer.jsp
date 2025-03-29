<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%@ page import="com.enchantedelegance.models.offermanagement.Offer" %>
<%@ page import="com.enchantedelegance.dao.offermanagement.OfferDAO" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp?error=Please+login+first");
        return;
    }

    String offerIdParam = request.getParameter("id");
    OfferDAO offerDAO = new OfferDAO();
    Offer offer = null;

    if (offerIdParam != null && !offerIdParam.isEmpty()) {
        int offerId = Integer.parseInt(offerIdParam);
        offer = offerDAO.getOfferById(offerId);
    }

    if (offer == null) {
        response.sendRedirect("offer-list?error=Offer+not+found");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Offer</title>
    <style>
        #imagePreview {
            margin-top: 20px;
            max-width: 20%;
            height: auto;
            display: <%= (offer.getImage() != null && !offer.getImage().isEmpty()) ? "block" : "none" %>;
        }
    </style>
</head>
<body>
    <h2>Edit Offer</h2>

    <% String error = request.getParameter("error"); %>
    <% String success = request.getParameter("success"); %>

    <% if (error != null) { %>
        <p style="color: red;"><%= error %></p>
    <% } %>

    <% if (success != null) { %>
        <p style="color: green;"><%= success %></p>
    <% } %>

    <form action="../../admin/edit-offer" method="post">
        <input type="hidden" name="id" value="<%= offer.getId() %>">

        <label for="title">Title:</label>
        <input type="text" name="title" id="title" value="<%= offer.getTitle() %>" required><br>

        <label for="discount">Discount:</label>
        <input type="text" name="discount" id="discount" value="<%= offer.getDiscount() %>" required><br>

        <label for="description">Description:</label>
        <textarea name="description" id="description" required><%= offer.getDescription() %></textarea><br>

        <label for="imageUrl">Image URL:</label>
        <input type="text" name="imageUrl" id="imageUrl" value="<%= offer.getImage() != null ? offer.getImage() : "" %>" oninput="loadImagePreview()"><br>

        <!-- Image Preview -->
        <img id="imagePreview" src="<%= offer.getImage() != null ? offer.getImage() : "" %>" alt="Image Preview"><br>

        <button type="submit">Update Offer</button>
    </form>

    <a href="../../admin/offer-list">Back to Offer List</a>

    <script>
        function loadImagePreview() {
            var imageUrl = document.getElementById('imageUrl').value;
            var imagePreview = document.getElementById('imagePreview');

            if (imageUrl) {
                imagePreview.src = imageUrl;
                imagePreview.style.display = 'block';
            } else {
                imagePreview.style.display = 'none';
            }
        }
    </script>
</body>
</html>
