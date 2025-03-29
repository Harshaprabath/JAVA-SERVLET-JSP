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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Validate input
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            resp.sendRedirect("pages/customer/login.jsp?error=Email+and+password+are+required");
            return;
        }

        // Find user by email
        User user = userDAO.getUserByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            // Valid login: create session
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(30 * 60); // Session expires in 30 minutes

            // Redirect to profile page
            resp.sendRedirect("pages/customer/index.jsp?success=Login+successful");
        } else {
            // Invalid login: redirect to login page with error message
            resp.sendRedirect("pages/customer/login.jsp?error=Invalid+email+or+password");
        }
    }
}
