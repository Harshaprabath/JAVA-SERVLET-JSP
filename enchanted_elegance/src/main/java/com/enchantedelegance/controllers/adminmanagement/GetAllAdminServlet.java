package com.enchantedelegance.controllers.adminmanagement;

import com.enchantedelegance.dao.adminmanagement.AdminDAO;
import com.enchantedelegance.models.adminmanagement.Admin;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/admin-list")
public class GetAllAdminServlet extends HttpServlet {
    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get all admins from DAO
        List<Admin> admins = adminDAO.getAllAdmins();

        // Set admins as request attribute
        req.setAttribute("admins", admins);

        // Forward the request to adminList.jsp
        req.getRequestDispatcher("../pages/admin/adminList.jsp").forward(req, resp);
    }
}
