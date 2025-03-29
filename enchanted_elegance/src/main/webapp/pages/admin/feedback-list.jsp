<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%@ page import="com.enchantedelegance.models.feedbackmanagement.Feedback" %>
<%@ page import="java.util.List" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback List</title>
    <style>
        .message-cell {
            max-width: 300px;
            word-wrap: break-word;
            white-space: normal;
        }
        #status-filter {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Feedback List</h1>

    <div id="publications-filter">
        <label for="filter-select">Filter by publication: </label>
        <select id="filter-select">
            <option value="all">All</option>
            <option value="true">Published</option>
            <option value="false">Non-Published</option>
        </select>
    </div>

    <table border="1" id="feedbacks-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Message</th>
                <th>Date</th>
                <th>Publish Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
                if (feedbacks != null && !feedbacks.isEmpty()) {
                    for (Feedback feedback : feedbacks) {
            %>
            <tr data-publications="<%= feedback.isPublish() %>">
                <td><%= feedback.getId() %></td>
                <td><%= feedback.getName() %></td>
                <td><%= feedback.getEmail() %></td>
                <td><%= feedback.getMobile() %></td>
                <td class="message-cell"><%= feedback.getMessage() %></td>
                <td><%= feedback.getDate() %></td>
                <td><%= feedback.isPublish() %></td>
                <td>
                  <a href="../pages/admin/edit-feedback.jsp?id=<%= feedback.getId() %>">Edit</a>
                    <form action="delete-feedback" method="post" style="display:inline;">
                         <input type="hidden" name="id" value="<%= feedback.getId() %>">
                         <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                   </form>
                </td>

            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="9">No feedback found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const filterSelect = document.getElementById('filter-select');
            const feedbackRows = document.querySelectorAll('#feedbacks-table tbody tr');

            filterSelect.addEventListener('change', function() {
                const selectedIsPublish = this.value;

                feedbackRows.forEach(row => {
                    const rowPublication = row.getAttribute('data-publications');

                    if (selectedIsPublish === 'all' || rowPublication === selectedIsPublish) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>
</html>