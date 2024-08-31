package com.user.servlet;

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

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/addOldBook")
@MultipartConfig
public class AddOldBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bookName");
            String authorName = req.getParameter("authorName");
            String price = req.getParameter("price");
            String bookCategories = req.getParameter("bookCategories");
            String bookStatus = "Not Approved";
            int copies = Integer.parseInt(req.getParameter("copies"));

            // Check if copies are less than or equal to zero
            if (copies <= 0) {
                HttpSession session = req.getSession();
                session.setAttribute("FailMsg", "The number of copies must be greater than zero.");
                resp.sendRedirect("sell_books.jsp");
                return;
            }

            Part part = req.getPart("uploadPhoto");
            String uploadPhoto = part.getSubmittedFileName();
            String useremail = req.getParameter("email");

            // Create BookDtls object
            BookDtls b = new BookDtls(bookName, authorName, price, bookCategories, bookStatus, uploadPhoto, useremail, copies);
            
            // Create DAO object and add the book
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean isAdded = dao.addBooks(b);

            // Handle the result
            HttpSession session = req.getSession();
            if (isAdded) {
                String path = getServletContext().getRealPath("") + "Book";
                File file = new File(path);
                if (!file.exists()) {
                    file.mkdirs(); // Create directory if it doesn't exist
                }
                part.write(path + File.separator + uploadPhoto);
                session.setAttribute("SuccMsg", "Book Added Successfully");
                resp.sendRedirect("sell_books.jsp");
            } else {
                session.setAttribute("FailMsg", "Something went wrong. Please try again.");
                resp.sendRedirect("sell_books.jsp");
            }

        } catch (Exception e) {
            // Log the error and redirect to an error page
            System.err.println("Exception: " + e.getMessage());
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("FailMsg", "An error occurred. Please try again.");
            resp.sendRedirect("sell_books.jsp");
        }
    }
}
