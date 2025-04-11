
package com.enchantedelegance.controllers.feedbackmanagement;

import com.enchantedelegance.dao.feedbackmanagement.FeedbackDAO;
import com.enchantedelegance.models.adminmanagement.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/delete-feedback")
public class DeleteFeedbackServlet extends HttpServlet {
    private FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        // Ensure admin is logged in before accessing
        if (session == null || sessionAdmin == null) {
            resp.sendRedirect("pages/admin/login.jsp?error=Please+login+first");
            return;
        }

        //page number and filter id for navigate req came page
        String pageParam = req.getParameter("page");
        String filterIdParam = req.getParameter("filterId");

        int pageNo=1;
        if (pageParam != null && !pageParam.isEmpty()) {
            pageNo = Integer.parseInt(pageParam);
        }
        int filterId = 1;
        if (filterIdParam != null && !filterIdParam.isEmpty()) {
            filterId = Integer.parseInt(filterIdParam);
        }

        // get feedback ID is provided in the request parameter
        String feedbackIdParam = req.getParameter("id");

        int feedbackId = -1;

        if (feedbackIdParam != null && !feedbackIdParam.isEmpty()) {
            try {
                feedbackId = Integer.parseInt(feedbackIdParam); // Use the ID from URL
            } catch (NumberFormatException e) {
                resp.sendRedirect("feedback-list?error=Invalid feedback ID&page="+pageNo+"&filterId="+filterId);
                return;
            }
        }

        if (feedbackId == -1) {
            resp.sendRedirect("feedback-list?error=feedback ID not found&page="+pageNo+"&filterId="+filterId);
            return;
        }

        // Perform deletion
        if (feedbackDAO.deleteFeedbackById(feedbackId)) {
            if(sessionAdmin != null) {
                resp.sendRedirect("feedback-list?message=Feedback deleted successfully&page="+pageNo+"&filterId="+filterId);
            }
        } else {
            resp.sendRedirect("feedback-list?error=Failed to delete feedback&page="+pageNo+"&filterId="+filterId);
        }
    }
}
