<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Login</title>
<%@include file="All_Component/AllCSS.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
    .card {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        max-width: 400px;
        margin: auto;
    }
    .card-body {
        padding: 20px;
    }
    .form-label {
        font-weight: bold;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
        border-radius: 20px;
        padding: 10px 20px;
        transition: background-color 0.3s ease;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .text-center a {
        display: block;
        margin-top: 10px;
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s ease;
    }
    .text-center a:hover {
        color: #0056b3;
    }
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="All_Component/Navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-4">Login</h3>
						 <c:if test="${not empty SuccMsg}">
                            <p class="text-center text-success">${SuccMsg}</p>
                            <c:remove var="SuccMsg" scope="session"/>
                        </c:if>
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email address</label>
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br>
								<a href="register.jsp">Create Account</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="All_Component/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
