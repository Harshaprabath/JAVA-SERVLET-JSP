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

@WebServlet("/admin/edit-contact")
public class EditContactServlet extends HttpServlet {
    private ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("pages/admin/login.jsp?error=Please+login+first");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        String status = req.getParameter("status");

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

        Contact contact = contactDAO.getContactById(id);
        if (contact != null) {
            contact.setStatus(status);

            if (contactDAO.updateContact(contact)) {
               resp.sendRedirect("contact-list?success=Booking+update+successful&page="+pageNo+"&filterId="+filterId);
            } else {
                resp.sendRedirect("contact-list??error=Failed to update Booking&page="+pageNo+"&filterId="+filterId);
            }
        } else {
            resp.sendRedirect("contact-list?error=Booking not found&page="+pageNo+"&filterId="+filterId);
        }
    }
}
