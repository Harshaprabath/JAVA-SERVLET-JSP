
package com.enchantedelegance.controllers.bookingmanagement;

import com.enchantedelegance.dao.bookingmanagement.BookingDAO;
import com.enchantedelegance.models.adminmanagement.Admin;
import com.enchantedelegance.models.usermanagement.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete-booking")
public class DeleteBookingServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        //from where request come admin or user
        User sessionUser = (User) session.getAttribute("user");
        Admin sessionAdmin = (Admin) session.getAttribute("admin");



        // Check if booking ID is provided in the request parameter
        String bookingIdParam = req.getParameter("id");
        String fromParam = req.getParameter("from"); //admin or user
        String pageParam = req.getParameter("page"); //page number

        int bookingId = -1;
        int pageNo=1;

        if (pageParam != null && !pageParam.isEmpty()) {
            pageNo = Integer.parseInt(pageParam);
        }

        if (bookingIdParam != null && !bookingIdParam.isEmpty()) {
            try {
                bookingId = Integer.parseInt(bookingIdParam); // Use the ID from URL
            } catch (NumberFormatException e) {
                resp.sendRedirect("booking-list?error=Invalid booking ID&page="+pageNo);
                return;
            }
        }

        if (bookingId == -1) {
            resp.sendRedirect("booking-list?error=Booking ID not found&page="+pageNo);
            return;
        }

        // Perform deletion
        if (bookingDAO.deleteBookingById(bookingId)) {
            // Invalidate session only if the session user deleted their own account
            if (sessionUser != null && fromParam.equalsIgnoreCase("user") ) {
                resp.sendRedirect("booking-list?message=Booking deleted successfully&page="+pageNo);
            }else if(sessionAdmin != null && fromParam.equalsIgnoreCase("admin")) {
                resp.sendRedirect("admin/booking-list?message=Booking deleted successfully&page="+pageNo);
            }
        } else {
            resp.sendRedirect("booking-list?error=Failed to delete booking&page="+pageNo);
        }
    }
}
