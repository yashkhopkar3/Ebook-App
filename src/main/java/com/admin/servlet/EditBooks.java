package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/edit_books")
public class EditBooks extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String bookName = req.getParameter("bookName");
        String authorName = req.getParameter("authorName");
        String price = req.getParameter("price");
        String bookCategories = req.getParameter("bookCategories");
        String bookStatus = req.getParameter("bookStatus");
        int copies=Integer.parseInt(req.getParameter("copies"));


        BookDtls book = new BookDtls();
        book.setBookId(id);
        book.setBookName(bookName);
        book.setAuthor(authorName);
        book.setPrice(price);
        book.setBookCategory(bookCategories);
        book.setStatus(bookStatus);
        book.setCopies(copies);

        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        boolean isUpdated = dao.UpdateEditBooks(book);
        
        HttpSession session = req.getSession();

        if (isUpdated) {
            session.setAttribute("SuccMsg", "Book details updated successfully.");
            resp.sendRedirect("admin/allBooks.jsp");
        } else {
            session.setAttribute("FailMsg", "Failed to update book details.");
            resp.sendRedirect("admin/allBooks.jsp");
        }
        
        
    }
}
