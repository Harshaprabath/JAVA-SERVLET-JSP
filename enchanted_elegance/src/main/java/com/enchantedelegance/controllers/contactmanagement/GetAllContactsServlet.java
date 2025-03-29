package com.enchantedelegance.controllers.contactmanagement;

import com.enchantedelegance.dao.contactmanagement.ContactDAO;
import com.enchantedelegance.models.adminmanagement.Admin;
import com.enchantedelegance.models.contactmanagement.Contact;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/contact-list")
public class GetAllContactsServlet extends HttpServlet {
    private ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("../pages/admin/login.jsp");
            return;
        }

        // Get all contact message from DAO
        List<Contact> contacts = contactDAO.getAllContacts();

        // Set all contact message as request attribute
        req.setAttribute("contacts", contacts);

        // Forward the request to contacts list.jsp
        req.getRequestDispatcher("../pages/admin/contact-list.jsp").forward(req, resp);
    }
}
