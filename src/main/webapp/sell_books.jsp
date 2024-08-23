<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Books</title>
<%@include file="All_Component/AllCSS.jsp"%>
<style>
/* General page styling */
body {
	background-color: #f7f7f7;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

/* Container specific to Sell Books page */
.sell-books-container {
	margin-top: 50px;
}

/* Card styling */
.sell-books-container .card {
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.sell-books-container .card-body {
	padding: 30px;
}

/* Form label styling */
.sell-books-container .form-label {
	font-weight: bold;
	color: #333;
}

/* Form control styling */
.sell-books-container .form-control {
	border-radius: 6px;
	border: 1px solid #ced4da;
	padding: 10px;
	font-size: 16px;
}

/* File input specific styling */
.sell-books-container .form-control[type="file"] {
	padding: 4px 10px; /* Adjust padding for better fit */
	line-height: normal; /* Ensure the line height is normal */
	font-size: 16px; /* Match font size with other inputs */
	overflow: hidden; /* Hide overflow */
}

/* Button styling */
.sell-books-container .btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 6px;
	padding: 12px 24px; /* Optimized padding */
	font-size: 18px; /* Standard font size */
	color: white;
	font-weight: bold;
	transition: background-color 0.3s ease;
}

.sell-books-container .btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}

/* Text center alignment */
.sell-books-container .text-center {
	text-align: center;
}

/* Form header styling */
.sell-books-container h5 {
	font-size: 24px;
	color: #007bff;
	margin-bottom: 20px;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="All_Component/Navbar.jsp"%>
	<%User u = (User) session.getAttribute("userobj"); %>
	<div class="container sell-books-container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center">Sell Old Books</h5>
						<c:if test="${not empty SuccMsg}">
                            <p class="text-center text-success">${SuccMsg}</p>
                            <c:remove var="SuccMsg" scope="session"/>
                        </c:if>
						<c:if test="${not empty FailMsg}">
							<h5 class="text-center text-danger">${FailMsg}</h5>
							<c:remove var="FailMsg" scope="session" />
						</c:if>
						<form action="addOldBook" method="post" enctype="multipart/form-data">
							<!-- Book Name -->
							<div class="mb-3">
								<label for="bookName" class="form-label">Book Name</label> <input
									type="text" class="form-control" id="bookName" name="bookName"
									required>
							</div>

							<!-- Author Name -->
							<div class="mb-3">
								<label for="authorName" class="form-label">Author Name</label> <input
									type="text" class="form-control" id="authorName"
									name="authorName" required>
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email address</label>
								<input type="email"
								class="form-control" id="email" name="email"
								value="<%=u.getEmail()%>" readonly>
							</div>

							<div class="mb-3">
								<label for="bookCategories" class="form-label">Book
									Categories</label> <select class="form-control" id="bookCategories"
									name="bookCategories" required>
									<option value="" disabled selected>--select--</option>
									<option value="Autobiography">Autobiography</option>
									<option value="History">History</option>
									<option value="Humor">Humor</option>
									<option value="Mystery">Mystery</option>
									<option value="Romantic">Romantic</option>
								</select>
							</div>

							<!-- Price -->
							<div class="mb-3">
								<label for="price" class="form-label">Price</label> <input
									type="number" step="0.01" class="form-control" id="price"
									name="price" required>
							</div>

							<!-- Upload Photo -->
							<div class="mb-3">
								<label for="uploadPhoto" class="form-label">Upload Photo</label>
								<input type="file" class="form-control" id="uploadPhoto"
									name="uploadPhoto" required>
							</div>

							<!-- Submit Button -->
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Sell</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="All_Component/footer.jsp"%>
</body>
</html>
