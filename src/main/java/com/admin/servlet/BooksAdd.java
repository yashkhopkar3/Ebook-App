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

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookName = req.getParameter("bookName");

			String authorName = req.getParameter("authorName");

			String price = req.getParameter("price");

			String bookCategories = req.getParameter("bookCategories");

			String bookStatus = req.getParameter("bookStatus");
			
			int copies=Integer.parseInt(req.getParameter("copies"));

			Part part = req.getPart("uploadPhoto");
			String uploadPhoto = part.getSubmittedFileName();

			BookDtls b = new BookDtls(bookName, authorName, price, bookCategories, bookStatus, uploadPhoto, "admin",copies);
			
			BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());
			
			
			boolean f=dao.addBooks(b);
			
			HttpSession session = req.getSession();
			if (f) {
		            String path = getServletContext().getRealPath("")+"Book";
		            File file=new File(path);
		            part.write(path+File.separator+uploadPhoto);
		            System.out.println(path+File.separator+uploadPhoto);
                session.setAttribute("SuccMsg", "Book Added Successfully");
                resp.sendRedirect("admin/addBooks.jsp");
            } else {
                session.setAttribute("FailMsg", "Something went wrong..");
                resp.sendRedirect("admin/addBooks.jsp");
            }
            

		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			e.printStackTrace();
		}
		
	}
}
