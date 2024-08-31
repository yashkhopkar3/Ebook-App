<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebooks Admin Dashboard</title>
<%@ include file="AllCSS.jsp"%>
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
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="Navbar.jsp"%>
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container mt-5">
		<div class="row d-flex justify-content-center">
			<!-- Add Books Card -->
			<div class="col-md-4 d-flex align-items-stretch mb-3">
				<div class="card text-center w-100">
					<div class="card-body">
						<a href="addBooks.jsp"> <i
							class="fas fa-plus-circle fa-3x text-primary"></i>
							<h5 class="card-title">Add Books</h5>
						</a>
					</div>
				</div>
			</div>

			<!-- All Books Card -->
			<div class="col-md-4 d-flex align-items-stretch mb-3">
				<div class="card text-center w-100">
					<div class="card-body">
						<a href="allBooks.jsp"> <i
							class="fas fa-book fa-3x text-danger"></i>
							<h5 class="card-title">All Books</h5>
						</a>
					</div>
				</div>
			</div>
			
			<!-- Not Approved Books Card -->
			<div class="col-md-4 d-flex align-items-stretch mb-3">
				<div class="card text-center w-100">
					<div class="card-body">
						<a href="notApprovedBooks.jsp"> <i
							class="fas fa-book fa-3x text-danger"></i>
							<h5 class="card-title">Not Approved Books</h5>
						</a>
					</div>
				</div>
			</div>
			
			<!-- Orders Card -->
			<div class="col-md-4 d-flex align-items-stretch mb-3">
				<div class="card text-center w-100">
					<div class="card-body">
						<a href="../allOrders"> <i class="fas fa-box fa-3x text-warning"></i>
							<h5 class="card-title">Orders</h5>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>
