package com.enchantedelegance.models.bookingmanagement;

public class Booking {
    private int id;
    private int userId;
    private String name;
    private String mobile;
    private String date;
    private String email;
    private String treatment;
    private String note;

    // Constructor
    public Booking() {
    }

    public Booking( int id, int userId, String name,String mobile, String date, String email, String treatment, String note) {
        this.id =  id;
        this.userId = userId;
        this.name = name;
        this.mobile = mobile;
        this.date = date;
        this.email = email;
        this.treatment = treatment;
        this.note = note;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}

