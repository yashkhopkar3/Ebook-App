package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAO;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/removeCart")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid=Integer.parseInt(req.getParameter("cid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f= dao.RemoveCart(cid,uid);
		HttpSession session =req.getSession();
		if (f) {
            session.setAttribute("succMsg", "Book removed from cart");
            resp.sendRedirect("cart.jsp");
        } else {
            session.setAttribute("failedMsg", "Something went wrong on the server");
            resp.sendRedirect("cart.jsp");
        }
	}

}
