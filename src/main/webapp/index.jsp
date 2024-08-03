<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookMart</title>
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
</head>
<body>
<%
User u = (User) session.getAttribute("userobj");
%>

<%
if (request.getParameter("addCart") != null) {
    session.setAttribute("addCartMessage", "Book added to cart successfully!");
    response.sendRedirect("index.jsp");
    return;
}
%>
<c:if test="${not empty sessionScope.addCartMessage}">
    <div id="toast">${sessionScope.addCartMessage}</div>
    <script type="text/javascript">
        showToast();
        function showToast() {
            $('#toast').addClass("display");
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 2000);
        }
    </script>
    <%
        session.removeAttribute("addCartMessage");
    %>
</c:if>

<%@include file="All_Component/Navbar.jsp"%>



<!-- Carousel Slider -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="Book/Bookbg1.jpg" alt="First slide">
            <div class="carousel-caption d-none d-md-block"></div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="Book/Bookbg2.png" alt="Second slide">
            <div class="carousel-caption d-none d-md-block"></div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="Book/Bookbg3.png" alt="Third slide">
            <div class="carousel-caption d-none d-md-block"></div>
        </div>
        <div class="carousel-item">
            <!-- add link to offer section -->
            <a href="offer.jsp"><img class="d-block w-100" src="Book/Slider4.png" alt="Fourth slide"></a>
            <div class="carousel-caption d-none d-md-block"></div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<%-- Start of Recent Books --%>
<%
BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
List<BookDtls> recentBooks = dao2.getRecentBooks();
if (recentBooks.size() > 2) {
%>
<div class="container-fluid" id="recent-books">
    <br>
    <h3 class="text-center mt-4">Recent Books</h3>
    <div class="row">
        <%
        for (BookDtls b : recentBooks) {
            boolean isAvailable = "available".equalsIgnoreCase(b.getStatus());
        %>
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="card-container">
                <div class="card fs-1-custom">
                    <div class="card-body text-center">
                        <img alt="<%=b.getBookName()%>" src="Book/<%=b.getPhotoName()%>" class="img-thumbnail">
                        <p>Book Name: <%=b.getBookName()%></p>
                        <p>Author: <%=b.getAuthor()%></p>
                        <p class="price">Price: <i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></p>
                        <div class="row-buttons <%= isAvailable ? "" : "no-cart" %>">
                            <%
                            if (isAvailable) {
                                if (u == null) {
                            %>
                            <a href="login.jsp" class="btn btn-primary btn-custom">
                                <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                            </a>
                            <%
                                } else {
                            %>
                            <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&addCart=true" class="btn btn-primary btn-custom">
                                <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                            </a>
                            <%
                                }
                            }
                            %>
                            &nbsp; 
                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-outline-primary btn-custom <%= isAvailable ? "" : "no-cart" %>">
                                View Details
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
        }
        %>
    </div>
</div>
<%
}
%>

<!-- End of Recent Books -->

	<!--Start of New Books-->
	<div class="container-fluid" id="new-books">
		<br>
		<h3 class="text-center mt-4">New Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3 col-sm-6 mb-4">
				<div class="card-container">
					<div class="card fs-1-custom">
						<div class="card-body text-center">
							<img alt="<%=b.getBookName()%>"
								src="Book/<%=b.getPhotoName()%>" class="img-thumbnail">
							<p>
								Book Name:
								<%=b.getBookName()%></p>
							<p>
								Author:
								<%=b.getAuthor()%></p>
							<p class="price">
								Price: <i class="fa-solid fa-indian-rupee-sign"></i>
								<%=b.getPrice()%></p>
							<div class="row-buttons">
								<%
								if (u == null) {
								%>
								<a href="login.jsp" class="btn btn-primary btn-custom"> <i
									class="fa-solid fa-cart-shopping"></i> Add to Cart
								</a>
								<%
								} else {
								%>
								<a
									href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&addCart=true"
									class="btn btn-primary btn-custom"> <i
									class="fa-solid fa-cart-shopping"></i> Add to Cart
								</a>
								<%
								}
								%>
								&nbsp; <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-outline-primary btn-custom">View
									Details</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<!--End of New Books-->

	<!--Start of Old Books-->
	<div class="container-fluid" id="old-books">
		<br>
		<h3 class="text-center mt-4">Old Books</h3>
		<div class="row">
			<%
			// Fetch old books from database
			BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> oldBooks = dao1.getOldBooks();
			for (BookDtls b : oldBooks) {
			%>
			<div class="col-md-3 col-sm-6 mb-4">
				<div class="card-container">
					<div class="card fs-1-custom">
						<div class="card-body text-center">
							<img alt="<%=b.getBookName()%>"
								src="Book/<%=b.getPhotoName() %>" class="img-thumbnail">
							<p>
								Book Name:
								<%=b.getBookName()%></p>
							<p>
								Author:
								<%=b.getAuthor()%></p>
							<p class="price">
								Price: <i class="fa-solid fa-indian-rupee-sign"></i>
								<%=b.getPrice()%></p>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-custom text-center">View
								Details</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<!--End of Old Books-->

	<%@include file="All_Component/footer.jsp"%>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const links = document.querySelectorAll('a[href^="#"]');

	    for (const link of links) {
	        link.addEventListener("click", function(event) {
	            event.preventDefault();

	            const targetId = this.getAttribute("href").substring(1);
	            const targetElement = document.getElementById(targetId);

	            if (targetElement) {
	                customSmoothScroll(targetElement, 1000); // Adjust duration here
	            }
	        });
	    }

	    function customSmoothScroll(targetElement, duration) {
	        const start = window.pageYOffset;
	        const targetPosition = targetElement.getBoundingClientRect().top;
	        const startTime = performance.now();

	        function animation(currentTime) {
	            const timeElapsed = currentTime - startTime;
	            const run = easeInOutQuad(timeElapsed, start, targetPosition, duration);
	            window.scrollTo(0, run);

	            if (timeElapsed < duration) {
	                requestAnimationFrame(animation);
	            }
	        }

	        function easeInOutQuad(t, b, c, d) {
	            t /= d / 2;
	            if (t < 1) return c / 2 * t * t + b;
	            t--;
	            return -c / 2 * (t * (t - 2) - 1) + b;
	        }

	        requestAnimationFrame(animation);
	    }
	});

    </script>
</body>
</html>