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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Offer</title>
    <style>
        #imagePreview {
            margin-top: 20px;
            max-width: 20%;
            height: auto;
            display: none;
        }
    </style>
</head>
<body>
    <h2>Add New Offer</h2>

    <% String error = request.getParameter("error"); %>
    <% String success = request.getParameter("success"); %>

    <% if (error != null) { %>
        <p style="color: red;"><%= error %></p>
    <% } %>

    <% if (success != null) { %>
        <p style="color: green;"><%= success %></p>
    <% } %>

    <form action="../../admin/add-offer" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" required><br>

        <label for="discount">Discount:</label>
        <input type="text" name="discount" id="discount" required><br>

        <label for="description">Description:</label>
        <textarea name="description" id="description" required></textarea><br>

        <label for="imageUrl">Image URL:</label>
        <input type="text" name="imageUrl" id="imageUrl" required oninput="loadImagePreview()"><br>

        <!-- Preview Image -->
        <img id="imagePreview" src="" alt="Image Preview"><br>

        <button type="submit">Add Offer</button>
    </form>

    <a href="offer-list.jsp">Back to Offer List</a>

    <script>
        // JavaScript function to load and display the image preview
        function loadImagePreview() {
            var imageUrl = document.getElementById('imageUrl').value;
            var imagePreview = document.getElementById('imagePreview');

            if (imageUrl) {
                // Set the image source to the URL entered in the input field
                imagePreview.src = imageUrl;
                imagePreview.style.display = 'block';  // Show the image preview
            } else {
                imagePreview.style.display = 'none';  // Hide the image preview if no URL is provided
            }
        }
    </script>
</body>
</html>
