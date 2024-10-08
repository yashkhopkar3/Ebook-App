<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Order</title>
<%@include file="All_Component/AllCSS.jsp"%>
</head>
<body>
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="All_Component/Navbar.jsp"%>

<div class="container p-1">
    <h3 class="text-center text-primary">Your Order</h3>
    <table class="table table-striped mt-3">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Order Id</th>
                <th scope="col">Author</th>
                <th scope="col">Book Name</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
                <th scope="col">Copies</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <th scope="row">${order.orderId}</th>
                    <td>${order.author}</td>
                    <td>${order.bookName}</td>
                    <td>${order.price}</td>
                    <td>${order.paymentType}</td>
                    <td>${order.copies}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
