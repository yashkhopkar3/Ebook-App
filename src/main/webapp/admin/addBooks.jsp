<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Books</title>
<%@ include file="AllCSS.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
    .card {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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
<%@ include file="Navbar.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-4">Add Book</h3>
                    
                    <form action="addBook" method="post" enctype="multipart/form-data">
                        <!-- Book Name -->
                        <div class="mb-3">
                            <label for="bookName" class="form-label">Book Name</label>
                            <input type="text" class="form-control" id="bookName" name="bookName" required>
                        </div>
                        
                        <!-- Author Name -->
                        <div class="mb-3">
                            <label for="authorName" class="form-label">Author Name</label>
                            <input type="text" class="form-control" id="authorName" name="authorName" required>
                        </div>
                        
                        <!-- Price -->
                        <div class="mb-3">
                            <label for="price" class="form-label">Price</label>
                            <input type="number" class="form-control" id="price" name="price" required>
                        </div>
                        
                        <!-- Book Categories -->
                        <div class="mb-3">
                            <label for="bookCategories" class="form-label">Book Categories</label>
                            <select class="form-control" id="bookCategories" name="bookCategories" required>
                                <option value="" disabled selected>--select--</option>
                                <option value="Autobiography">Autobiography</option>
                                <option value="History">History</option>
                                <option value="Humor">Humor</option>
                                <option value="Mystery">Mystery</option>
                                <option value="Romantic">Romantic</option>
                            </select>
                        </div>
                        
                        <!-- Book Status -->
                        <div class="mb-3">
                            <label for="bookStatus" class="form-label">Book Status</label>
                            <select class="form-control" id="bookStatus" name="bookStatus" required>
                                <option value="" disabled selected>--select--</option>
                                <option value="Available">Available</option>
                                <option value="Unavailable">Unavailable</option>
                            </select>
                        </div>
                        
                        <!-- Upload Photo -->
                        <div class="mb-3">
                            <label for="uploadPhoto" class="form-label">Upload Photo</label>
                            <input type="file" class="form-control" id="uploadPhoto" name="uploadPhoto" required>
                        </div>
                        
                        <!-- Submit Button -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Add</button>
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
