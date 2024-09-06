package com.DAO;

import java.sql.SQLException;
import java.util.List;
import com.entity.Offer;

public interface OffersDAO {
    List<Offer> getAllOffers() throws SQLException;
    public boolean addOffer(Offer offer) throws SQLException;
    public Offer getOfferById(int id) throws SQLException;
    public boolean updateOffer(Offer offer) throws SQLException;
    public boolean deleteOffer(int offerId) throws SQLException;
}
