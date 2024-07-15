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
    height: auto;
}

.price {
    font-size:12px;
    color: #28a745;
}

.btn-custom {
    font-size: 12px;
    padding: 4px 9px;
}

.btn-custom .fa {
    margin-right: 0.5rem;
}

.row-buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 1rem;
}

@media (max-width: 576px) {
    .row-buttons {
        flex-direction: column;
    }
    
    .row-buttons a {
        margin-bottom: 0.5rem;
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
    <%@include file="All_Component/Navbar.jsp"%>

    <!-- Carousel Slider -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="Book/Bookbg1.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="Book/Bookbg2.png" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                    
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="Book/Bookbg3.png" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
                </div>
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
<!--Start of Recent--> 
    <div class="container-fluid">
        <h3 class="text-center mt-4">Recent Books</h3>
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                            <div class="row-buttons">
                                <a href="#" class="btn btn-primary btn-custom">
                                    <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                </a>&nbsp;
                                <a href="#" class="btn btn-outline-primary btn-custom">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                            <div class="row-buttons">
                                <a href="#" class="btn btn-primary btn-custom">
                                    <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                </a>&nbsp;
                                <a href="#" class="btn btn-outline-primary btn-custom">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                            <div class="row-buttons">
                                <a href="#" class="btn btn-primary btn-custom">
                                    <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                </a>&nbsp;
                                <a href="#" class="btn btn-outline-primary btn-custom">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                            <div class="row-buttons">
                                <a href="#" class="btn btn-primary btn-custom">
                                    <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                </a>&nbsp;
                                <a href="#" class="btn btn-outline-primary btn-custom">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
  <!--End of Recent--> 
  
  <!--Start of New Books--> 
    <div class="container-fluid">
        <h3 class="text-center mt-4">New Books</h3>
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                            <div class="row-buttons">
                                <a href="#" class="btn btn-primary btn-custom">
                                    <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                </a>&nbsp;
                                <a href="#" class="btn btn-outline-primary btn-custom">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                            <div class="row-buttons">
                                <a href="#" class="btn btn-primary btn-custom">
                                    <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                </a>&nbsp;
                                <a href="#" class="btn btn-outline-primary btn-custom">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                            <div class="row-buttons">
                                <a href="#" class="btn btn-primary btn-custom">
                                    <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                </a>&nbsp;
                                <a href="#" class="btn btn-outline-primary btn-custom">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                            <div class="row-buttons">
                                <a href="#" class="btn btn-primary btn-custom">
                                    <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                                </a>&nbsp;
                                <a href="#" class="btn btn-outline-primary btn-custom">
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
  <!--End of New Books--> 
  
  <!--Start of Old Books--> 
    <div class="container-fluid">
        <h3 class="text-center mt-4">Old Books</h3>
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                                <a href="#" class="btn btn-outline-primary btn-custom text-center">
                                    View Details
                                </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                                <a href="#" class="btn btn-outline-primary btn-custom text-center">
                                    View Details
                                </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                           <p class="price">Price : Rs 735</p>
                                <a href="#" class="btn btn-outline-primary btn-custom text-center">
                                    View Details
                                </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Java Programming" src="Book/java.jpg" class="img-thumbnail">
                            <p>Book Name : Java Programming</p>
                            <p>Author : Balagurusamy</p>
                            <p class="price">Price : Rs 735</p>
                                <a href="#" class="btn btn-outline-primary btn-custom text-center">
                                    View Details
                                </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
  <!--End of Old Books--> 
  
  <%@include file="All_Component/footer.jsp"%>
</body>
</html>
