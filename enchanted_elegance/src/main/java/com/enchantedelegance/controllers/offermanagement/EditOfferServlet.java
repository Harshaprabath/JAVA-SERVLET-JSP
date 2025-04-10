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

@WebServlet("/admin/edit-offer")
public class EditOfferServlet extends HttpServlet {
    private OfferDAO offerDAO = new OfferDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("pages/admin/login.jsp?error=Please+login+first");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String discount = req.getParameter("discount");
        String description = req.getParameter("description");
        String imageURL = req.getParameter("imageUrl"); // Fetch the image URL directly from the form

        //page number for navigate req came page
        String pageParam = req.getParameter("page");
        int pageNo=1;
        if (pageParam != null && !pageParam.isEmpty()) {
            pageNo = Integer.parseInt(pageParam);
        }

        Offer offer = offerDAO.getOfferById(id);
        if (offer != null) {
            offer.setTitle(title);
            offer.setDiscount(discount);
            offer.setDescription(description);

            if (imageURL != null && !imageURL.trim().isEmpty()) {
                offer.setImage(imageURL); // Set the image URL if provided
            }

            if (offerDAO.updateOffer(offer)) { // No need to pass InputStream anymore
                resp.sendRedirect("offer-list?success=Offer+update+successful&page="+pageNo);
            } else {
                resp.sendRedirect("pages/admin/edit-offer?error=Failed to update Offer&page="+pageNo);
            }
        } else {
            resp.sendRedirect("offer-list?error=Offer+not+found&page="+pageNo);
        }
    }
}
