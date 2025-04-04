package com.enchantedelegance.controllers.contactmanagement;


import com.enchantedelegance.dao.contactmanagement.ContactDAO;
import com.enchantedelegance.models.contactmanagement.Contact;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/add-contact")
public class AddContactServlet extends HttpServlet {
    private final ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get form data
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        // Initial status
        String status = "pending";

        // Validate input fields (basic validation)
        if (name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                mobile == null || mobile.trim().isEmpty() ||
                subject == null || subject.trim().isEmpty() ||
                message == null || message.trim().isEmpty()) {

            resp.sendRedirect("pages/customer/contact.jsp?error=All+fields+are+required");
            return;
        }

        // Create a new contact with auto-incremented ID
        int id = contactDAO.getNextId();
        Contact contact = new Contact(id, name, email, mobile, subject, message, status);

        // Add contact to file storage
        boolean isAdded = contactDAO.addContact(contact);

        if (isAdded) {
            // Redirect to contact page after successful sent
            resp.sendRedirect("pages/customer/contact.jsp?success=Send+successful");
        } else {
            // Stay on contact page if an error occurs
            resp.sendRedirect("pages/customer/contact.jsp?error=Send+failed,+try+again");
        }
    }
}
