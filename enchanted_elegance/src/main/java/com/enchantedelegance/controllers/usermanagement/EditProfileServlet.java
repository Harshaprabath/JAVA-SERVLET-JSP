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

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User sessionUser = (User) session.getAttribute("user");

        if (sessionUser == null) {
            resp.sendRedirect("pages/customer/login.jsp?error=Please+login+first");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Keep the old password if the new password is empty
        User user = userDAO.getUserById(id);
        if (user != null) {
            user.setName(name);
            user.setMobile(mobile);
            user.setEmail(email);
            if (!password.isEmpty()) {
                user.setPassword(password);
            }

            if (userDAO.updateUser(user)) {
                session.setAttribute("user", user);  // Update session
                resp.sendRedirect("profile?id=" + user.getId());
            } else {
                resp.sendRedirect("edit-profile.jsp?error=Failed to update profile");
            }
        } else {
            resp.sendRedirect("edit-profile.jsp?error=User not found");
        }
    }
}
