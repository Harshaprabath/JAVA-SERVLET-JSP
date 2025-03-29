package com.enchantedelegance.controllers.bookingmanagement;

import com.enchantedelegance.dao.bookingmanagement.BookingDAO;
import com.enchantedelegance.models.adminmanagement.Admin;
import com.enchantedelegance.models.bookingmanagement.Booking;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/booking-list")
public class GetAllBookingsServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Admin sessionAdmin = (Admin) session.getAttribute("admin");

        if (sessionAdmin == null) {
            resp.sendRedirect("../pages/admin/login.jsp");
            return;
        }

        // Get all bookings from DAO
        List<Booking> bookings = bookingDAO.getAllBookings();

        // Set all booking as request attribute
        req.setAttribute("bookings", bookings);

        // Forward the request to booking-ist.jsp
        req.getRequestDispatcher("../pages/admin/booking-list.jsp").forward(req, resp);
    }
}
