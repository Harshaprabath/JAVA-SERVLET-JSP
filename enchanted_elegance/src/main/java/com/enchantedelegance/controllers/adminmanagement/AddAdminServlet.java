package com.enchantedelegance.controllers.adminmanagement;

import com.enchantedelegance.dao.adminmanagement.AdminDAO;
import com.enchantedelegance.models.adminmanagement.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/add-admin")
public class AddAdminServlet extends HttpServlet {
    private final AdminDAO adminDAO = new AdminDAO();

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

            resp.sendRedirect("../pages/admin/add-admin.jsp?error=All+fields+are+required");
            return;
        }

        // Check if email is already registered
        if (adminDAO.getAdminByEmail(email) != null) {
            resp.sendRedirect("../pages/admin/add-admin.jsp?error=Email+already+exists");
            return;
        }

        // Create a new admin with auto-incremented ID
        int id = adminDAO.getNextId();
        Admin admin = new Admin(id, name, mobile, email, password);

        // Add admin to file storage
        boolean isAdded = adminDAO.addAdmin(admin);

        if (isAdded) {
            // Redirect to admin list page after successful registration
            resp.sendRedirect("admin-list?success=Registration+successful");
        } else {
            // Stay on admin page if an error occurs
            resp.sendRedirect("../pages/admin/add-admin.jsp?error=Registration+failed,+try+again");
        }
    }
}
