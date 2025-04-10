package com.enchantedelegance.controllers.bookingmanagement;

import com.enchantedelegance.dao.bookingmanagement.BookingDAO;
import com.enchantedelegance.models.bookingmanagement.Booking;
import com.enchantedelegance.models.usermanagement.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/booking-list")
public class GetAllBookingsByUserIdServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User sessionUser = (User) session.getAttribute("user");

        if (sessionUser == null) {
            resp.sendRedirect("pages/customer/login.jsp?error=Please login first");
            return;
        }

        // Get all bookings by user ID from DAO
        List<Booking> bookings = bookingDAO.getAllBookingsByUserId(Integer.parseInt(String.valueOf(sessionUser.getId())));

        // Set all user booking as request attribute
        req.setAttribute("bookings", bookings);

        // Forward the request to booking-List.jsp
        req.getRequestDispatcher("pages/customer/booking-list.jsp").forward(req, resp);
    }
}
