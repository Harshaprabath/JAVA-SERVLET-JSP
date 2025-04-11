package com.enchantedelegance.dao.feedbackmanagement;

import com.enchantedelegance.models.feedbackmanagement.Feedback;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private static final String FILE_PATH =  "src/main/resources/data/feedbackmanagement/Feedback.txt"; // Updated file path
    private static final String DELIMITER = ","; // Delimiter for separating fields

    public FeedbackDAO() {
        ensureFileExists();
    }

    // Read all Feedback from the text file
    public List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbacks = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] feedbackData = line.split(DELIMITER);
                if (feedbackData.length == 7) { // Ensure all fields are present
                    Feedback feedback = new Feedback(
                            Integer.parseInt(feedbackData[0]), // id
                            feedbackData[1], // name
                            feedbackData[2], // email
                            feedbackData[3], // mobile
                            feedbackData[4], // message
                            feedbackData[5], // date
                            Boolean.parseBoolean(feedbackData[6]) // is publish

                    );
                    feedbacks.add(feedback);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return feedbacks;
    }


    // Get feedback by ID
    public Feedback getFeedbackById(int id) {
        for (Feedback feedback : getAllFeedbacks()) {
            if (feedback.getId() == id) {
                return feedback;
            }
        }
        return null; // Feedback not found
    }

    // Get all published feedbacks
    public List<Feedback> getFeedbackPublished() {
        List<Feedback> publishedFeedbacks = new ArrayList<>();
        List<Feedback> feedbacks = this.getAllFeedbacks();

        for (Feedback feedback : feedbacks) {
            if (feedback.isPublish()) {
                publishedFeedbacks.add(feedback);
            }
        }

        return publishedFeedbacks;
    }
    // Get all unpublished feedbacks
    public List<Feedback> getFeedbackUnPublished() {
        List<Feedback> unPublishedFeedbacks = new ArrayList<>();
        List<Feedback> feedbacks = this.getAllFeedbacks();

        for (Feedback feedback : feedbacks) {
            if (!feedback.isPublish()) {
                unPublishedFeedbacks.add(feedback);
            }
        }

        return unPublishedFeedbacks;
    }


    // Add a new feedback to the text file
    public boolean addFeedback(Feedback feedback) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String feedbackLine = String.join(DELIMITER,
                    String.valueOf(feedback.getId()),
                    feedback.getName(),
                    feedback.getEmail(),
                    feedback.getMobile(),
                    feedback.getMessage(),
                    feedback.getDate(),
                    String.valueOf(feedback.isPublish())
            );
            writer.write(feedbackLine);
            writer.newLine();
            return true; // Success
        } catch (IOException e) {
            e.printStackTrace();
            return false; // Error
        }
    }
    // Update an existing feedback message's details
    public boolean updateFeedback(Feedback updatedFeedback) {
        List<Feedback> feedbacks = getAllFeedbacks();
        boolean updated = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Feedback feedback : feedbacks) {
                if (feedback.getId() == updatedFeedback.getId()) {
                    feedback = updatedFeedback;  // Update contact info
                    updated = true;
                }

                // Write updated contact message data back to the file
                writer.write(feedback.getId() + DELIMITER + feedback.getName() + DELIMITER +
                        feedback.getEmail() + DELIMITER + feedback.getMobile() + DELIMITER +
                        feedback.getMessage() + DELIMITER + feedback.getDate() + DELIMITER + feedback.isPublish() );
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return updated;
    }

    // Delete feedback by ID
    public boolean deleteFeedbackById(int id) {
        List<Feedback> feedbacks = getAllFeedbacks();
        boolean deleted = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Feedback feedback : feedbacks) {
                if (feedback.getId() != id) {
                    writer.write(feedback.getId() + DELIMITER + feedback.getName() + DELIMITER +
                            feedback.getEmail() + DELIMITER + feedback.getMobile() + DELIMITER +
                            feedback.getMessage() + DELIMITER + feedback.getDate() + DELIMITER + feedback.isPublish() );                    writer.newLine();
                } else {
                    deleted = true; // feedback found and skipped (deleted)
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
        List<Feedback> feedbacks = getAllFeedbacks();
        if (feedbacks.isEmpty()) {
            return 1;
        }
        return feedbacks.get(feedbacks.size() - 1).getId() + 1;
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