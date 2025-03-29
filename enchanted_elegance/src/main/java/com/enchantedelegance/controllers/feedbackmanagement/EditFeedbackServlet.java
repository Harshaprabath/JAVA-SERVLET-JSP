package com.enchantedelegance.controllers.feedbackmanagement;


import com.enchantedelegance.dao.feedbackmanagement.FeedbackDAO;
import com.enchantedelegance.models.adminmanagement.Admin;
import com.enchantedelegance.models.feedbackmanagement.Feedback;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/edit-feedback")
public class EditFeedbackServlet extends HttpServlet {
    private FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("pages/admin/login.jsp?error=Please+login+first");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String message = req.getParameter("message");
        String date = req.getParameter("date");
        boolean isPublish = Boolean.parseBoolean(req.getParameter("isPublish"));


        Feedback feedback = feedbackDAO.getFeedbackById(id);
        if (feedback != null) {
            feedback.setName(name);
            feedback.setEmail(email);
            feedback.setMobile(mobile);
            feedback.setMessage(message);
            feedback.setDate(date);
            feedback.setPublish(isPublish);

            if (feedbackDAO.updateFeedback(feedback)) {
               resp.sendRedirect("feedback-list?success=Booking+update+successful");
            } else {
                resp.sendRedirect("pages/admin/edit-feedback?error=Failed to update Booking");
            }
        } else {
            resp.sendRedirect("feedback-list?error=Booking not found");
        }
    }
}
