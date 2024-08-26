package com.admin.servlet;

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

@WebServlet("/allOrders")
public class AdminOrderDisplayServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            BookOrderDAOImpl orderDao = new BookOrderDAOImpl(DBConnect.getConn());
            List<Book_order> orders = orderDao.getOrdersAll();
            HttpSession session = req.getSession();
            // Store the orders in session
            session.setAttribute("orders", orders);

            // Forward to the order display JSP page
            resp.sendRedirect("admin/orders.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp"); // Redirect to an error page if something goes wrong
        }
    }
}
