package com.user.servlet;

import com.DAO.CartDAO;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.User;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/updateCartQuantity")
public class UpdateCartQuantity extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;

    @Override
    public void init() throws ServletException {
        // Initialize CartDAO
        cartDAO = new CartDAOImpl(DBConnect.getConn());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from request
        int cid = Integer.parseInt(request.getParameter("cid")); // Cart ID
        String action = request.getParameter("action"); // 'increase' or 'decrease'
        User u = (User)request.getSession().getAttribute("userobj");
        int uid = u.getId();
        boolean isSuccess = false;

        try {
            // Fetch the current cart item by CID and UID
           
            if (uid == 0) {
                throw new IllegalStateException("User not logged in or user ID not found.");
            }

            // Ensure action is either 'increase' or 'decrease'
            if (!"increase".equals(action) && !"decrease".equals(action)) {
                throw new IllegalArgumentException("Invalid action parameter.");
            }

            // Perform the update
            int quantityChange = "increase".equals(action) ? 1 : -1;
            isSuccess = cartDAO.updateCartQuantity(cid, uid, quantityChange);

            // Redirect or respond based on the update result
            if (isSuccess) {
                response.sendRedirect("cart.jsp"); // Redirect to cart page
            } else {
                request.setAttribute("errorMessage", "Failed to update cart item.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid cart ID format.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the cart.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
