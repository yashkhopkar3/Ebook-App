package com.user.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.OffersDAOImpl;
import com.DB.DBConnect;
import com.entity.Offer;
import com.entity.User;

@WebServlet("/offers")
public class OffersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loggedInUser = (User) session.getAttribute("userobj");

        // Check if the user is logged in
        if (loggedInUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBConnect.getConn()) {
            OffersDAOImpl offersDAO = new OffersDAOImpl(conn);
            List<Offer> availableOffers = offersDAO.getAllOffers();
            
            // Store the offers in the request
            req.setAttribute("availableOffers", availableOffers);

            // Forward to the offers display JSP page
            req.getRequestDispatcher("Offers.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp"); // Redirect to an error page if something goes wrong
        }
    }
}
