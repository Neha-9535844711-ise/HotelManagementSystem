package com.hotel.model;

public class Destination {
    private String code;
    private String name;
    private String country;
    private String imageUrl;
    
    public Destination(String code, String name, String country) {
        this.code = code;
        this.name = name;
        this.country = country;
    }
    
    // Getters and Setters
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}