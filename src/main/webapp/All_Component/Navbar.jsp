<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.entity.User"%>
<%@ page import="com.DAO.CartDAO" %>
<%@page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- Navbar.jsp -->
<%
User ua = (User) session.getAttribute("userobj");
int cartCount = 0;

if (ua != null) {
    Connection conn = null;

    try {
        // Obtain the database connection
        conn = DBConnect.getConn();

        if (conn != null) {
            CartDAO cartDAO = new CartDAOImpl(conn);
            cartCount = cartDAO.getCartItemCount(ua.getId());
        } else {
            // Handle the case where the connection is not available
            out.println("Database connection is not available.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Ensure the connection is properly closed or returned to the pool if applicable
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
%>

<div class="container-fluid p-3 bg-light">
    <div class="row align-items-center">
        <div class="col-md-3">
            <h3>BookMart</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2 w-75" type="search" placeholder="Search for books" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">
                    <i class="fa-solid fa-search"></i> Search
                </button>
            </form>
        </div>
        <div class="col-md-3 text-right">
            <c:choose>
                <c:when test="${not empty userobj}">
                    <div class="dropdown">
                        <span class="mr-2 dropdown-toggle" id="userDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa-solid fa-user"></i> ${userobj.name}
                        </span>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="settings.jsp"><i class="fa-solid fa-cog"></i> Settings</a>
                            <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">
                                <i class="fa-solid fa-right-from-bracket"></i> Logout
                            </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="btn btn-outline-success mr-2"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                    <a href="register.jsp" class="btn btn-outline-primary"><i class="fa-solid fa-user"></i> Register</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Logout Confirmation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <h4>Do you want to logout?</h4>
                <a href="logout" class="btn btn-primary">Logout</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"><a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#recent-books"><i class="fa-solid fa-book-open-reader"></i> Recent</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#old-books"><i class="fa-solid fa-book-open"></i> Old Books</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#new-books"><i class="fa-solid fa-plane-arrival"></i> New Arrivals</a></li>
                <li class="nav-item"><a class="nav-link" href="categories.jsp"><i class="fa-solid fa-list"></i> Categories</a></li>
                <li class="nav-item"><a class="nav-link" href="Offer.jsp"><i class="fa-solid fa-envelope"></i> Offers</a></li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <%
                if (ua== null) {
                %>
                <a href="login.jsp" class="btn btn-primary my-2 my-sm-0 ml-2" type="button">
                    <i class="fa-solid fa-cart-shopping"></i> View Cart
                </a>
                <%
                } else {
                %>
                <a href="cart.jsp" class="btn btn-primary my-2 my-sm-0 ml-2" type="button">
                    <i class="fa-solid fa-cart-shopping"></i> View Cart
                    <%
                    if (cartCount > 0) {
                    %>
                    <span class="cart-count"><%= cartCount %></span> 
                    <%
                    }
                    %>
                </a>
                <%
                }
                %>

                <button class="btn btn-outline-dark my-2 my-sm-0 ml-2" type="button">
                    <i class="fa-solid fa-phone"></i> Contact Us
                </button>
            </form>
        </div>
    </div>
</nav>

<!-- Include FontAwesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
    .navbar {
        margin-bottom: 20px;
    }

    .navbar-nav .nav-item {
        margin-right: 15px;
    }

    .navbar-nav .nav-item .nav-link {
        font-size: 1.1rem;
    }

    .navbar-toggler {
        border: none;
    }

    .navbar-toggler:focus {
        outline: none;
    }

    .form-inline .btn {
        border-radius: 20px;
        transition: background-color 0.3s ease;
    }

    .form-inline .btn:hover {
        background-color: #0056b3;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 3;
    }

    .cart-count {
    position: relative;
    display: inline-block;
    background: red;
    color: white;
    border-radius: 50%;
    padding: 0 5px;
    font-size: 16px;
    line-height: 1;
    text-align: center;
    vertical-align: top;
    margin-left: 5px;
}
</style>
