package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.entity.Offer;

public class OffersDAOImpl implements OffersDAO {
    private Connection conn;

    public OffersDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // Method to get all offers
    @Override
    public List<Offer> getAllOffers() throws SQLException {
        List<Offer> offers = new ArrayList<>();
        String query = "SELECT * FROM offers WHERE expiry_date >= CURDATE()";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Offer offer = new Offer();
                    offer.setOfferId(rs.getInt("offer_id"));
                    offer.setOfferTitle(rs.getString("offer_title"));
                    offer.setDescription(rs.getString("description"));
                    offer.setDiscountPercentage(rs.getString("discount_percentage"));
                    offer.setExpiryDate(rs.getString("expiry_date"));
                    offer.setPhoto(rs.getString("photo"));
                    offers.add(offer);
                }
            }
        }

        return offers;
    }

    // Method to add an offer
    @Override
    public boolean addOffer(Offer offer) throws SQLException {
        String query = "INSERT INTO offers (offer_title, description, discount_percentage, expiry_date, photo) "
                     + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, offer.getOfferTitle());
            ps.setString(2, offer.getDescription());
            ps.setString(3, offer.getDiscountPercentage());
            ps.setString(4, offer.getExpiryDate());
            ps.setString(5, offer.getPhoto()); // Saving the photo file name

            int result = ps.executeUpdate(); // Execute the insert query
            return result > 0; // Return true if insert was successful
        }
    }
    
    
    public Offer getOfferById(int id) throws SQLException {
        String query = "SELECT * FROM offers WHERE offer_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Offer offer = new Offer();
                    offer.setOfferId(rs.getInt("offer_id"));
                    offer.setOfferTitle(rs.getString("offer_title"));
                    offer.setDescription(rs.getString("description"));
                    offer.setDiscountPercentage(rs.getString("discount_percentage"));
                    offer.setExpiryDate(rs.getString("expiry_date"));
                    offer.setPhoto(rs.getString("photo"));
                    return offer;
                }
            }
        }
        return null; // Or throw an exception if you prefer
    }
    
    public boolean updateOffer(Offer offer) throws SQLException {
        String query = "UPDATE offers SET offer_title = ?, description = ?, discount_percentage = ?, expiry_date = ?, photo = ? WHERE offer_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, offer.getOfferTitle());
            ps.setString(2, offer.getDescription());
            ps.setString(3, offer.getDiscountPercentage());
            ps.setString(4, offer.getExpiryDate());
            ps.setString(5, offer.getPhoto());
            ps.setInt(6, offer.getOfferId());

            int result = ps.executeUpdate();
            return result > 0;
        }
    }
    
    public boolean deleteOffer(int offerId) throws SQLException {
        String query = "DELETE FROM offers WHERE offer_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, offerId);
            int result = ps.executeUpdate();
            return result > 0;
        }
    }



}
