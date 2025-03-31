<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%@ page import="com.enchantedelegance.models.feedbackmanagement.Feedback" %>
<%@ page import="com.enchantedelegance.dao.feedbackmanagement.FeedbackDAO" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("../../admin?error=Please login first");
        return;
    }

    String feedbackIdParam = request.getParameter("id");
    Feedback feedback = new Feedback();
    FeedbackDAO feedbackDAO = new FeedbackDAO();

    if (feedbackIdParam != null && !feedbackIdParam.isEmpty()) {
        int feedbackId = Integer.parseInt(feedbackIdParam);
        feedback = feedbackDAO.getFeedbackById(feedbackId);
    }

    // Fix sessionAdmin and otherAdminId
    Admin sessionAdmin = (Admin) session.getAttribute("admin");
    int otherAdminId = 1; // Replace with correct logic
%>

<html>
<head>
    <title>Edit Feedback or Publish</title>
</head>
<body>
    <h2>Edit Feedback or Publish</h2>

    <form action="/enchanted_elegance/admin/edit-feedback" method="post">
        <input type="hidden" name="id" value="<%= feedback.getId() %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= feedback.getName() %>" required><br>

        <label>Email:</label>
        <input type="email" name="email" value="<%= feedback.getEmail() %>" required><br>

        <label>Mobile:</label>
        <input type="text" name="mobile" value="<%= feedback.getMobile() %>" required><br>

        <label>Message:</label>
        <textarea name="message" cols="30" rows="10"  placeholder="Write your feedback here..."><%= feedback.getMessage() %></textarea>
        <br>

        <label>Date:</label>
        <input type="date" name="date" value="<%= feedback.getDate() %>" required><br>

        <label>Publication</label>
        <select name="isPublish">
            <option value="false" <%= !feedback.isPublish() ? "selected" : "" %>>Not Publish</option>
            <option value="true" <%= feedback.isPublish() ? "selected" : "" %>>Publish</option>
        </select><br><br>

        <button type="submit">Save Changes</button>
    </form>

    <% if (sessionAdmin != null && sessionAdmin.getId() != otherAdminId) { %>
        <p><a href="/enchanted_elegance/admin/feedback-list">Cancel</a></p>
    <% } %>

</body>
</html>
