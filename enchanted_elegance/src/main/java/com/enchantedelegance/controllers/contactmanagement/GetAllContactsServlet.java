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

        String filterIdParam = req.getParameter("filterId");

        int filterId = 1;
        if (filterIdParam != null && !filterIdParam.isEmpty()) {
            filterId = Integer.parseInt(filterIdParam);
        }

        List<Contact> contacts= null;
        // Get all feedbacks from DAO
        if(filterId==1){
            contacts = contactDAO.getAllContacts();
        }else if(filterId==2){
            contacts = contactDAO.getAllPendingContact();
        }else if(filterId==3){
            contacts = contactDAO.getAllProcessingContact();
        }else if(filterId==4){
            contacts = contactDAO.getAllCompletedContact();
        }

        // Set all contact message as request attribute
        req.setAttribute("contacts", contacts);

        // Forward the request to contacts list.jsp
        req.getRequestDispatcher("../pages/admin/contact-list.jsp?filterId="+filterId).forward(req, resp);
    }
}
