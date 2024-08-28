<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
<link rel="stylesheet" href="path/to/bootstrap.css">
<link rel="stylesheet" href="path/to/fontawesome.css">
<%@include file="All_Component/AllCSS.jsp"%>
<style type="text/css">
/* General Styles */
.back-img {
    background: url("Book/Bookbg.jpg") center center/cover no-repeat;
    height: 50vh;
    width: 100%;
}

.fs-1-custom {
    font-size: 12px;
    font-weight: bold;
}

.card-body img {
    width: 100%;
    height: 250px;
}

.price {
    font-size: 12px;
    color: #28a745;
}

.card-container {
    width: 100%;
    max-width: 250px;
    margin: 0 auto;
    padding: 15px;
    
}

.carousel-inner img {
    width: 100%;
    height: 50vh;
    object-fit: cover;
}

.carousel-caption h2 {
    background-color: rgba(0, 0, 0, 0.5);
    padding: 0.5rem;
    border-radius: 0.5rem;
}

/* Buttons */
.btn-custom {
    font-size: 13px; /* Default font size for buttons */
    padding: 7px 12px; /* Default padding for buttons */
}

.btn-custom.no-cart {
    font-size: 11px; /* Increased font size when "Add to Cart" is not present */
    padding: 7px 10px; /* Larger padding when "Add to Cart" is not present */
}

.btn-custom:first-child {
    font-size: 13px;
    padding: 5px 5px;
    margin-left: -10px;
}

.btn-custom .fa {
    margin-right: 2px;
}

/* Buttons Alignment */
.row-buttons {
    display: flex;
    margin-left: 0px;
    justify-content: space-between; /* Space between buttons by default */
}

.row-buttons.no-cart {
    justify-content: center; /* Center buttons when "Add to Cart" is not present */
}

.row-buttons .btn-outline-primary {
    font-size: 13px; /* Default font size for "View Details" button */
    padding: 7px 12px; /* Default padding for "View Details" button */
}

.row-buttons.no-cart .btn-outline-primary {
    font-size: 14px; /* Increased font size for "View Details" button when "Add to Cart" is not present */
    padding: 10px 15px; /* Larger padding for "View Details" button when "Add to Cart" is not present */
}

/* Toast Container */
#toast {
    min-width: 300px;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: #333;
    padding: 15px;
    color: white;
    text-align: center;
    z-index: 9999;
    font-size: 16px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
    visibility: hidden;
    opacity: 0;
    transition: opacity 0.5s, transform 0.5s;
}

/* Display Toast */
#toast.display {
    visibility: visible;
    opacity: 1;
    transform: translate(-50%, -50%);
}

/* Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translate(-50%, -60%);
    }
    to {
        opacity: 1;
        transform: translate(-50%, -50%);
    }
}

@keyframes fadeOut {
    from {
        opacity: 1;
        transform: translate(-50%, -50%);
    }
    to {
        opacity: 0;
        transform: translate(-50%, -60%);
    }
}

/* Toast Display and Hide */
#toast.display {
    animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@media (max-width: 576px) {
    .row-buttons {
        flex-direction: column;
        align-items: center; /* Center buttons on small screens */
    }
}

</style>
<!-- Add any other stylesheets you use -->
</head>
<body>
    <%
    User u = (User) session.getAttribute("userobj");
    %>
    <jsp:include page="All_Component/Navbar.jsp" />

    <%
    String query = request.getParameter("query");
    BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
    List<BookDtls> recentBooks = dao2.searchBooks(query);

    if (recentBooks != null && !recentBooks.isEmpty()) {
    %>
    <div class="container-fluid" id="recent-books">
        <br>
        <h3 class="text-center mt-4">Search Results</h3>
        <div class="row">
            <%
            for (BookDtls b : recentBooks) {
                boolean isAvailable = "available".equalsIgnoreCase(b.getStatus());
            %>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="<%= b.getBookName() %>" src="Book/<%= b.getPhotoName() %>"
                                class="img-thumbnail">
                            <p>Book Name: <%= b.getBookName() %></p>
                            <p>Author: <%= b.getAuthor() %></p>
                            <p class="price">Price: <i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></p>
                            <div class="row-buttons <%= isAvailable ? "" : "no-cart" %>">
                                <% if (isAvailable) { %>
                                    <% if (u == null) { %>
                                        <a href="login.jsp" class="btn btn-primary btn-custom">
                                            <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                        </a>
                                    <% } else { %>
                                        <a href="cart?bid=<%= b.getBookId() %>&uid=<%= u.getId() %>&addCart=true" class="btn btn-primary btn-custom">
                                            <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                        </a>
                                    <% } %>
                                <% } %>
                                <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-outline-primary btn-custom <%= isAvailable ? "" : "no-cart" %>">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    <%
    } else {
    %>
    <div class="container-fluid">
        <h3 class="text-center mt-4">No Books Found</h3>
    </div>
    <%
    }
    %>

</body>
</html>
