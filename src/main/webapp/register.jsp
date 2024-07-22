<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Register</title>
<%@include file="All_Component/AllCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="All_Component/Navbar.jsp"%>
    <div class="container p-2">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">

                        <h4 class="text-center">Registration Page</h4>

                        <c:if test="${not empty SuccMsg}">
                            <p class="text-center text-success">${SuccMsg}</p>
                            <c:remove var="SuccMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty FailMsg}">
                            <p class="text-center text-danger">${FailMsg}</p>
                            <c:remove var="FailMsg" scope="session"/>
                        </c:if>

                        <form action="register" method="post">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Enter Full Name</label>
                                <input type="text" class="form-control" id="exampleInputEmail1" name="fname" required>
                            </div>

                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" name="email" required>
                            </div>

                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Phone No</label>
                                <input type="number" class="form-control" id="exampleInputEmail1" name="phno" required>
                            </div>

                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="pass" required>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                                <label class="form-check-label" for="exampleCheck1">Agree terms & Conditions</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="All_Component/footer.jsp"%>
</body>
</html>
