<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>24/7 Service Help Line</title>
    <%@ include file="All_Component/AllCSS.jsp" %>
</head>
<body style="background-color: #f0f1f2;">

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <%@ include file="All_Component/Navbar.jsp" %>

    <div class="container">
        <div class="row justify-content-center align-items-center" style="min-height: 80vh;">
            <div class="col-md-6 text-center">
                <div class="text-success mb-4">
                    <i class="fas fa-phone-square-alt fa-5x"></i>
                </div>
                <h3 class="mb-3">24/7 Service</h3>
                <h4 class="mb-3">Help Line Number</h4>
                <h5 class="mb-4">+91 869899023</h5>
                <a href="index.jsp" class="btn btn-primary">Home</a>
            </div>
        </div>
    </div>

    <%@ include file="All_Component/footer.jsp" %>

</body>
</html>
