package com.enchantedelegance.dao.adminmanagement;

import com.enchantedelegance.models.adminmanagement.Admin;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
    private static final String FILE_PATH =  "src/main/resources/data/adminmanagement/admins.txt"; // Updated file path
    private static final String DELIMITER = ","; // Delimiter for separating fields

    public AdminDAO() {
        ensureFileExists();
    }

    // Read all Admin from the text file
    public List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] adminData = line.split(DELIMITER);
                if (adminData.length == 5) { // Ensure all fields are present
                    Admin admin = new Admin(
                            Integer.parseInt(adminData[0]), // id
                            adminData[1], // name
                            adminData[2], // mobile
                            adminData[3], // email
                            adminData[4] // password
                    );
                    admins.add(admin);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return admins;
    }

    // Get Admin by ID
    public Admin getAdminById(int id) {
        for (Admin admin : getAllAdmins()) {
            if (admin.getId() == id) {
                return admin;
            }
        }
        return null;
    }

    // Get Admin by Email
    public Admin getAdminByEmail(String email) {
        for (Admin admin : getAllAdmins()) {
            if (admin.getEmail().equalsIgnoreCase(email)) {
                return admin;
            }
        }
        return null;
    }

    // Authenticate Admin (Check email and password)
    public boolean authenticateAdmin(String email, String password) {
        Admin admin = getAdminByEmail(email);
        return admin != null && admin.getPassword().equals(password); // Check password match
    }


    // Add a new admin to the text file
    public boolean addAdmin(Admin admin) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String adminLine = String.join(DELIMITER,
                    String.valueOf(admin.getId()),
                    admin.getName(),
                    admin.getMobile(),
                    admin.getEmail(),
                    admin.getPassword()
            );
            writer.write(adminLine);
            writer.newLine();
            return true; // Success
        } catch (IOException e) {
            e.printStackTrace();
            return false; // Error
        }
    }

    // Update an existing admins details
    public boolean updateAdmin(Admin updatedAdmin) {
        List<Admin> admins = getAllAdmins();
        boolean updated = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Admin admin : admins) {
                if (admin.getId() == updatedAdmin.getId()) {
                    admin = updatedAdmin;
                    updated = true;
                }

                // Write updated admin data back to the file
                writer.write(admin.getId() + DELIMITER + admin.getName() + DELIMITER +
                        admin.getMobile() + DELIMITER + admin.getEmail() + DELIMITER +
                        admin.getPassword());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return updated;
    }

    // Delete admin by ID
    public boolean deleteAdminById(int id) {
        List<Admin> admins = getAllAdmins();
        boolean deleted = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Admin admin : admins) {
                if (admin.getId() != id) {
                    writer.write(admin.getId() + DELIMITER + admin.getName() + DELIMITER +
                            admin.getMobile() + DELIMITER + admin.getEmail() + DELIMITER +
                            admin.getPassword());
                    writer.newLine();
                } else {
                    deleted = true; // Admin found and skipped (deleted)
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
        List<Admin> admins = getAllAdmins();
        if (admins.isEmpty()) {
            return 1;
        }
        return admins.get(admins.size() - 1).getId() + 1;
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

    public void defaultAdmin() {
        List<Admin> admins = getAllAdmins();
        if (admins.isEmpty()) {
            Admin defaultAdmin = new Admin(1, "Admin", "1234567890", "admin@example.com", "admin123");
            addAdmin(defaultAdmin);
        }
    }

}