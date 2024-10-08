<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<%@include file="All_Component/AllCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="All_Component/Navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookbyId(bid);
	// Add book details to the recent_books table
	dao.addRecentBook(b);
	%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Book/<%=b.getPhotoName()%>"
					style="height: 150px; width: 100px"><br>

				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
				if ("Unavailable".equals(b.getStatus())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="far fa-envelope"></i> EMail:
					<%=b.getEmail()%>
				</h5>
				<%
				}
				%>


				<div class="row mt-2">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-taxi fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Unavailable".equals(b.getStatus())) {
				%>
				<div class=" text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
						Continue Shopping</a> <a href="" class="btn btn-danger"><i
						class="fas fa-rupee-sign"></i>200</a>
				</div>
				<%
				} else {
				%>
				<div class=" text-center p-3">
				<% if(u!=null){ %>
					<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&addCart=true"
						class="btn btn-primary"><i class="fas fa-cart-plus"></i> Add
						Cart</a> 
				<%} else { %>	
				<a href="login.jsp"
						class="btn btn-primary"><i class="fas fa-cart-plus"></i> Add
						Cart</a> 
				<%} %>	
						
						<a href="" class="btn btn-danger"><i
						class="fas fa-rupee-sign"></i>200</a>
				</div>
				<%
				}
				%>




			</div>
		</div>
	</div>

</body>
</html>