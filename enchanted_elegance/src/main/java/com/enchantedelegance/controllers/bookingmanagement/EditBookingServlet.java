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

@WebServlet("/edit-booking")
public class EditBookingServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();

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
        String date = req.getParameter("date");
        String treatment = req.getParameter("treatment");
        String note = req.getParameter("note");

        if(note == null || note.trim().isEmpty()){
            note = "No Note" ;
        }

        Booking booking = bookingDAO.getBookingById(id);
        if (booking != null) {
            booking.setName(name);
            booking.setMobile(mobile);
            booking.setEmail(email);
            booking.setDate(date);
            booking.setTreatment(treatment);
            booking.setNote(note);

            if (bookingDAO.updateBooking(booking)) {
               resp.sendRedirect("booking-list?success=Booking+update+successful");
            } else {
                resp.sendRedirect("pages/customer/edit-booking?error=Failed to update Booking");
            }
        } else {
            resp.sendRedirect("booking-list?error=Booking not found");
        }
    }
}
