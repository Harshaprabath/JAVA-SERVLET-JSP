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

@WebServlet("/add-booking")
public class AddBookingServlet extends HttpServlet {
    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get form data
        int userId = Integer.parseInt(req.getParameter("userId"));
        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String date = req.getParameter("date");
        String treatment = req.getParameter("treatment");
        String note = req.getParameter("note");

        HttpSession session = req.getSession();
        User sessionUser = (User) session.getAttribute("user");

        if (sessionUser == null) {
            resp.sendRedirect("pages/customer/login.jsp?error=Please+login+first");
            return;
        }

        // Validate input fields (basic validation)
        if (name == null || name.trim().isEmpty() ||
                mobile == null || mobile.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                date == null || date.trim().isEmpty() ||
                treatment == null || treatment.trim().isEmpty()) {

            resp.sendRedirect("pages/customer/booking.jsp?error=All+fields+are+required");
            return;
        }
        if(note == null || note.trim().isEmpty()){
            note = "No Note" ;
        }

        // Create a new booking with auto-incremented ID
        int id = bookingDAO.getNextId();
        Booking booking = new Booking(id,userId ,name, mobile,date, email,treatment,note);

        // Add booking to file storage
        boolean isAdded = bookingDAO.addBooking(booking);

        if (isAdded) {
            // Redirect to booking list after successful adding
            resp.sendRedirect("booking-list?success=Booking+successful");
        } else {
            // Stay on add booking page if an error occurs
            resp.sendRedirect("pages/customer/booking.jsp?error=Booking+failed,+try+again");
        }
    }
}
