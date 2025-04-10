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

@WebServlet("/admin/edit-admin")
public class EditAdminProfileServlet extends HttpServlet {
    private AdminDAO adminDAO = new AdminDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        int sessionAdminId = sessionAdmin.getId();

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Admin admin = adminDAO.getAdminById(id);

        //for navigate list current page
        String pageParam = req.getParameter("page");
        int pageNo =1;
        if(pageParam != null && !pageParam.isEmpty() ){

            pageNo =Integer.parseInt(pageParam);

        }

        if (sessionAdminId == id) { // check : admin update done by himself
            if (admin != null) {
                admin.setName(name);
                admin.setMobile(mobile);
                admin.setEmail(email);
                if (!password.isEmpty()) {
                    admin.setPassword(password);
                }
            }
            if (adminDAO.updateAdmin(admin)) {
                session.setAttribute("admin", admin);  // Update session
                resp.sendRedirect("profile?id=" + admin.getId()+"&success=Profile+update+successful");
            } else {
                resp.sendRedirect("pages/admin/edit-admin-profile.jsp?id=" + admin.getId() +"&error=Failed to update profile");
            }

        } else { // check : admin update done by another admin
            if (admin != null) {
                admin.setName(name);
                admin.setMobile(mobile);
                admin.setEmail(email);
                if (!password.isEmpty()) {
                    admin.setPassword(password);
                }
            }
            if (adminDAO.updateAdmin(admin)) {
                resp.sendRedirect("admin-list?success=Update+successful&page="+pageNo );
            } else {
                resp.sendRedirect("pages/admin/edit-admin-profile.jsp?id=" + id +"&error=Failed to update admin&page="+pageNo);
            }

        }


    }


}
