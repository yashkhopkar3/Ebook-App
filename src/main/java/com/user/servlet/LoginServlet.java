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
            
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us = new User(); 
                us.setName("Admin");
                session.setAttribute("userobj", us);
                resp.sendRedirect("admin/home.jsp");
            } else {
                // Attempt to login the user
                User us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    resp.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("failedMsg", "Email & Password Invalid");
                    resp.sendRedirect("login.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}