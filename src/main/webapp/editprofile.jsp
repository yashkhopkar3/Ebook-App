<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="All_Component/AllCSS.jsp"%>
<style>
body {
	background-color: #f7f7f7;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
}

.edit-profile-container {
	margin-top: 50px;
}

.edit-profile-card {
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
}

.edit-profile-card-body {
	padding: 30px;
}

.edit-profile-form-label {
	font-weight: 600;
	color: #333;
}

.edit-profile-form-control {
	border-radius: 6px;
	border: 1px solid #ced4da;
	padding: 10px;
	font-size: 16px;
}

.edit-profile-form-control:focus {
	border-color: #007bff;
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}

.text-center {
	text-align: center;
}

h4 {
	font-size: 24px;
	font-weight: bold;
	color: #007bff;
	margin-bottom: 20px;
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
	<div class="container edit-profile-container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card edit-profile-card">
					<div class="card-body edit-profile-card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>
						<form action="register" method="post">
							<!-- Full Name -->
							<div class="mb-3">
								<label for="fullName" class="form-label edit-profile-form-label">Enter
									Full Name</label> <input type="text"
									class="form-control edit-profile-form-control" id="fullName"
									name="fname" value="<%=u.getName()%>" required>
							</div>

							<!-- Email -->
							<div class="mb-3">
								<label for="email" class="form-label edit-profile-form-label">Email
									address</label> <input type="email"
									class="form-control edit-profile-form-control" id="email"
									name="email"  value="<%=u.getEmail()%>" required>
							</div>

							<!-- Phone No -->
							<div class="mb-3">
								<label for="phoneNo" class="form-label edit-profile-form-label">Phone
									No</label> <input type="number"
									class="form-control edit-profile-form-control" id="phoneNo"
									name="phno" value="<%=u.getPhno()%>" required>
							</div>

							<!-- Password -->
							<div class="mb-3">
								<label for="password" class="form-label edit-profile-form-label">Password</label>
								<input type="password"
									class="form-control edit-profile-form-control" id="password"
									name="pass" value="<%=u.getPassword()%>" required>
							</div>

							<!-- Submit Button -->
							<button type="submit" class="btn btn-primary w-100">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="All_Component/footer.jsp"%>
</body>
</html>
