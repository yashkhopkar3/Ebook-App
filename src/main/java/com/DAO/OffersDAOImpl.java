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
                    offer.setDiscountPercentage(rs.getBigDecimal("discount_percentage"));
                    offer.setExpiryDate(rs.getDate("expiry_date"));
                    offers.add(offer);
                }
            }
        }

        return offers;
    }
}
