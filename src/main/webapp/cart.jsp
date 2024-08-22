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
	max-height: 540px; /* or any height that fits your design */
	overflow-y: auto;
}
</style>
</head>
<body>

	<%@include file="All_Component/Navbar.jsp"%>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

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

							for (Cart item : cartItems) {
								grandTotal += item.getTotalPrice(); // Accumulate total price
						%>
						<tr>
							<td><%=item.getBookName()%></td>
							<td><%=item.getAuthor()%></td>
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
						} else {
						%>
						<tr>
							<td colspan="4" class="text-center">No items in cart</td>
						</tr>
						<%
						}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" class="text-right"><strong>Total:</strong></td>
							<td><strong><%=grandTotal%></strong></td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="col-md-5 card-container margin-bottom">
				<h3>Shipping Details</h3>
				<form action="order" method="post">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="name">Name</label> <input type="text"
								class="form-control" id="name" name="name"
								value="<%=u.getName()%>" readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email"
								value="<%=u.getEmail()%>" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="mobile">Mobile No</label> <input type="text"
								class="form-control" id="mobile" name="mobile"
								value="<%=u.getPhno()%>" readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="address">Address</label> <input type="text"
								class="form-control" id="address" name="address"
								value="<%=u.getAddress()%>" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="Landmark">Landmark</label> <input type="text"
								class="form-control" id="landmark" name="landmark"
								value="<%=u.getLandmark()%>" required>
						</div>
						<div class="form-group col-md-6">
							<label for="city">City</label> <input type="text"
								class="form-control" id="city" name="city"
								value="<%=u.getCity()%>" required>
						</div>

					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="state">State</label> <input type="text"
								class="form-control" id="state" name="state"
								value="<%=u.getState()%>" required>
						</div>
						<div class="form-group col-md-6">
							<label for="pincode">Pincode</label> <input type="text"
								class="form-control" id="pincode" name="pincode"
								value="<%=u.getPincode()%>" required>
						</div>
					</div>
					<div class="form-group">
						<label for="paymentType">Payment Type</label> <select
							class="form-control" id="paymentType" name="paymentType" required>
							<option value="" disabled selected>--select--</option>
							<option value="credit_card">Credit Card</option>
							<option value="debit_card">Debit Card</option>
							<option value="net_banking">Net Banking</option>
							<option value="cash_on_delivery">Cash on Delivery</option>
						</select>
					</div>
					<button type="submit" class="btn btn-warning btn-custom">Order
						Now</button>
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
				</form>
			</div>
		</div>
	</div>

	<c:if test="${not empty sessionScope.addCartMessage}">
		<div id="toast">${sessionScope.addCartMessage}</div>
		<script type="text/javascript">
            document.addEventListener("DOMContentLoaded", function() {
                const toast = document.getElementById('toast');
                toast.classList.add("display");
                setTimeout(() => {
                    toast.classList.remove("display");
                }, 2000);
            });
        </script>
		<%
		session.removeAttribute("addCartMessage");
		%>
	</c:if>
	<%@include file="All_Component/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
