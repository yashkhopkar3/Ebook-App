package com.user.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.BookOrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_order;
import com.entity.User;

@WebServlet("/yourOrders")
public class OrderDisplayServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loggedInUser = (User) session.getAttribute("userobj");

        // Check if the user is logged in
        if (loggedInUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            String email = loggedInUser.getEmail();
            BookOrderDAOImpl orderDao = new BookOrderDAOImpl(DBConnect.getConn());
            List<Book_order> orders = orderDao.getOrdersAll();
            // Store the orders in session
            session.setAttribute("orders", orders);

            // Forward to the order display JSP page
            resp.sendRedirect("order.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp"); // Redirect to an error page if something goes wrong
        }
    }
}
