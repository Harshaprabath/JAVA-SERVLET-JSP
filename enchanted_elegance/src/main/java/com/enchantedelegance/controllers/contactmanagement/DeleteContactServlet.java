
package com.enchantedelegance.controllers.contactmanagement;

import com.enchantedelegance.dao.contactmanagement.ContactDAO;
import com.enchantedelegance.models.adminmanagement.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/delete-contact")
public class DeleteContactServlet extends HttpServlet {
    private ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        // Ensure admin is logged in before accessing
        if (session == null || sessionAdmin == null) {
            resp.sendRedirect("pages/admin/login.jsp?error=Please+login+first");
            return;
        }

        // Check if contact ID is provided in the request parameter
        String contactIdParam = req.getParameter("id");

        int contactId = -1;

        if (contactIdParam != null && !contactIdParam.isEmpty()) {
            try {
                contactId = Integer.parseInt(contactIdParam); // Use the ID from URL
            } catch (NumberFormatException e) {
                resp.sendRedirect("contact-list?error=Invalid contact ID");
                return;
            }
        }

        if (contactId == -1) {
            resp.sendRedirect("contact-list?error=contact ID not found");
            return;
        }

        // Perform deletion
        if (contactDAO.deleteContactById(contactId)) {
            if(sessionAdmin != null) {
                resp.sendRedirect("contact-list?message=contact deleted successfully");
            }
        } else {
            resp.sendRedirect("contact-list?error=Failed to delete contact");
        }
    }
}
