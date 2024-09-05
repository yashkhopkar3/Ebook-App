package com.DAO;

import java.sql.SQLException;
import java.util.List;
import com.entity.Offer;

public interface OffersDAO {
    List<Offer> getAllOffers() throws SQLException;
}
