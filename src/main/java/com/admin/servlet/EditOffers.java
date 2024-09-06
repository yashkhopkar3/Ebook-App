package com.admin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.OffersDAOImpl;
import com.DB.DBConnect;
import com.entity.Offer;

@WebServlet("/edit_offers")
public class EditOffers extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String offerTitle = req.getParameter("offerTitle");
        String description = req.getParameter("description");
        String discountPercentage = req.getParameter("discountPercentage");
        String expiryDate = req.getParameter("expiryDate");
        String photo = req.getParameter("photo");

        Offer offer = new Offer();
        offer.setOfferId(id);
        offer.setOfferTitle(offerTitle);
        offer.setDescription(description);
        offer.setDiscountPercentage(discountPercentage);
        offer.setExpiryDate(expiryDate);
        offer.setPhoto(photo);

        OffersDAOImpl dao = new OffersDAOImpl(DBConnect.getConn());
        boolean isUpdated = false;

        try {
            isUpdated = dao.updateOffer(offer);
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally, log the exception or set a failure message
        }

        HttpSession session = req.getSession();

        if (isUpdated) {
            session.setAttribute("SuccMsg", "Offer details updated successfully.");
        } else {
            session.setAttribute("FailMsg", "Failed to update offer details.");
        }

        resp.sendRedirect("admin/manageOffers.jsp");
    }
}
