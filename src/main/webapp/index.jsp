<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookMart</title>
<%@include file="All_Component/AllCSS.jsp"%>
<style type="text/css">
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

.btn-custom:first-child {
	font-size: 12px;
	padding: 5px 5px;
	margin-left: -10px;
}

.btn-custom .fa {
	margin-right: 2px;
}

.row-buttons {
	display: flex;
	margin-left: 0px;
	justify-content: space-between;
}

@media ( max-width : 576px) {
	.row-buttons {
		flex-direction: column;
	}
	.row-buttons a {
		
	}
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

.card-container {
	width: 100%;
	max-width: 250px;
	margin: 0 auto;
	padding: 15px;
}
</style>
</head>
<body>

	<%
	User u =(User)session.getAttribute("userobj");
	%>
	<%@include file="All_Component/Navbar.jsp"%>

	<!-- Carousel Slider -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" data-interval="5000">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
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
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!--Start of Recent-->
	<div class="container-fluid" id="recent-books">
	<br>
		<h3 class="text-center mt-4">Recent Books</h3>
		<div class="row">
			<div class="col-md-3 col-sm-6 mb-4">
				<div class="card-container">
					<div class="card fs-1-custom">
						<div class="card-body text-center">
							<img alt="Energize Your Mind" src="Book/RBook1.png"
								class="img-thumbnail">
							<p>Book Name : Energize Your Mind</p>
							<p>Author : Gaur Gopal Das</p>
							<p class="price">Price : Rs 178</p>
							<div class="row-buttons text-left">
								<a href="#" class="btn btn-primary btn-custom "> <i
									class="fa-solid fa-cart-shopping"></i> Add to Cart
								</a>&nbsp; <a href="#" class="btn btn-outline-primary btn-custom">
									View Details </a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<div class="card-container">
					<div class="card fs-1-custom">
						<div class="card-body text-center">
							<img alt="Build, Dont Talk" src="Book/RBook2.png"
								class="img-thumbnail">
							<p>Book Name : Build, Dont Talk</p>
							<p>Author : Raj Shamani </p>
							<p class="price">Price : Rs 230</p>
							<div class="row-buttons">
								<a href="#" class="btn btn-primary btn-custom"> <i
									class="fa-solid fa-cart-shopping"></i> Add to Cart
								</a>&nbsp; <a href="#" class="btn btn-outline-primary btn-custom">
									View Details </a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<div class="card-container">
					<div class="card fs-1-custom">
						<div class="card-body text-center">
							<img alt="THE ART OF HAPPINESS" src="Book/RBook3.png"
								class="img-thumbnail">
							<p>Book Name : THE ART OF HAPPINESS </p>
							<p>Author :  The Dalai Lama</p>
							<p class="price">Price : Rs 345</p>
							<div class="row-buttons">
								<a href="#" class="btn btn-primary btn-custom"> <i
									class="fa-solid fa-cart-shopping"></i> Add to Cart
								</a>&nbsp;&nbsp; <a href="#"
									class="btn btn-outline-primary btn-custom"> View Details </a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<div class="card-container">
					<div class="card fs-1-custom">
						<div class="card-body text-center">
							<img alt="Here There and Everywhere" src="Book/Sudha Murty.png"
								class="img-thumbnail">
							<p>Book Name : Here There and Everywhere</p>
							<p>Author : Sudha Murty</p>
							<p class="price">Price : Rs 450</p>
							<div class="row-buttons">
								<a href="#" class="btn btn-primary btn-custom"> <i
									class="fa-solid fa-cart-shopping"></i> Add to Cart
								</a>&nbsp; <a href="#" class="btn btn-outline-primary btn-custom">
									View Details </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--End of Recent-->

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
                        <img alt="<%= b.getBookName() %>" src="Book/<%= b.getPhotoName() %>" class="img-thumbnail">
                        <p>Book Name: <%= b.getBookName() %></p>
                        <p>Author: <%= b.getAuthor() %></p>
                        <p class="price">Price: <i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></p>
                        <div class="row-buttons">
                            <a href="#" class="btn btn-primary btn-custom">
                                <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                            </a>
                            &nbsp;
                            <a href="#" class="btn btn-outline-primary btn-custom">View Details</a>
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
                        <img alt="<%= b.getBookName() %>" src="Book/<%= b.getPhotoName() %>" class="img-thumbnail">
                        <p>Book Name: <%= b.getBookName() %></p>
                        <p>Author: <%= b.getAuthor() %></p>
                        <p class="price">Price: <i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></p>
                        <a href="#" class="btn btn-outline-primary btn-custom text-center">View Details</a>
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