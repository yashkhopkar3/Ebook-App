<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approve Books</title>
<%@ include file="AllCSS.jsp"%>
<!-- Include Bootstrap CSS for styling -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.card {
	transition: transform 0.3s, box-shadow 0.3s;
	margin-bottom: 20px; /* Adjust space below each card */
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.card-body a {
	text-decoration: none;
	color: inherit;
}

.card-title {
	margin-top: 10px;
}

.container {
	max-width: 1200px; /* Adjust the maximum width as needed */
}

.table thead th {
	background-color: #343a40;
	color: #fff;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="Navbar.jsp"%>
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container mt-5">
		<c:if test="${not empty SuccMsg}">
			<h5 class="text-center text-success">${SuccMsg}</h5>
			<c:remove var="SuccMsg" scope="session" />
		</c:if>

		<c:if test="${not empty FailMsg}">
			<h5 class="text-center text-danger">${FailMsg}</h5>
			<c:remove var="FailMsg" scope="session" />
		</c:if>
		<table class="table table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Categories</th>
					<th scope="col">Copies</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getNotApprovedBooks(); // Method to fetch not approved books
				for (BookDtls b : list) {
				%>
				<tr>
					<td><%=b.getBookId()%></td>
					<td><img src="..\Book\<%=b.getPhotoName()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getCopies()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="approveBook.jsp?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-success"><i class="fa-solid fa-check"></i>&nbsp;Approve</a>
						<a href="edit_Books.jsp?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>&nbsp;Edit</a> 
						<a href="../delete?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>&nbsp;Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- Include Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
