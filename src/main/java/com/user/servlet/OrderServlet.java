package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.CartDAOImpl;
import com.DAO.BookOrderDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Book_order;
import com.entity.User;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String idParam = req.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                resp.sendRedirect("cart.jsp");
                return;
            }
            
            int id = Integer.parseInt(idParam);

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("mobile");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            String paymentType = req.getParameter("paymentType");

            if (name == null || email == null || phno == null || address == null || city == null || state == null || pincode == null || paymentType == null || paymentType.equals("noselect")) {
                session.setAttribute("failedMsg", "Choose Payment Method");
                resp.sendRedirect("cart.jsp");
                return;
            }

            String fullAdd = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

            // Update the user details in the database
            UserDAOImpl userDao = new UserDAOImpl(DBConnect.getConn());
            User user = new User();
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setPhno(phno);
            user.setAddress(address);
            user.setLandmark(landmark);
            user.setCity(city);
            user.setState(state);
            user.setPincode(pincode);

            boolean isUserUpdated = userDao.updateUserDetails(user);
            if (!isUserUpdated) {
                session.setAttribute("failedMsg", "Failed to update user details.");
                resp.sendRedirect("cart.jsp");
                return;
            }
            
            session.setAttribute("userobj", user);

            // Proceed with the order placement
            CartDAOImpl cartDao = new CartDAOImpl(DBConnect.getConn());
            List<Cart> blist = cartDao.getCartItems(id);

            if (blist == null || blist.isEmpty()) {
                resp.sendRedirect("cart.jsp");
                return;
            }

            BookOrderDAOImpl orderDao = new BookOrderDAOImpl(DBConnect.getConn());
            int i = orderDao.getOrderNo();

            ArrayList<Book_order> orderList = new ArrayList<>();

            for (Cart c : blist) {
                if (c != null) {
                    Book_order o = new Book_order();
                    i++;
                    o.setOrderId("BOOK-ORD-00" + i);
                    o.setUserName(name);
                    o.setEmail(email);
                    o.setPhno(phno);
                    o.setFulladd(fullAdd);
                    o.setBookName(c.getBookName());
                    o.setAuthor(c.getAuthor());
                    o.setPrice(c.getPrice() + "");
                    o.setPaymentType(paymentType);
                    o.setCopies(c.getCopies());
                    orderList.add(o);
                }
            }

            if ("noselect".equals(paymentType)) {
                session.setAttribute("failedMsg", "Choose Payment Method");
                resp.sendRedirect("cart.jsp");
            } else {
                boolean f = orderDao.saveOrder(orderList);
                if (f) {
                    System.out.println("Order Success");
                    resp.sendRedirect("order_success.jsp"); // Redirect to a success page
                } else {
                    System.out.println("Order Failed");
                    session.setAttribute("failedMsg", "Order Processing Failed");
                    resp.sendRedirect("cart.jsp");
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("cart.jsp");
        }
    }
}
