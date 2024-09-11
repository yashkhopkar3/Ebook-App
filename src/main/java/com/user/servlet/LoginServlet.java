package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the connection from DBConnect
            Connection conn = DBConnect.getConn();
            UserDAOImpl dao = new UserDAOImpl(conn);
            
            // Get the session
            HttpSession session = req.getSession();
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Check if the user is an admin
            User adminUser = dao.adminLogin(email, password);
            if (adminUser != null) {
                session.setAttribute("userobj", adminUser);
                resp.sendRedirect("admin/home.jsp");
                return;
            }

            // Attempt to login the regular user
            User user = dao.login(email, password);
            if (user != null) {
                session.setAttribute("userobj", user);
                resp.sendRedirect("index.jsp");
            } else {
                session.setAttribute("failedMsg", "Email & Password Invalid");
                resp.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
