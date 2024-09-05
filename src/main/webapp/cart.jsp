<%@page import="com.entity.Offer"%>
<%@page import="com.DAO.OffersDAOImpl"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<%@include file="All_Component/AllCSS.jsp"%>
<style>
.btn-custom {
	margin-right: 10px;
}

#toast {
	position: fixed;
	top: 20px;
	right: 20px;
	background-color: #28a745;
	color: white;
	padding: 10px;
	border-radius: 5px;
	display: none;
}

.display {
	display: block;
}

/* Custom border, padding, and spacing for sections */
.card-container {
	border: 1px solid #ddd;
	padding: 15px;
	border-radius: 5px;
	background-color: #f9f9f9;
	max-height: 590px; /* or any height that fits your design */
	overflow-y: auto;
}
</style>
</head>
<body>

	<%@include file="All_Component/Navbar.jsp"%>
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container mt-8">
		<div class="row">
			<div class="col-md-6 card-container margin-bottom">
				<h3>Shopping Cart</h3>
				<table class="table">
					<thead>
						<tr>
							<th>Book Name</th>
							<th>Author</th>
							<th>Price</th>
							<th>Copies</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						User u = (User) session.getAttribute("userobj");
						double grandTotal = 0.0; // Variable to hold the total price

						if (u != null) {
							CartDAOImpl cartDao = new CartDAOImpl(DBConnect.getConn());
							List<Cart> cartItems = cartDao.getCartItems(u.getId());

							if (cartItems != null && !cartItems.isEmpty()) {
								for (Cart item : cartItems) {
							if (item != null) { // Null check for each cart item
								grandTotal += item.getTotalPrice(); // Accumulate total price
						%>
						<tr>
							<td><%=item.getBookName() != null ? item.getBookName() : ""%></td>
							<td><%=item.getAuthor() != null ? item.getAuthor() : ""%></td>
							<td><%=item.getPrice()%></td>
							<td class="col-4">
								<form action="updateCartQuantity" method="post" class="d-inline">
									<input type="hidden" name="cid" value="<%=item.getCid()%>">
									<button type="submit" name="action" value="decrease"
										class="btn btn-outline-secondary btn-sm px-2">-</button>
									<span class="mx-2 fs-5"><%=item.getCopies()%></span>
									<button type="submit" name="action" value="increase"
										class="btn btn-outline-secondary btn-sm px-2">+</button>
								</form>
							</td>
							<td><a
								href="removeCart?cid=<%=item.getCid()%>&uid=<%=u.getId()%>"
								class="btn btn-danger">Remove</a></td>
						</tr>
						<%
						}
						}
						} else {
						%>
						<tr>
							<td colspan="5" class="text-center">No items in cart</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="5" class="text-center">User not logged in</td>
						</tr>
						<%
						}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3" class="text-right"><strong>Total:</strong></td>
							<td><strong><%=grandTotal%></strong></td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="col-md-5 card-container margin-bottom">
				<h3>Shipping Details</h3>
				<form action="order" method="post">
					<input type="hidden" value="${userobj.id}" name="id">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="name">Name</label> <input type="text"
								class="form-control" id="name" name="name"
								value="<%=u != null ? (u.getName() != null ? u.getName() : "") : ""%>"
								readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email"
								value="<%=u != null ? (u.getEmail() != null ? u.getEmail() : "") : ""%>"
								readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="mobile">Mobile</label> <input type="text"
								class="form-control" id="mobile" name="mobile"
								value="<%=u != null ? (u.getPhno() != null ? u.getPhno() : "") : ""%>"
								readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="address">Address</label> <input type="text"
								class="form-control" id="address" name="address"
								value="<%=u != null ? (u.getAddress() != null ? u.getAddress() : "") : ""%>"
								required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="landmark">Landmark</label> <input type="text"
								class="form-control" id="landmark" name="landmark"
								value="<%=u != null ? (u.getLandmark() != null ? u.getLandmark() : "") : ""%>"
								required>
						</div>
						<div class="form-group col-md-6">
							<label for="city">City</label> <input type="text"
								class="form-control" id="city" name="city"
								value="<%=u != null ? (u.getCity() != null ? u.getCity() : "") : ""%>"
								required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="state">State</label> <input type="text"
								class="form-control" id="state" name="state"
								value="<%=u != null ? (u.getState() != null ? u.getState() : "") : ""%>"
								required>
						</div>
						<div class="form-group col-md-6">
							<label for="pincode">Pincode</label> <input type="text"
								class="form-control" id="pincode" name="pincode"
								value="<%=u != null ? (u.getPincode() != null ? u.getPincode() : "") : ""%>"
								required>
						</div>
					</div>
					<!-- Add Offer Selection Dropdown -->
					<div class="form-group">
						<label for="offer">Select Offer</label> <select
							class="form-control" id="offer" name="offer"
							onchange="applyOffer()">
							<option value="">Select Offer</option>
							<%
							// Fetch offers from database
							OffersDAOImpl offerDao = new OffersDAOImpl(DBConnect.getConn());
							List<Offer> offers = offerDao.getAllOffers();

							if (offers != null && !offers.isEmpty()) {
								for (Offer offer : offers) {
							%>
							<option value="<%=offer.getOfferId()%>"
								data-discount="<%=offer.getDiscountPercentage()%>">
								<%=offer.getOfferTitle()%> -
								<%=offer.getDiscountPercentage()%>%
							</option>
							<%
							}
							} else {
							%>
							<option value="none">No Offers Available</option>
							<%
							}
							%>
						</select>
						<!-- Hidden fields to store offer ID and discounted price -->
						<input type="hidden" id="selectedOffer" name="selectedOffer"
							value=""> <input type="hidden"
							class="form-control" id="totalPrice" name="totalPrice"
							value="<%=grandTotal%>" readonly>
					</div>

					<!-- Total Price -->
					<div class="form-group">
						<label for="totalPrice">Discounted Total Price</label> <input type="text"
							class="form-control" id="discountedPrice" name="discountedPrice"
							value="<%=grandTotal%>" readonly>
					</div>

					<div class="form-group">
						<label for="paymentType">Payment Method</label> <select
							class="form-control" id="paymentType" name="paymentType">
							<option value="noselect">Select Payment Method</option>
							<option value="creditcard">Credit Card</option>
							<option value="paypal">PayPal</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">Place Order</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="All_Component/footer.jsp"%>
	<script>
		function applyOffer() {
			var select = document.getElementById('offer');
			var discount = parseFloat(select.options[select.selectedIndex]
					.getAttribute('data-discount')) || 0;
			var originalTotalPrice =
	<%=grandTotal%>
		;
			var discountedTotalPrice = originalTotalPrice
					* (1 - (discount / 100));
			document.getElementById('selectedOffer').value = select.value;
	        document.getElementById('discountedPrice').value = discountedTotalPrice.toFixed(2);;
			// You may need to add further logic to update the server-side cart with the selected offer
		}
	</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
