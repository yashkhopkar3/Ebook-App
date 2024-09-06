package com.entity;

public class Offer {
    private int offerId;
    private String offerTitle;
    private String description;
    private String discountPercentage;
    private String expiryDate;
    private String photo; // Field to store the photo name

    // Getters and Setters
    public int getOfferId() {
        return offerId;
    }

    public void setOfferId(int offerId) {
        this.offerId = offerId;
    }

    public String getOfferTitle() {
        return offerTitle;
    }

    public void setOfferTitle(String offerTitle) {
        this.offerTitle = offerTitle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(String discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    // Constructor
    public Offer(String offerTitle, String description, String discountPercentage, String expiryDate, String photo) {
        super();
        this.offerTitle = offerTitle;
        this.description = description;
        this.discountPercentage = discountPercentage;
        this.expiryDate = expiryDate;
        this.photo = photo;
    }

	public Offer() {
		super();// TODO Auto-generated constructor stub
	}
}
