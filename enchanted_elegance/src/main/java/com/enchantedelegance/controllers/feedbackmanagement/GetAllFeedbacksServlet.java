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
import java.util.List;

@WebServlet("/admin/feedback-list")
public class GetAllFeedbacksServlet extends HttpServlet {
    private FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("../pages/admin/login.jsp");
            return;
        }

        // Get all feedbacks from DAO
        List<Feedback> feedbacks = feedbackDAO.getAllFeedbacks();

        // Set all feedbacks as request attribute
        req.setAttribute("feedbacks", feedbacks);

        // Forward the request to feedbacks list.jsp
        req.getRequestDispatcher("../pages/admin/feedback-list.jsp").forward(req, resp);
    }
}
