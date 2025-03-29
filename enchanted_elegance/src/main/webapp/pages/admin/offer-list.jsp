<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%@ page import="com.enchantedelegance.models.offermanagement.Offer" %>
<%@ page import="java.util.List" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Offer List</title>
    <style>
        .offer-image {
            width: 100px;
            height: 100px;
            object-fit: cover; /* Ensures the image fits perfectly without distortion */
            border-radius: 5px; /* Optional: Gives rounded corners */
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
             background-color: #fff;
             border: 1px solid #ddd;
             text-align: center;
        }
        th {
            background-color: #f2f2f2;
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
    </style>
</head>
<body>

    <h1>Offer List</h1>

    <a href="../pages/admin/add-offer.jsp">Add New Offer</a>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Title</th>
                <th>Discount</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Offer> offers = (List<Offer>) request.getAttribute("offers");
                if (offers != null && !offers.isEmpty()) {
                    for (Offer offer : offers) {
            %>
            <tr>
                <td><%= offer.getId() %></td>
                <td>
                    <img src="<%= offer.getImage() %>" alt="Offer Image" class="offer-image">
                </td>
                <td><%= offer.getTitle() %></td>
                <td><%= offer.getDiscount() %></td>
                <td><%= offer.getDescription() %></td>
                <td>
                    <a href="../pages/admin/edit-offer.jsp?id=<%= offer.getId() %>">Edit</a>
                    <form action="delete-offer" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= offer.getId() %>">
                        <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">No offers found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>
