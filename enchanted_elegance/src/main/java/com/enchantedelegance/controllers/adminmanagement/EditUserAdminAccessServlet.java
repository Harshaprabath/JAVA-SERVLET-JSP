package com.enchantedelegance.controllers.adminmanagement;

import com.enchantedelegance.dao.usermanagement.UserDAO;
import com.enchantedelegance.models.usermanagement.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/edit-user")
public class EditUserAdminAccessServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userIdParam = req.getParameter("id");
        User sessionUser = (User) session.getAttribute("user");

        User user = null;
        boolean isFromURL = false;

        // 1️⃣ Check if user ID comes from URL
        if (userIdParam != null && !userIdParam.isEmpty()) {
            int userId = Integer.parseInt(userIdParam);
            user = userDAO.getUserById(userId);
            isFromURL = true;
        }

        // 2️⃣ If no user from URL, take session user
        if (user == null) {
            user = sessionUser;
        }

        // 3️⃣ If no user found, redirect to login
        if (user == null) {
            resp.sendRedirect("pages/customer/login.jsp");
            return;
        }

        // 4️⃣ Retrieve form data
        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        user.setName(name);
        user.setMobile(mobile);
        user.setEmail(email);

        // Update password only if provided
        if (password != null && !password.isEmpty()) {
            user.setPassword(password);
        }

        boolean updateSuccess = userDAO.updateUser(user);

        //for navigate list current page
        String pageParam = req.getParameter("page");
        int pageNo =1;
        if(pageParam != null && !pageParam.isEmpty() ){

            pageNo =Integer.parseInt(pageParam);

        }

        // 5️⃣ Handle redirection based on success or failure
        if (isFromURL) {
            if (updateSuccess) {
                resp.sendRedirect("user-list?message=Edit successful&page="+pageNo);
            } else {
                resp.sendRedirect("pages/customer/edit-profile.jsp?id=" + user.getId() + "&error=Edit failed&page="+pageNo);
            }
        } else {
            if (updateSuccess) {
                session.setAttribute("user", user); // Update session user
                resp.sendRedirect("profile?id=" + user.getId());
            } else {
                resp.sendRedirect("pages/customer/edit-profile.jsp?error=Edit failed");
            }
        }
    }
}
