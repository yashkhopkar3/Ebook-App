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
<div class="container p-1">
    <h3 class="text-center text-primary">Your Orders</h3>
    <table class="table table-striped mt-3">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Order Id</th>
                <th scope="col">User Name</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Address</th>
                <th scope="col">Phone</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
                <th scope="col">Copies</th>
                
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <th scope="row">${order.orderId}</th>
                    <td>${order.userName}</td>
                    <td>${order.bookName}</td>
                    <td>${order.author}</td>
                    <td>${order.fulladd}</td>
                    <td>${order.phno}</td>
                    <td>${order.price}</td>
                    <td>${order.paymentType}</td>
                    <td>${order.copies}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>