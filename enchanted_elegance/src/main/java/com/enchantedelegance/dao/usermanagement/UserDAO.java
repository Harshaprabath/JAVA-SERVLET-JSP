package com.enchantedelegance.dao.usermanagement;

import com.enchantedelegance.models.usermanagement.User;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private static final String FILE_PATH =  "src/main/resources/data/usermanagement/users.txt"; // Updated file path
    private static final String DELIMITER = ","; // Delimiter for separating fields

    public UserDAO() {
        ensureFileExists();
    }

    // Read all users from the text file
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] userData = line.split(DELIMITER);
                if (userData.length == 5) { // Ensure all fields are present
                    User user = new User(
                            Integer.parseInt(userData[0]), // id
                            userData[1], // name
                            userData[2], // mobile
                            userData[3], // email
                            userData[4] // password
                    );
                    users.add(user);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Get user by ID
    public User getUserById(int id) {
        for (User user : getAllUsers()) {
            if (user.getId() == id) {
                return user;
            }
        }
        return null; // User not found
    }

    // Get user by Email
    public User getUserByEmail(String email) {
        for (User user : getAllUsers()) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                return user;
            }
        }
        return null; // User not found
    }

    // Authenticate user (Check email and password)
    public boolean authenticateUser(String email, String password) {
        User user = getUserByEmail(email);
        return user != null && user.getPassword().equals(password); // Check password match
    }


    // Add a new user to the text file
    public boolean addUser(User user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String userLine = String.join(DELIMITER,
                    String.valueOf(user.getId()),
                    user.getName(),
                    user.getMobile(),
                    user.getEmail(),
                    user.getPassword()
            );
            writer.write(userLine);
            writer.newLine();
            return true; // Success
        } catch (IOException e) {
            e.printStackTrace();
            return false; // Error
        }
    }
    // Update an existing user's details
    public boolean updateUser(User updatedUser) {
        List<User> users = getAllUsers();
        boolean updated = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {
                if (user.getId() == updatedUser.getId()) {
                    user = updatedUser;  // Update user info
                    updated = true;
                }

                // Write updated user data back to the file
                writer.write(user.getId() + DELIMITER + user.getName() + DELIMITER +
                        user.getMobile() + DELIMITER + user.getEmail() + DELIMITER +
                        user.getPassword());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return updated;
    }

    // Delete user by ID
    public boolean deleteUserById(int id) {
        List<User> users = getAllUsers();
        boolean deleted = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {
                if (user.getId() != id) {
                    writer.write(user.getId() + DELIMITER + user.getName() + DELIMITER +
                            user.getMobile() + DELIMITER + user.getEmail() + DELIMITER +
                            user.getPassword());
                    writer.newLine();
                } else {
                    deleted = true; // User found and skipped (deleted)
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
        List<User> users = getAllUsers();
        if (users.isEmpty()) {
            return 1;
        }
        return users.get(users.size() - 1).getId() + 1;
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