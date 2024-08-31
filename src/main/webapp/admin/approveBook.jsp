<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approve Book</title>
</head>
<body>
	<%
		// Retrieve the book ID from the request
		String bookIdStr = request.getParameter("id");
		if (bookIdStr != null && !bookIdStr.isEmpty()) {
			try {
				int bookId = Integer.parseInt(bookIdStr);
				
				// Create DAO instance and update the book status
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				boolean result = dao.updateBookStatus(bookId, "Unavailable"); // Update status to "Unavailable"
				
				if (result) {
					session.setAttribute("SuccMsg", "Book status updated to 'Unavailable' successfully.");
				} else {
					session.setAttribute("FailMsg", "Failed to update book status.");
				}
			} catch (NumberFormatException e) {
				session.setAttribute("FailMsg", "Invalid book ID.");
			}
		} else {
			session.setAttribute("FailMsg", "Book ID is missing.");
		}
		
		// Redirect to the page displaying the list of books
		response.sendRedirect("notApprovedBooks.jsp"); // Adjust the URL as needed
	%>
</body>
</html>
