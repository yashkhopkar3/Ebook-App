<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Dashboard</title>
<%@ include file="All_Component/AllCSS.jsp"%>
<style type="text/css">
body {
	background-color: #f7f7f7;
	font-family: Arial, sans-serif;
}

a {
	text-decoration: none !important;;
	color: black;
}

a:hover, a:active, a:focus, a:visited {
	text-decoration: none !important;; /* No underline */
	color: black; /* Keep the text black */
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	border-radius: 10px;
	overflow: hidden;
	background-color: #ffffff;
}

/* Custom background colors for each card */
.card-sell-old-book {
	background-color: #eaf4f4; /* Light cyan */
}

.card-login-security {
	background-color: #f9f9f9; /* Light gray */
}

.card-your-address {
	background-color: #fefce8; /* Light yellow */
}

.card-my-order {
	background-color: #fce8e8; /* Light pink */
}

.card-help-center {
	background-color: #e8f4f4; /* Light blue */
}

.card:hover {
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transform: translateY(-5px);
}

.card-body {
	padding: 20px;
}

.card-body h3, .card-body p {
	color: black;
	margin: 10px 0;
	transition: color 0.3s ease;
}

.card-body p {
	font-size: 1em;
	color: gray;
	transition: color 0.3s ease;
}

.card:hover h3, .card:hover p {
	color: black; /* Keep the text color black even on hover */
}

.text-center {
	text-align: center;
}

.mt-3 {
	margin-top: 1rem;
}

.text-dark i {
	color: #343a40; /* Dark for Book icon */
}

.text-success i {
	color: #28a745; /* Green for Login & Security icon */
}

.text-warning i {
	color: #ffc107; /* Yellow for Your Address icon */
}

.text-danger i {
	color: #dc3545; /* Red for My Order icon */
}

.text-info i {
	color: #17a2b8; /* Light blue for Help Center icon */
}
</style>
</head>
<body>


	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="All_Component/Navbar.jsp"%>

	<div class="container">
		<c:if test="${not empty userobj }">
			<h3 class="text-center">Hello, ${userobj.name}</h3>
		</c:if>
		<div class="row p-5">
			<div class="col-md-6">
				<a href="sell_books.jsp">
					<div class="card card-sell-old-book">
						<div class="card-body text-center">
							<div class="text-dark">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6">
				<a href="editprofile.jsp">
					<div class="card card-login-security">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<h3>Login & Security (Edit Profile)</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="user_address.jsp">
					<div class="card card-your-address">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fas fa-map-marker-alt fa-3x"></i>
							</div>
							<h3>Your Address</h3>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="order.jsp">
					<div class="card card-my-order">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h3>My Order</h3>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="helpline.jsp">
					<div class="card card-help-center">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@ include file="All_Component/footer.jsp"%>
</body>
</html>
