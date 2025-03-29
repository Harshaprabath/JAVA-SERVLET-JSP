package com.enchantedelegance.controllers.offermanagement;

import com.enchantedelegance.dao.offermanagement.OfferDAO;
import com.enchantedelegance.models.adminmanagement.Admin;
import com.enchantedelegance.models.offermanagement.Offer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/add-offer")
public class AddOfferServlet extends HttpServlet {
    private final OfferDAO offerDAO = new OfferDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("../pages/admin/login.jsp");
            return;
        }

        // Get form data
        String title = req.getParameter("title");
        String discount = req.getParameter("discount");
        String description = req.getParameter("description");
        String imageURL = req.getParameter("imageUrl"); // Image URL input

        // Validate input fields (basic validation)
        if (title == null || title.trim().isEmpty() ||
                discount == null || discount.trim().isEmpty() ||
                description == null || description.trim().isEmpty() ||
                imageURL == null || imageURL.trim().isEmpty()) {
            resp.sendRedirect("../pages/admin/add-offer.jsp?error=All+fields+are+required");
            return;
        }

        // Create a new Offer with auto-incremented ID
        int id = offerDAO.getNextId();
        Offer offer = new Offer(id, imageURL, title, discount, description); // Set image URL

        // Add offer to file storage
        boolean isAdded = offerDAO.addOffer(offer);

        if (isAdded) {
            resp.sendRedirect("../admin/offer-list?success=Offer+added+successfully");
        } else {
            resp.sendRedirect("../pages/admin/add-offer.jsp?error=Failed+to+add+offer");
        }
    }
}
