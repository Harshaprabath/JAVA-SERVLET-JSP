package com.enchantedelegance.models.offermanagement;

public class Offer {
    private int id;
    private String image;
    private String title;
    private String discount;
    private String description;

    public Offer() {}

    public Offer(int id, String image, String title, String discount, String description) {
        this.id = id;
        this.image = image;
        this.title = title;
        this.discount = discount;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}