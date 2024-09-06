<%@page import="com.entity.Offer"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OffersDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Edit Offers</title>
<%@ include file="AllCSS.jsp"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.card {
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 500px;
	margin: auto;
}

.card-body {
	padding: 20px;
}

.form-label {
	font-weight: bold;
}

.btn-primary {
	background-color: #007bff;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	transition: background-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.text-center a {
	display: block;
	margin-top: 10px;
	color: #007bff;
	text-decoration: none;
	transition: color 0.3s ease;
}

.text-center a:hover {
	color: #0056b3;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="Navbar.jsp"%>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-4">Edit Offer</h3>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						OffersDAOImpl dao = new OffersDAOImpl(DBConnect.getConn());
						Offer offer = dao.getOfferById(id); // Assuming you have this method
						%>

						<form action="../edit_offers" method="post">
							<input type="hidden" name="id" value="<%=offer.getOfferId()%>">
							
							<div class="mb-3">
								<label for="offerTitle" class="form-label">Offer Title</label>
								<input type="text" class="form-control" id="offerTitle" name="offerTitle"
									value="<%=offer.getOfferTitle()%>" required>
							</div>

							<div class="mb-3">
								<label for="description" class="form-label">Description</label>
								<textarea class="form-control" id="description" name="description" rows="3" required><%=offer.getDescription()%></textarea>
							</div>

							<div class="mb-3">
								<label for="discountPercentage" class="form-label">Discount Percentage</label>
								<input type="number" step="0.01" class="form-control" id="discountPercentage" name="discountPercentage"
									value="<%=offer.getDiscountPercentage()%>" required>
							</div>

							<div class="mb-3">
								<label for="expiryDate" class="form-label">Expiry Date</label>
								<input type="date" class="form-control" id="expiryDate" name="expiryDate"
									value="<%=offer.getExpiryDate()%>" required>
							</div>

							<div class="mb-3">
								<label for="photo" class="form-label">Photo</label>
								<input type="text" class="form-control" id="photo" name="photo"
									value="<%=offer.getPhoto()%>" required>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
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
</body>
</html>
