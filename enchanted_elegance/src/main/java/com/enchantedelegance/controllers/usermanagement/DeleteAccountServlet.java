
package com.enchantedelegance.controllers.usermanagement;

import com.enchantedelegance.dao.usermanagement.UserDAO;
import com.enchantedelegance.models.usermanagement.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/delete-account")
public class DeleteAccountServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User sessionUser = (User) session.getAttribute("user");

        // Check if user ID is provided in the request parameter
        String userIdParam = req.getParameter("id");
        int userId = -1;

        if (userIdParam != null && !userIdParam.isEmpty()) {
            try {
                userId = Integer.parseInt(userIdParam); // Use the ID from URL
            } catch (NumberFormatException e) {
                resp.sendRedirect("profile?error=Invalid user ID");
                return;
            }
        } else if (sessionUser != null) {
            userId = sessionUser.getId(); // Use session user ID
        }

        if (userId == -1) {
            resp.sendRedirect("profile?error=User ID not found");
            return;
        }

        // Perform deletion
        if (userDAO.deleteUserById(userId)) {
            // Invalidate session only if the session user deleted their own account
            if (sessionUser != null && sessionUser.getId() == userId) {
                session.invalidate();
                resp.sendRedirect("pages/customer/index.jsp?message=Account deleted successfully");
            } else {
                resp.sendRedirect("user-list?message=User deleted successfully");
            }
        } else {
            resp.sendRedirect("profile?error=Failed to delete account");
        }
    }
}
