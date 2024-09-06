package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DAO.OffersDAOImpl;

@WebServlet("/deleteOffer")
public class OfferDelete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            // Initialize DAO and perform delete operation
            OffersDAOImpl offerDAO = new OffersDAOImpl(DBConnect.getConn());
            boolean isDeleted = offerDAO.deleteOffer(id);

            HttpSession session = req.getSession();
            if (isDeleted) {
                session.setAttribute("SuccMsg", "Offer deleted successfully.");
            } else {
                session.setAttribute("FailMsg", "Failed to delete the offer. It may not exist.");
            }
            resp.sendRedirect("admin/manageOffers.jsp"); 

        } catch (Exception e) {
            e.printStackTrace();
            // Optionally, set a failure message in the session
            HttpSession session = req.getSession();
            session.setAttribute("FailMsg", "An error occurred while deleting the offer.");
            resp.sendRedirect("admin/manageOffers.jsp"); 
        }
    }
}
