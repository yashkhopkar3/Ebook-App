<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order List</title>
<!-- Include Bootstrap CSS for styling -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color: #f0f1f2;">
<%@ include file="Navbar.jsp" %> <!-- Include Navbar if you have one -->
<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp" />
	</c:if>
<div class="container mt-5">
    <h1 class="mb-4">Order List</h1>
    <table class="table table-striped table-hover">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Phone Number</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
        </thead>
        <tbody>
            <!-- Sample row data -->
            <tr>
                <td>1</td>
                <td>John Doe</td>
                <td>john.doe@example.com</td>
                <td>123 Main St, Anytown, USA</td>
                <td>(123) 456-7890</td>
                <td>The Great Book</td>
                <td>Jane Smith</td>
                <td>$29.99</td>
                <td>Credit Card</td>
            </tr>
            <!-- Add additional rows dynamically here -->
            <!-- Example for no data -->
            <!--
            <tr>
                <td colspan="9" class="text-center">No orders available</td>
            </tr>
            -->
        </tbody>
    </table>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
