package com.enchantedelegance.controllers.usermanagement;

import com.enchantedelegance.dao.usermanagement.UserDAO;
import com.enchantedelegance.models.usermanagement.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        // Ensure user is logged in before accessing profiles
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("pages/customer/login.jsp?error=Please+login+first");
            return;
        }

        String idParam = req.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            resp.sendRedirect("pages/customer/login.jsp?error=User+ID+is+required");
            return;
        }

        try {
            int userId = Integer.parseInt(idParam);
            User user = userDAO.getUserById(userId);

            if (user != null) {
                req.setAttribute("user", user);
                req.getRequestDispatcher("pages/customer/profile.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("pages/customer/login.jsp?error=User+not+found");
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect("pages/customer/login.jsp?error=Invalid+User+ID");
        }
    }
}
