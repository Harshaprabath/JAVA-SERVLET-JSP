package com.enchantedelegance.controllers.adminmanagement;

import com.enchantedelegance.dao.adminmanagement.AdminDAO;
import com.enchantedelegance.models.adminmanagement.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/login")
public class LoginServlet extends HttpServlet {
    private final AdminDAO adminDAO = new AdminDAO();

    //If no admins exist, a default admin (admin@example.com / admin123) is created
    public LoginServlet() { adminDAO.defaultAdmin();}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Validate input
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            resp.sendRedirect("../pages/admin/login.jsp?error=Email+and+password+are+required");
            return;
        }

        // Find user by email
        Admin admin = adminDAO.getAdminByEmail(email);

        if (admin != null && admin.getPassword().equals(password)) {
            // Valid login: create session
            HttpSession session = req.getSession();
            session.setAttribute("admin", admin);
            session.setMaxInactiveInterval(30 * 60); // Session expires in 30 minutes

            // Redirect to profile page
            resp.sendRedirect("../pages/admin/index.jsp?success=Login+successful");
        } else {
            // Invalid login: redirect to login page with error message
            resp.sendRedirect("../pages/admin/login.jsp?error=Invalid+email+or+password");
        }
    }
}
