package com.enchantedelegance.controllers.usermanagement;

import com.enchantedelegance.dao.usermanagement.UserDAO;
import com.enchantedelegance.models.usermanagement.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user-list")
public class GetAllUsersServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get all users from DAO
        List<User> users = userDAO.getAllUsers();

        // Set users as request attribute
        req.setAttribute("users", users);

        // Forward the request to userList.jsp
        req.getRequestDispatcher("pages/admin/userList.jsp").forward(req, resp);
    }
}
