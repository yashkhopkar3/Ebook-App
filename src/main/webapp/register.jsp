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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
    .card {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        max-width: 450px;
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
    .form-check-label {
        font-size: 0.9rem;
    }
    .text-center {
        margin-top: 10px;
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
    .password-toggle {
        position: relative;
    }
    .password-toggle .toggle-btn {
        position: absolute;
        top: 70%;
        right: 10px;
        transform: translateY(-50%);
        cursor: pointer;
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
                        <h4 class="text-center mb-4">Registration Page</h4>
                        
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
                                <label for="fullName" class="form-label">Enter Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fname" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email address</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>

                            <div class="mb-3">
                                <label for="phoneNo" class="form-label">Phone No</label>
                                <input type="tel" class="form-control" id="phoneNo" name="phno" 
                                       pattern="[0-9]{10}" title="Phone number should be 10 digits" required>
                            </div>

                            <div class="mb-3 password-toggle">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="pass" 
                                       pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}" 
                                       title="Password must be 8-16 characters long, with at least one uppercase letter, one number, and one special character" required>
                                <span class="toggle-btn" onclick="togglePassword()">
                                    <i class="fas fa-eye"></i>
                                </span>
                            </div>

                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check" required>
                                <label class="form-check-label" for="exampleCheck1">Agree to terms & Conditions</label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </form>

                        <div class="text-center mt-3">
                            <a href="login.jsp">Already have an account? Login here</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="All_Component/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function togglePassword() {
        var passwordField = document.getElementById("password");
        var toggleBtn = document.querySelector(".toggle-btn i");
        if (passwordField.type === "password") {
            passwordField.type = "text";
            toggleBtn.classList.remove("fa-eye");
            toggleBtn.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            toggleBtn.classList.remove("fa-eye-slash");
            toggleBtn.classList.add("fa-eye");
        }
    }
</script>
</body>
</html>
