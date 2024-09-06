<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Offer</title>
<%@ include file="AllCSS.jsp"%>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.card {
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 500px;
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
    <%@ include file="Navbar.jsp"%>
    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp" />
    </c:if>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Add Offer</h3>
                        <c:if test="${not empty SuccMsg}">
                            <p class="text-center text-success">${SuccMsg}</p>
                            <c:remove var="SuccMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty FailMsg}">
                            <p class="text-center text-danger">${FailMsg}</p>
                            <c:remove var="FailMsg" scope="session" />
                        </c:if>
                        <form action="../add_offer" method="post" enctype="multipart/form-data">

                            <!-- Offer Title -->
                            <div class="mb-3">
                                <label for="offerTitle" class="form-label">Offer Title</label>
                                <input type="text" class="form-control" id="offerTitle" name="offerTitle" required>
                            </div>

                            <!-- Description -->
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" required></textarea>
                            </div>

                            <!-- Discount Percentage -->
                            <div class="mb-3">
                                <label for="discountPercentage" class="form-label">Discount Percentage</label>
                                <input type="number" step="0.01" class="form-control" id="discountPercentage"
                                    name="discountPercentage" required>
                            </div>

                            <!-- Expiry Date -->
                            <div class="mb-3">
                                <label for="expiryDate" class="form-label">Expiry Date</label>
                                <input type="date" class="form-control" id="expiryDate" name="expiryDate" required>
                            </div>

                            <!-- Upload Photo -->
                            <div class="mb-3">
                                <label for="uploadPhoto" class="form-label">Upload Offer Image</label>
                                <input type="file" class="form-control" id="uploadPhoto" name="uploadPhoto" required>
                            </div>

                            <!-- Submit Button -->
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Add Offer</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
