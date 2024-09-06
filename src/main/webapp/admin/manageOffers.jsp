<%@page import="com.entity.Offer"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OffersDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Offers</title>
<%@ include file="AllCSS.jsp"%>
<!-- Include Bootstrap CSS for styling -->
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color: #f0f1f2;">
    <%@ include file="Navbar.jsp"%>
    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp" />
    </c:if>
    <div class="container mt-5">
        <c:if test="${not empty SuccMsg}">
            <h5 class="text-center text-success">${SuccMsg}</h5>
            <c:remove var="SuccMsg" scope="session" />
        </c:if>

        <c:if test="${not empty FailMsg}">
            <h5 class="text-center text-danger">${FailMsg}</h5>
            <c:remove var="FailMsg" scope="session" />
        </c:if>
        <table class="table table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Photo</th>
                    <th scope="col">Offer Title</th>
                    <th scope="col">Description</th>
                    <th scope="col">Discount Percentage</th>
                    <th scope="col">Expiry Date</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                OffersDAOImpl dao = new OffersDAOImpl(DBConnect.getConn());
                List<Offer> list = dao.getAllOffers();
                for (Offer o : list) {
                %>
                <tr>
                    <td><%=o.getOfferId()%></td>
                    <td><img src="..\Book\<%=o.getPhoto()%>"
                        style="width: 50px; height: 50px;"></td>
                    <td><%=o.getOfferTitle()%></td>
                    <td><%=o.getDescription()%></td>
                    <td><%=o.getDiscountPercentage()%></td>
                    <td><%=o.getExpiryDate()%></td>
                    <td><a href="edit_Offer.jsp?id=<%=o.getOfferId()%>"
                        class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>&nbsp;Edit</a> 
                        <a href="../deleteOffer?id=<%=o.getOfferId()%>"
                        class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>&nbsp;Delete</a></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
