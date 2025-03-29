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

@WebServlet("/admin/profile")
public class ProfileServlet extends HttpServlet {
    private final AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        // Ensure user is logged in before accessing profiles
        if (session == null || session.getAttribute("admin") == null) {
            resp.sendRedirect("../admin?error=Please+login+first");
            return;
        }

        String idParam = req.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            resp.sendRedirect("../admin?error=User+ID+is+required");
            return;
        }

        try {
            int adminId = Integer.parseInt(idParam);
            Admin admin = adminDAO.getAdminById(adminId);

            if (admin != null) {
                req.setAttribute("user", admin);
                req.getRequestDispatcher("../pages/admin/profile.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("../admin?error=User+not+found");
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect("../admin?error=Invalid+User+ID");
        }
    }
}
