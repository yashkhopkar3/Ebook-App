<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Address</title>
<%@include file="All_Component/AllCSS.jsp"%>
<style>
    body {
        background-color: #f0f1f2;
    }
    .card {
        border-radius: 15px;
        border: 1px solid #e3e3e3;
    }
    .card-body {
        padding: 2rem;
    }
    .form-group label {
        font-weight: bold;
    }
    .form-control {
        border-radius: 10px;
        box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
    }
    .btn-warning {
        background-color: #ffc107;
        border-color: #ffc107;
        border-radius: 10px;
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
    }
    .btn-warning:hover {
        background-color: #e0a800;
        border-color: #d39e00;
    }
    .text-center {
        margin-top: 1rem;
    }
</style>
</head>
<body>
<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
<%@include file="All_Component/Navbar.jsp"%>
<%
        User u = (User) session.getAttribute("userobj");
%>
<div class="container">
    <div class="row p-3">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">Add Address</h3>
                    <form action="">

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="address">Address</label> 
                                <input type="text" class="form-control" id="address" name="address" value="<%=u.getAddress()%>" >
                            </div>

                            <div class="form-group col-md-6">
                                <label for="landmark">Landmark</label> 
                                <input type="text" class="form-control" id="landmark" name="landmark" value="<%=u.getLandmark()%>">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="city">City</label> 
                                <input type="text" class="form-control" id="city" name="city" value="<%=u.getCity()%>">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="state">State</label> 
                                <input type="text" class="form-control" id="state" name="state" value="<%=u.getState()%>">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="pincode">Pincode</label> 
                                <input type="text" class="form-control" id="pincode" name="pincode" value="<%=u.getPincode()%>">
                            </div>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-warning">Add Address</button>
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