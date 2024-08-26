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

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String pass = req.getParameter("pass");

            User us = new User();
            us.setId(id);
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);

            HttpSession session = req.getSession();
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

            boolean passwordCheck = true;

            if (pass != null && !pass.isEmpty()) {
                passwordCheck = dao.checkPassword(id, pass);
            }

            if (passwordCheck) {
                User updatedUser = dao.updateProfile(us, session);
                if (updatedUser != null) {
                    session.setAttribute("SuccMsg", "Profile Updated Successfully.");
                } else {
                    session.setAttribute("failedMsg", "Something went wrong on the server.");
                }
            } else {
                session.setAttribute("failedMsg", "Your Password is Incorrect.");
            }

            resp.sendRedirect("editprofile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
