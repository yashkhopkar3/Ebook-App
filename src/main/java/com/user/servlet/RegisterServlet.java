package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String pass = req.getParameter("pass");
            String check = req.getParameter("check");

            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(pass);

            HttpSession session = req.getSession();

            if (check != null) {
                UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                if (dao.userExists(email)) {
                    session.setAttribute("FailMsg", "User already exists.");
                    resp.sendRedirect("register.jsp");
                } else {
                    boolean f = dao.userRegister(us);
                    if (f) {
                        session.setAttribute("SuccMsg", "User Registered Successfully");
                        resp.sendRedirect("register.jsp");
                    } else {
                        session.setAttribute("FailMsg", "Something went wrong..");
                        resp.sendRedirect("register.jsp");
                    }
                }
            } else {
                session.setAttribute("FailMsg", "Please Agree the Terms and Conditions");
                resp.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
