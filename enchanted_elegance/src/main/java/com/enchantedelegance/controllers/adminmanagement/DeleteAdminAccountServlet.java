
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

@WebServlet("/admin/delete-account")
public class DeleteAdminAccountServlet extends HttpServlet {
    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        // Check if admin ID is provided in the request parameter
        String adminIdParam = req.getParameter("id");
        int adminId = -1;

        if (adminIdParam != null && !adminIdParam.isEmpty()) {
            try {
                adminId = Integer.parseInt(adminIdParam); // Use the ID from URL
            } catch (NumberFormatException e) {
                resp.sendRedirect("../admin/profile?error=Invalid user ID");
                return;
            }
        } else if (sessionAdmin != null) {
            adminId = sessionAdmin.getId(); // Use session user ID
        }

        if (adminId == -1) {
            resp.sendRedirect("../admin/admin-list?error=Admin ID not found");
            return;
        }

        // Perform deletion
        if (adminDAO.deleteAdminById(adminId)) {
            // Invalidate session only if the session user deleted their own account
            if (sessionAdmin != null && sessionAdmin.getId() == adminId) {
                session.invalidate();
                resp.sendRedirect("../admin/profile?message=Account deleted successfully");
            } else {
                resp.sendRedirect("../admin/admin-list?message=Admin deleted successfully");
            }
        } else {
            resp.sendRedirect("../admin/profile?error=Failed to delete account");
        }
   }
}
