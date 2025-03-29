package com.enchantedelegance.dao.bookingmanagement;

import com.enchantedelegance.models.bookingmanagement.Booking;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private static final String FILE_PATH =  "src/main/resources/data/bookingmanagement/booking.txt"; // Updated file path
    private static final String DELIMITER = ","; // Delimiter for separating fields

    public BookingDAO() {
        ensureFileExists();
    }

    // Read all booking from the text file
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] bookingData = line.split(DELIMITER);
                if (bookingData.length == 8) { // Ensure all fields are present
                    Booking booking = new Booking(
                            Integer.parseInt(bookingData[0]), // id
                            Integer.parseInt(bookingData[1]), // user id
                            bookingData[2], // name
                            bookingData[3], // mobile
                            bookingData[4], // date
                            bookingData[5], // email
                            bookingData[6], // treatment
                            bookingData[7] // note
                    );
                    bookings.add(booking);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    // Get all bookings by userID
    public List<Booking> getAllBookingsByUserId(int userId) {
        List<Booking> bookings = new ArrayList<>();
        for (Booking booking : getAllBookings()) {
            if (booking.getUserId() == userId) {
                bookings.add(booking);
            }
        }
        return bookings;
    }

    // Get booking by ID
    public Booking getBookingById(int id) {
        for (Booking booking : getAllBookings()) {
            if (booking.getId() == id) {
                return booking;
            }
        }
        return null; // booking not found
    }


    // Add a new booking to the text file
    public boolean addBooking(Booking booking) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String bookingLine = String.join(DELIMITER,
                    String.valueOf(booking.getId()),
                    String.valueOf(booking.getUserId()),
                    booking.getName(),
                    booking.getMobile(),
                    booking.getDate(),
                    booking.getEmail(),
                    booking.getTreatment(),
                    booking.getNote()
            );
            writer.write(bookingLine);
            writer.newLine();
            return true; // Success
        } catch (IOException e) {
            e.printStackTrace();
            return false; // Error
        }
    }
    // Update an existing booking's details
    public boolean updateBooking(Booking updatedBooking) {
        List<Booking> bookings = getAllBookings();
        boolean updated = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Booking booking : bookings) {
                if (booking.getId() == updatedBooking.getId()) {
                    booking = updatedBooking;  // Update booking info
                    updated = true;
                }

                // Write updated booking data back to the file
                writer.write(booking.getId() + DELIMITER + booking.getUserId() + DELIMITER +
                        booking.getName() + DELIMITER + booking.getMobile() + DELIMITER +
                        booking.getDate() + DELIMITER + booking.getEmail() + DELIMITER +
                        booking.getTreatment() + DELIMITER + booking.getNote() );
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return updated;
    }

    // Delete booking by ID
    public boolean deleteBookingById(int id) {
        List<Booking> bookings = getAllBookings();
        boolean deleted = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Booking booking : bookings) {
                if (booking.getId() != id) {
                    writer.write(booking.getId() + DELIMITER + booking.getUserId() + DELIMITER +
                            booking.getName() + DELIMITER + booking.getMobile() + DELIMITER +
                            booking.getDate() + DELIMITER + booking.getEmail() + DELIMITER +
                            booking.getTreatment() + DELIMITER + booking.getNote());
                    writer.newLine();
                } else {
                    deleted = true; // Booking found and skipped (deleted)
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return deleted;
    }


    // Generate a new auto-incremented ID
    public int getNextId() {
        List<Booking> bookings = getAllBookings();
        if (bookings.isEmpty()) {
            return 1;
        }
        return bookings.get(bookings.size() - 1).getId() + 1;
    }

    private void ensureFileExists() {
        File file = new File(FILE_PATH);
        try {
            file.getParentFile().mkdirs(); // Ensure the directory exists
            if (!file.exists()) {
                file.createNewFile(); // Create the file if it doesn't exist
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}