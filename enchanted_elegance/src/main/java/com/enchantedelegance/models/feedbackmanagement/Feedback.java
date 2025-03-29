package com.enchantedelegance.models.feedbackmanagement;

public class Feedback {
    private int id;
    private String name;
    private String email;
    private String mobile;
    private String message;
    private String date;
    private boolean isPublish;

    public Feedback() {}

    public Feedback(int id, String name, String email, String mobile,String message,String date,boolean isPublish) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.message = message;
        this.date = date;
        this.isPublish = isPublish;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public boolean isPublish() {
        return isPublish;
    }

    public void setPublish(boolean publish) {
        isPublish = publish;
    }
}