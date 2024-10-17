<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.Offer"%>
<%@page import="com.DAO.OffersDAOImpl"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.CartDAOImpl"%>
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
	font-size: 0.5rem; /* Smaller font size */
	padding: 1px 3px; /* Adjust padding for a smaller button */
}

#loadingOverlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 9999;
	display: none; /* Hidden by default */
}

.spinner-border {
	width: 3rem;
	height: 3rem;
}

.overlay-text {
	color: white;
	margin-top: 10px;
	font-size: 1.2rem;
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
	padding: 10px;
	border-radius: 5px;
	background-color: #f9f9f9;
	max-height: 500px; /* or any height that fits your design */
	overflow-y: auto;
}

.related-books-container {
	border: 1px solid #ddd;
	padding: 1px;
	border-radius: 5px;
	background-color: #f9f9f9;
	margin-top: 10px;
}

.book-card {
	width: 18rem;
	margin-bottom: 15px;
}

.view-all-btn {
	display: none;
	margin-top: 10px;
	text-align: center; /* Center the button */
}

.fs-1-custom {
	font-size: 12px;
	font-weight: bold;
}

.card-body img {
	width: 100%;
	height: auto ; /* Maintain aspect ratio */
}

.price {
	font-size: 12px;
	color: #28a745;
}

.card-container {
	width: 100%;
	max-width: 250px;
	margin: 0 auto;
	padding: 15px;
}

.book-action-buttons {
	display: flex;
	justify-content: center; /* Center the buttons horizontally */
	margin-top: 10px; /* Add some space above the buttons */
}

.book-action-buttons .btn {
	font-size: 0.75rem; /* Smaller font size */
	padding: 3px 6px; /* Adjust padding for smaller buttons */
	margin-right: 5px; /* Space between buttons */
}

.no-cart {
	pointer-events: none; /* Disable clicking on buttons if no cart */
	opacity: 0.5; /* Make buttons look disabled */
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
				<form id="orderForm" action="order" method="post">
					<input type="hidden" value="${userobj.id}" name="id">

					<!-- Hidden fields to store offer ID and discounted price -->
					<input type="hidden" id="selectedOffer" name="selectedOffer"
						value=""> <input type="hidden" class="form-control"
						id="totalPrice" name="totalPrice" value="<%=grandTotal%>" readonly>

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
								<%=offer.getDiscountPercentage()%>
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
							value=""> <input type="hidden" class="form-control"
							id="totalPrice" name="totalPrice" value="<%=grandTotal%>"
							readonly>
					</div>

					<!-- Total Price -->
					<div class="form-group">
						<label for="totalPrice">Discounted Total Price</label> <input
							type="text" class="form-control" id="discountedPrice"
							name="discountedPrice" value="<%=grandTotal%>" readonly>
					</div>

					<div class="form-group">
						<label for="paymentType">Payment Method</label> <select
							class="form-control" id="paymentType" name="paymentType">
							<option value="noselect">Select Payment Method</option>
							<option value="creditcard">Credit Card</option>
							<option value="paypal">PayPal</option>
						</select>
					</div>

					<button id="placeOrderBtn" type="submit"
						class="btn btn-primary btn-custom">Place Order</button>
				</form>
			</div>
		</div>
	</div>

	<!-- Loading overlay -->
	<div id="loadingOverlay">
		<div class="text-center">
			<div class="spinner-border" role="status"></div>
			<div class="overlay-text">Processing your order...</div>
		</div>
	</div>

	<!-- Toast Notification -->
	<div id="toast" class="toast">Order placed successfully!</div>

	<div class="container-fluid related-books-container" id="related-books">
    <h3 class="text-center mt-4">Related Books & Suggestions You Might Like</h3>
    
    <div id="relatedBooksCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2500"> <!-- Added auto-slide attributes -->
        <div class="carousel-inner">
            <%
            // Fetch related books for the user's cart
            User user = (User) session.getAttribute("userobj");
            List<BookDtls> relatedBooks = null;

            if (user != null) {
                BookDAOImpl bookDao = new BookDAOImpl(DBConnect.getConn());
                relatedBooks = bookDao.getRelatedBooksByCategoryOrAuthorForCart(user.getId());
            }

            if (relatedBooks != null && !relatedBooks.isEmpty()) {
                int count = 0; // To control batches of 4
                int batchSize = 4;
                boolean isFirstSlide = true;
                for (int i = 0; i < relatedBooks.size(); i += batchSize) {
            %>
            <div class="carousel-item <%= isFirstSlide ? "active" : "" %>">
                <div class="row">
                    <%
                    for (int j = i; j < i + batchSize && j < relatedBooks.size(); j++) {
                        BookDtls book = relatedBooks.get(j);
                        boolean isAvailable = "available".equalsIgnoreCase(book.getStatus());
                    %>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card-container">
                            <div class="card fs-1-custom">
                                <div class="card-body text-center">
                                    <img alt="<%=book.getBookName()%>"
                                        src="Book/<%=book.getPhotoName()%>" class="img-thumbnail">
                                    <p>Book Name: <%=book.getBookName()%></p>
                                    <p>Author: <%=book.getAuthor()%></p>
                                    <p class="price">Price: <i class="fa-solid fa-indian-rupee-sign"></i><%=book.getPrice()%></p>
                                    <div class="book-action-buttons <%=isAvailable ? "" : "no-cart"%>"
                                        style="display: flex; justify-content: center; margin-top: 10px;">
                                        <%
                                        if (isAvailable) {
                                        %>
                                        <a href="cart?bid=<%=book.getBookId()%>&&uid=<%=user.getId()%>&addCart=true"
                                            class="btn btn-success"
                                            style="font-size: 0.95rem; padding: 3px 6px; margin-right: 5px;">Add to Cart</a>
                                        <%
                                        }
                                        %>
                                        <a href="view_books.jsp?bid=<%=book.getBookId()%>"
                                            class="btn btn-outline-primary btn-custom <%=isAvailable ? "" : "no-cart"%>"
                                            style="font-size: 0.95rem; padding: 3px 6px; margin-right: 5px;">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
            <%
                isFirstSlide = false; // Only the first slide is active
                }
            }
            %>
        </div>
        
        <!-- Carousel Controls -->
        <a class="carousel-control-prev" href="#relatedBooksCarousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </a>
        <a class="carousel-control-next" href="#relatedBooksCarousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		function applyOffer() {
			// Handle offer application logic here
			var offerSelect = document.getElementById("offer");
            var selectedOffer = offerSelect.options[offerSelect.selectedIndex];
            var discount = selectedOffer.getAttribute("data-discount");
            var totalPrice = <%=grandTotal%>;
            var discountedPrice = totalPrice;

            if (discount) {
                discountedPrice = totalPrice - (totalPrice * discount / 100);
            }

            document.getElementById("discountedPrice").value = discountedPrice.toFixed(2);
            document.getElementById("selectedOffer").value = selectedOffer.value;
			console.log("Offer selected.");
		}

		// Show spinner when form is submitted
		document.getElementById("orderForm").onsubmit = function() {
			document.getElementById("loadingOverlay").style.display = "flex";
			document.getElementById("placeOrderBtn").disabled = true;
		}

		// Function to show toast notification
		function showToast(message) {
			var toast = document.getElementById("toast");
			toast.innerHTML = message;
			toast.classList.add("display");
			setTimeout(function() {
				toast.classList.remove("display");
			}, 3000);
		}

		// Example: Show success toast after placing the order
		// showToast("Order placed successfully!");
	</script>
</body>
</html>
