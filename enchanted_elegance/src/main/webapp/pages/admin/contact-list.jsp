<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%@ page import="com.enchantedelegance.models.contactmanagement.Contact" %>
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
    <title>Contact List</title>
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
    <h1>Contact Messages List</h1>

    <div id="status-filter">
        <label for="filter-select">Filter by Status: </label>
        <select id="filter-select">
            <option value="all">All</option>
            <option value="pending">Pending</option>
            <option value="processing">Processing</option>
            <option value="completed">Completed</option>
        </select>
    </div>

    <table border="1" id="contacts-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Contact> contacts = (List<Contact>) request.getAttribute("contacts");
                if (contacts != null && !contacts.isEmpty()) {
                    for (Contact contact : contacts) {
            %>
            <tr data-status="<%= contact.getStatus() %>">
                <td><%= contact.getId() %></td>
                <td><%= contact.getName() %></td>
                <td><%= contact.getEmail() %></td>
                <td><%= contact.getMobile() %></td>
                <td><%= contact.getSubject() %></td>
                <td class="message-cell"><%= contact.getMessage() %></td>
                <td>
                    <form action="./edit-contact" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= contact.getId() %>">
                        <select name="status" required onchange="this.form.submit()">
                            <option value="pending" <%= "pending".equals(contact.getStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="processing" <%= "processing".equals(contact.getStatus()) ? "selected" : "" %>>Processing</option>
                            <option value="completed" <%= "completed".equals(contact.getStatus()) ? "selected" : "" %>>Completed</option>
                        </select>
                    </form>
                </td>
                <td>
                    <form action="./delete-contact" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= contact.getId() %>">
                        <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="9">No Contact message found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const filterSelect = document.getElementById('filter-select');
            const contactRows = document.querySelectorAll('#contacts-table tbody tr');

            filterSelect.addEventListener('change', function() {
                const selectedStatus = this.value;

                contactRows.forEach(row => {
                    const rowStatus = row.getAttribute('data-status');

                    if (selectedStatus === 'all' || rowStatus === selectedStatus) {
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