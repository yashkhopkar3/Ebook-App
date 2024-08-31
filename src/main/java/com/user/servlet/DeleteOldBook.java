package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/DeleteOldBook")
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em= req.getParameter("email");
			int id = Integer.parseInt(req.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f= dao.oldBookDelete(em,id);
			HttpSession session = req.getSession();
			if (f) {
			session.setAttribute("succMsg", "Old Book Delete Sucessfully"); resp.sendRedirect("oldbook_Table.jsp");
			} else {
			session.setAttribute("failedMsg", "Something wrong on server"); resp.sendRedirect("oldbook_Table.jsp");
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
	}

}