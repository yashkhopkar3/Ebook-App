package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.OffersDAOImpl;
import com.DB.DBConnect;
import com.entity.Offer;

@WebServlet("/add_offer")
@MultipartConfig
public class OfferAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            // Get parameters from the JSP form
            String offerName = req.getParameter("offerTitle");
            String description = req.getParameter("description");
            String discount = req.getParameter("discountPercentage");  // Assuming discount is in percentage
            String expiryDate = req.getParameter("expiryDate");

            // Get the uploaded file part
            Part part = req.getPart("uploadPhoto");
            String uploadPhoto = part.getSubmittedFileName();

            // Create an OfferDtls object and set its values
            Offer offer = new Offer(offerName, description, discount, expiryDate, uploadPhoto);

            // Initialize the DAO and save the offer
            OffersDAOImpl dao = new OffersDAOImpl(DBConnect.getConn());
            boolean f = dao.addOffer(offer);

            // Handling file upload and session messages
            HttpSession session = req.getSession();
            if (f) {
                // Save the uploaded photo to a folder on the server
                String path = getServletContext().getRealPath("") + "Book";
                File file = new File(path);
                part.write(path + File.separator + uploadPhoto);
                System.out.println("File uploaded to: " + path + File.separator + uploadPhoto);

                // Success message
                session.setAttribute("SuccMsg", "Offer Added Successfully");
                resp.sendRedirect("admin/addOffer.jsp");
            } else {
                // Failure message
                session.setAttribute("FailMsg", "Something went wrong..");
                resp.sendRedirect("admin/addOffer.jsp");
            }

        } catch (Exception e) {
            // Handle and log the exception
            System.out.println("Exception: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
