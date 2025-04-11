package com.enchantedelegance.dao.contactmanagement;

import com.enchantedelegance.models.contactmanagement.Contact;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {
    private static final String FILE_PATH =  "src/main/resources/data/contactmanagement/contact.txt"; // Updated file path
    private static final String DELIMITER = ","; // Delimiter for separating fields

    public ContactDAO() {
        ensureFileExists();
    }

    // Read all contact message from the text file
    public List<Contact> getAllContacts() {
        List<Contact> contacts = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] contactData = line.split(DELIMITER);
                if (contactData.length == 7) { // Ensure all fields are present
                    Contact contact = new Contact(
                            Integer.parseInt(contactData[0]), // id
                            contactData[1], // name
                            contactData[2], // email
                            contactData[3], // mobile
                            contactData[4], // subject
                            contactData[5], // message
                            contactData[6] // status [pending ,processing, completed]

                    );
                    contacts.add(contact);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return contacts;
    }


    // Get contacts message by ID
    public Contact getContactById(int id) {
        for (Contact contact : getAllContacts()) {
            if (contact.getId() == id) {
                return contact;
            }
        }
        return null; // contact not found
    }

    // Get all pending contacts
    public List<Contact> getAllPendingContact() {
        List<Contact> pendingContact = new ArrayList<>();
        List<Contact> contacts = this.getAllContacts();

        for (Contact contact : contacts) {
            if (contact.getStatus().equalsIgnoreCase("pending")) {
                pendingContact.add(contact);
            }
        }

        return pendingContact;
    }

    // Get all processing contacts
    public List<Contact> getAllProcessingContact() {
        List<Contact> processingContact = new ArrayList<>();
        List<Contact> contacts = this.getAllContacts();

        for (Contact contact : contacts) {
            if (contact.getStatus().equalsIgnoreCase("processing")) {
                processingContact.add(contact);
            }
        }

        return processingContact;
    }

    // Get all completed contacts
    public List<Contact> getAllCompletedContact() {
        List<Contact> completedContact = new ArrayList<>();
        List<Contact> contacts = this.getAllContacts();

        for (Contact contact : contacts) {
            if (contact.getStatus().equalsIgnoreCase("completed")) {
                completedContact.add(contact);
            }
        }

        return completedContact;
    }

    // Add a new contact message to the text file
    public boolean addContact(Contact contact) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String contactLine = String.join(DELIMITER,
                    String.valueOf(contact.getId()),
                    contact.getName(),
                    contact.getEmail(),
                    contact.getMobile(),
                    contact.getSubject(),
                    contact.getMessage(),
                    contact.getStatus()
            );
            writer.write(contactLine);
            writer.newLine();
            return true; // Success
        } catch (IOException e) {
            e.printStackTrace();
            return false; // Error
        }
    }
    // Update an existing contact message's details
    public boolean updateContact(Contact updatedContact) {
        List<Contact> contacts = getAllContacts();
        boolean updated = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Contact contact : contacts) {
                if (contact.getId() == updatedContact.getId()) {
                    contact = updatedContact;  // Update contact info
                    updated = true;
                }

                // Write updated contact message data back to the file
                writer.write(contact.getId() + DELIMITER + contact.getName() + DELIMITER +
                        contact.getEmail() + DELIMITER + contact.getMobile() + DELIMITER +
                        contact.getSubject() + DELIMITER + contact.getMessage() + DELIMITER + contact.getStatus() );
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return updated;
    }

    // Delete booking by ID
    public boolean deleteContactById(int id) {
        List<Contact> contacts = getAllContacts();
        boolean deleted = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Contact contact : contacts) {
                if (contact.getId() != id) {
                    writer.write(contact.getId() + DELIMITER + contact.getName() + DELIMITER +
                            contact.getEmail() + DELIMITER + contact.getMobile() + DELIMITER +
                            contact.getSubject() + DELIMITER + contact.getMessage() + DELIMITER + contact.getStatus());                    writer.newLine();
                } else {
                    deleted = true; // contact message found and skipped (deleted)
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
        List<Contact> contacts = getAllContacts();
        if (contacts.isEmpty()) {
            return 1;
        }
        return contacts.get(contacts.size() - 1).getId() + 1;
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