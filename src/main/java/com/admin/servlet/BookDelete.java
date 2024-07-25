package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DAO.BookDAOImpl;

@WebServlet("/delete")
public class BookDelete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            // Initialize DAO and perform delete operation
            BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
            boolean isDeleted = bookDAO.DeleteBooks(id);

            HttpSession session = req.getSession();
            if (isDeleted) {
                session.setAttribute("SuccMsg", "Book deleted successfully.");
            } else {
                session.setAttribute("FailMsg", "Failed to delete the book. It may not exist.");
            }
            resp.sendRedirect("admin/allBooks.jsp"); 

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
