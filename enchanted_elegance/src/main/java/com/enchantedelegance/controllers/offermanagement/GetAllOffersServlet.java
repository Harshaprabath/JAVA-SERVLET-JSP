package com.enchantedelegance.controllers.offermanagement;

import com.enchantedelegance.dao.offermanagement.OfferDAO;
import com.enchantedelegance.models.adminmanagement.Admin;
import com.enchantedelegance.models.offermanagement.Offer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/offer-list")
public class GetAllOffersServlet extends HttpServlet {
    private OfferDAO offerDAO = new OfferDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("../pages/admin/login.jsp");
            return;
        }

        // Get all offers from DAO
        List<Offer> offers = offerDAO.getAllOffers();

        // Set all offers as request attribute
        req.setAttribute("offers", offers);

        // Forward the request to offers list.jsp
        req.getRequestDispatcher("../pages/admin/offer-list.jsp").forward(req, resp);
    }
}
