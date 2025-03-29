package com.enchantedelegance.dao.offermanagement;

import com.enchantedelegance.models.offermanagement.Offer;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class OfferDAO {
    private static final String FILE_PATH = "src/main/resources/data/offermanagement/Offer.txt";
    private static final String DELIMITER = ",";

    public OfferDAO() {
        ensureFileExists();
    }

    // Read all Offers from the text file
    public List<Offer> getAllOffers() {
        List<Offer> offers = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] offerData = line.split(DELIMITER);
                if (offerData.length == 5) {
                    Offer offer = new Offer(
                            Integer.parseInt(offerData[0]), // id
                            offerData[1], // image URL
                            offerData[2], // title
                            offerData[3], // discount
                            offerData[4]  // description
                    );
                    offers.add(offer);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return offers;
    }

    // Get Offer by ID
    public Offer getOfferById(int id) {
        for (Offer offer : getAllOffers()) {
            if (offer.getId() == id) {
                return offer;
            }
        }
        return null;
    }

    // Add a new Offer with image URL
    public boolean addOffer(Offer offer) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String offerLine = String.join(DELIMITER,
                    String.valueOf(offer.getId()),
                    offer.getImage(), // This is now the URL
                    offer.getTitle(),
                    offer.getDiscount(),
                    offer.getDescription()
            );
            writer.write(offerLine);
            writer.newLine();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update an existing Offer with image URL
    public boolean updateOffer(Offer updatedOffer) {
        List<Offer> offers = getAllOffers();
        boolean updated = false;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Offer offer : offers) {
                if (offer.getId() == updatedOffer.getId()) {
                    offer = updatedOffer;
                    updated = true;
                }
                writer.write(String.join(DELIMITER,
                        String.valueOf(offer.getId()),
                        offer.getImage(), // This is now the URL
                        offer.getTitle(),
                        offer.getDiscount(),
                        offer.getDescription()
                ));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return updated;
    }

    // Delete an Offer by ID
    public boolean deleteOfferById(int id) {
        List<Offer> offers = getAllOffers();
        boolean deleted = false;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Offer offer : offers) {
                if (offer.getId() != id) {
                    writer.write(String.join(DELIMITER,
                            String.valueOf(offer.getId()),
                            offer.getImage(),
                            offer.getTitle(),
                            offer.getDiscount(),
                            offer.getDescription()
                    ));
                    writer.newLine();
                } else {
                    deleted = true;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return deleted;
    }

    // Generate next ID
    public int getNextId() {
        List<Offer> offers = getAllOffers();
        return offers.isEmpty() ? 1 : offers.get(offers.size() - 1).getId() + 1;
    }

    private void ensureFileExists() {
        File file = new File(FILE_PATH);
        try {
            file.getParentFile().mkdirs();
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
