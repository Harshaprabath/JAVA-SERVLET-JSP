package com.enchantedelegance.controllers.offermanagement;

import com.enchantedelegance.dao.offermanagement.OfferDAO;
import com.enchantedelegance.models.adminmanagement.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/delete-offer")
public class DeleteOfferServlet extends HttpServlet {
    private OfferDAO offerDAO = new OfferDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("pages/admin/login.jsp?error=Please+login+first");
            return;
        }

        int offerId;
        try {
            offerId = Integer.parseInt(req.getParameter("id"));
        } catch (NumberFormatException e) {
            resp.sendRedirect("offer-list?error=Invalid offer ID");
            return;
        }

        //page number for navigate req came page
        String pageParam = req.getParameter("page");
        int pageNo=1;
        if (pageParam != null && !pageParam.isEmpty()) {
            pageNo = Integer.parseInt(pageParam);
        }

        if (offerDAO.deleteOfferById(offerId)) {
            resp.sendRedirect("offer-list?message=Offer deleted successfully&page="+pageNo);
        } else {
            resp.sendRedirect("offer-list?error=Failed to delete offer&page="+pageNo);
        }
    }
}
