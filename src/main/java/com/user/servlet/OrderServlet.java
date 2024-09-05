package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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
import com.utils.EmailUtil;

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
            String totalPriceStr = req.getParameter("totalPrice");

            // Retrieve offer and discounted price
            String selectedOffer = req.getParameter("selectedOffer");
            String discountedPriceStr = req.getParameter("discountedPrice");

            double discountedPrice = 0;
            if (discountedPriceStr != null && !discountedPriceStr.isEmpty()) {
                discountedPrice = Double.parseDouble(discountedPriceStr);
            }

            double totalPrice = 0;
            if (totalPriceStr != null && !totalPriceStr.isEmpty()) {
                totalPrice = Double.parseDouble(totalPriceStr);
            }

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
                session.setAttribute("failedMsg", "Please Add Items");
                resp.sendRedirect("cart.jsp");
                return;
            }

            BookOrderDAOImpl orderDao = new BookOrderDAOImpl(DBConnect.getConn());
            Book_order o = null;
            ArrayList<Book_order> orderList = new ArrayList<>();
            Random r = new Random();

            StringBuilder orderDetails = new StringBuilder();

            // Add professional HTML email template
            orderDetails.append("<html>");
            orderDetails.append("<head><style>");
            orderDetails.append("body { font-family: Arial, sans-serif; color: #333; margin: 0; padding: 0; }");
            orderDetails.append("h1 { color: #007BFF; }");
            orderDetails.append("table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }");
            orderDetails.append("th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }");
            orderDetails.append("thead { background-color: #007BFF; color: #fff; }");
            orderDetails.append("th { background-color: #0056b3; }");
            orderDetails.append("p { margin: 0; padding: 10px 0; }");
            orderDetails.append("</style></head>");
            orderDetails.append("<body>");
            orderDetails.append("<div style='text-align: center; margin-bottom: 20px;'>");
            orderDetails.append("<h1>BookMart</h1>");
            orderDetails.append("</div>");

            orderDetails.append("<h2>Thank you for your order!</h2>");
            orderDetails.append("<p>Here are your order details:</p>");
            orderDetails.append("<table>");
            orderDetails.append("<thead><tr><th>Order ID</th><th>Book Name</th><th>Author</th><th>Price (&#8377;)</th><th>Copies</th></tr></thead>");
            orderDetails.append("<tbody>");

            double totalAmount = 0;
            boolean isOfferApplied = (selectedOffer != null && !selectedOffer.isEmpty());

            for (Cart c : blist) {
                if (c != null) {
                    // Generate a unique alphanumeric order ID
                    String orderId;
                    do {
                        orderId = "BOOK-ORD-" + generateAlphanumericOrderId();
                    } while (orderDao.isOrderIdExists(orderId)); // Method to check if Order ID exists in the database

                    o = new Book_order();
                    o.setOrderId(orderId);
                    o.setUserName(name);
                    o.setEmail(email);
                    o.setPhno(phno);
                    o.setFulladd(fullAdd);
                    o.setBookName(c.getBookName());
                    o.setBookId(c.getBid());
                    o.setAuthor(c.getAuthor());
                    o.setPrice(c.getPrice());
                    o.setPaymentType(paymentType);
                    o.setCopies(c.getCopies());
                    orderList.add(o);

                    // Append book details to order details
                    orderDetails.append("<tr>");
                    orderDetails.append("<td>").append(orderId).append("</td>");
                    orderDetails.append("<td>").append(c.getBookName()).append("</td>");
                    orderDetails.append("<td>").append(c.getAuthor()).append("</td>");
                    orderDetails.append("<td>").append(String.format("&#8377;%.2f", c.getPrice())).append("</td>");
                    orderDetails.append("<td>").append(c.getCopies()).append("</td>");
                    orderDetails.append("</tr>");

                    double itemTotal = c.getPrice() * c.getCopies();
                    totalAmount += itemTotal;
                }
            }

            if (isOfferApplied) {
                orderDetails.append("<tfoot>");
                orderDetails.append("<tr><td colspan='4'><strong>Selected Offer:</strong> ").append(selectedOffer).append("</td><td><strong>Discounted Price (&#8377;):</strong> ").append(String.format("&#8377;%.2f", discountedPrice)).append("</td></tr>");
                orderDetails.append("</tfoot>");
            } else {
                orderDetails.append("<tfoot><tr><td colspan='5'><strong>No Offer Applied</strong></td></tr></tfoot>");
            }

            orderDetails.append("<tfoot><tr><td colspan='4'><strong>Total Amount (&#8377;):</strong></td><td>").append(String.format("&#8377;%.2f", totalAmount)).append("</td></tr></tfoot>");
            orderDetails.append("</tbody>");
            orderDetails.append("</table>");
            orderDetails.append("<p><strong>Shipping Address:</strong> ").append(fullAdd).append("</p>");
            orderDetails.append("<p><strong>Payment Method:</strong> ").append(paymentType).append("</p>");
            orderDetails.append("<p>Thank you for shopping with us!</p>");
            orderDetails.append("</body></html>");

            if ("noselect".equals(paymentType)) {
                session.setAttribute("failedMsg", "Choose Payment Method");
                resp.sendRedirect("cart.jsp");
            } else {
                boolean f = orderDao.saveOrder(orderList);
                if (f) {
                    // Send order confirmation email
                    EmailUtil.sendEmail(user.getEmail(), "Order Confirmation", orderDetails.toString());

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

    private String generateAlphanumericOrderId() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder orderId = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < 10; i++) {
            orderId.append(chars.charAt(rand.nextInt(chars.length())));
        }
        return orderId.toString();
    }
}
