package com.enchantedelegance.controllers.usermanagement;

import com.enchantedelegance.dao.usermanagement.UserDAO;
import com.enchantedelegance.models.usermanagement.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get form data
        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Validate input fields (basic validation)
        if (name == null || name.trim().isEmpty() ||
                mobile == null || mobile.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {

            resp.sendRedirect("pages/customer/register.jsp?error=All+fields+are+required");
            return;
        }

        // Check if email is already registered
        if (userDAO.getUserByEmail(email) != null) {
            resp.sendRedirect("pages/customer/register.jsp?error=Email+already+exists");
            return;
        }

        // Create a new user with auto-incremented ID
        int id = userDAO.getNextId();
        User user = new User(id, name, mobile, email, password);

        // Add user to file storage
        boolean isRegistered = userDAO.addUser(user);

        if (isRegistered) {
            // Redirect to login page after successful registration
            resp.sendRedirect("pages/customer/login.jsp?success=Registration+successful,+please+login");
        } else {
            // Stay on registration page if an error occurs
            resp.sendRedirect("pages/customer/register.jsp?error=Registration+failed,+try+again");
        }
    }
}
