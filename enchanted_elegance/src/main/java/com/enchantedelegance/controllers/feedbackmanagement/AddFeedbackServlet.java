package com.enchantedelegance.controllers.feedbackmanagement;

import com.enchantedelegance.dao.feedbackmanagement.FeedbackDAO;
import com.enchantedelegance.models.feedbackmanagement.Feedback;
import com.enchantedelegance.models.usermanagement.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

@WebServlet("/add-feedback")
public class AddFeedbackServlet extends HttpServlet {
    private final FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User sessionUser = (User) session.getAttribute("user");

        // Ensure admin is logged in before accessing
        if (session == null || sessionUser == null) {
            resp.sendRedirect("pages/customer/login.jsp?error=Please+login+first");
            return;
        }


        // Get form data
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String message = req.getParameter("message");

        // Create a Date object for the current system time
        Date currentDate = new Date();

        // Create a SimpleDateFormat object to format the date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        // Set the time zone to Asia/Colombo (Sri Lanka)
        dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Colombo"));

        // Format the current date according to the Sri Lankan time zone
        String date = dateFormat.format(currentDate);

        // Initial status
        boolean isPublish = false;


        // Validate input fields (basic validation)
        if (name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                mobile == null || mobile.trim().isEmpty() ||
                message == null || message.trim().isEmpty()) {

            resp.sendRedirect("pages/customer/feedback.jsp?error=All+fields+are+required");
            return;
        }

        // Create a new contact with auto-incremented ID
        int id = feedbackDAO.getNextId();
        Feedback feedback = new Feedback(id, name, email, mobile,message,date,isPublish);

        // Add feedback to file storage
        boolean isAdded = feedbackDAO.addFeedback(feedback);

        if (isAdded) {
            // Redirect to feedback page after successful sent
            resp.sendRedirect("pages/customer/feedback.jsp??success=Send+successful");
        } else {
            // Stay on feedback page if an error occurs
            resp.sendRedirect("pages/customer/feedback.jsp?error=Send+failed,+try+again");
        }
    }
}
