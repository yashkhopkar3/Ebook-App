package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Check if addCart parameter is present
            if ("true".equals(req.getParameter("addCart"))) {
                // Retrieve bid and uid parameters from the request
                int bid = Integer.parseInt(req.getParameter("bid"));
                int uid = Integer.parseInt(req.getParameter("uid"));

                // Get book details by ID
                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                BookDtls b = dao.getBookbyId(bid);

                // Create a new Cart object and set its properties
                Cart c = new Cart();
                c.setBid(bid);
                c.setUid(uid);
                c.setBookName(b.getBookName());
                c.setAuthor(b.getAuthor());
                c.setPrice(Double.parseDouble(b.getPrice()));
                c.setTotalPrice(Double.parseDouble(b.getPrice()));

                CartDAOImpl cartDao = new CartDAOImpl(DBConnect.getConn());
                boolean result = cartDao.addCart(c);

                HttpSession session = req.getSession();

                if (result) {
                    session.setAttribute("addCartMessage", "Book added to cart successfully!");
                } else {
                    session.setAttribute("addCartMessage", "Something went wrong on the server");
                }
            }

            resp.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
