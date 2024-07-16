<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookMart Categories</title>
<%@include file="All_Component/AllCSS.jsp"%>
<style type="text/css">
/* Add your existing CSS here */
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

@media (max-width: 576px) {
    .row-buttons {
        flex-direction: column;
    }
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

    <!-- Autobiography Category -->
    <div class="container-fluid" id="autobiography-books">
        <h3 class="text-center mt-4">Autobiography</h3>
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Book 1" src="Book/book1.jpg" class="img-thumbnail">
                            <p>Book Name: Autobiography 1</p>
                            <p>Author: Author 1</p>
                            <p class="price">Price: Rs 500</p>
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
                            <img alt="Book 1" src="Book/book1.jpg" class="img-thumbnail">
                            <p>Book Name: Autobiography 1</p>
                            <p>Author: Author 1</p>
                            <p class="price">Price: Rs 500</p>
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
                            <img alt="Book 1" src="Book/book1.jpg" class="img-thumbnail">
                            <p>Book Name: Autobiography 1</p>
                            <p>Author: Author 1</p>
                            <p class="price">Price: Rs 500</p>
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
                            <img alt="Book 1" src="Book/book1.jpg" class="img-thumbnail">
                            <p>Book Name: Autobiography 1</p>
                            <p>Author: Author 1</p>
                            <p class="price">Price: Rs 500</p>
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
            <!-- Repeat similar blocks for other three books in this category -->
        </div>
    </div>

    <!-- History Category -->
    <div class="container-fluid" id="history-books">
        <h3 class="text-center mt-4">History</h3>
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Book 2" src="Book/book2.jpg" class="img-thumbnail">
                            <p>Book Name: History 1</p>
                            <p>Author: Author 2</p>
                            <p class="price">Price: Rs 600</p>
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
                            <img alt="Book 2" src="Book/book2.jpg" class="img-thumbnail">
                            <p>Book Name: History 1</p>
                            <p>Author: Author 2</p>
                            <p class="price">Price: Rs 600</p>
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
                            <img alt="Book 2" src="Book/book2.jpg" class="img-thumbnail">
                            <p>Book Name: History 1</p>
                            <p>Author: Author 2</p>
                            <p class="price">Price: Rs 600</p>
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
                            <img alt="Book 2" src="Book/book2.jpg" class="img-thumbnail">
                            <p>Book Name: History 1</p>
                            <p>Author: Author 2</p>
                            <p class="price">Price: Rs 600</p>
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
            <!-- Repeat similar blocks for other three books in this category -->
        </div>
    </div>

    <!-- Humor Category -->
    <div class="container-fluid" id="humor-books">
        <h3 class="text-center mt-4">Humor</h3>
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Book 3" src="Book/book3.jpg" class="img-thumbnail">
                            <p>Book Name: Humor 1</p>
                            <p>Author: Author 3</p>
                            <p class="price">Price: Rs 400</p>
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
                            <img alt="Book 3" src="Book/book3.jpg" class="img-thumbnail">
                            <p>Book Name: Humor 1</p>
                            <p>Author: Author 3</p>
                            <p class="price">Price: Rs 400</p>
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
                            <img alt="Book 3" src="Book/book3.jpg" class="img-thumbnail">
                            <p>Book Name: Humor 1</p>
                            <p>Author: Author 3</p>
                            <p class="price">Price: Rs 400</p>
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
                            <img alt="Book 3" src="Book/book3.jpg" class="img-thumbnail">
                            <p>Book Name: Humor 1</p>
                            <p>Author: Author 3</p>
                            <p class="price">Price: Rs 400</p>
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

    <!-- Mystery Category -->
    <div class="container-fluid" id="mystery-books">
        <h3 class="text-center mt-4">Mystery</h3>
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Book 4" src="Book/book4.jpg" class="img-thumbnail">
                            <p>Book Name: Mystery 1</p>
                            <p>Author: Author 4</p>
                            <p class="price">Price: Rs 700</p>
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
                            <img alt="Book 4" src="Book/book4.jpg" class="img-thumbnail">
                            <p>Book Name: Mystery 1</p>
                            <p>Author: Author 4</p>
                            <p class="price">Price: Rs 700</p>
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
                            <img alt="Book 4" src="Book/book4.jpg" class="img-thumbnail">
                            <p>Book Name: Mystery 1</p>
                            <p>Author: Author 4</p>
                            <p class="price">Price: Rs 700</p>
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
                            <img alt="Book 4" src="Book/book4.jpg" class="img-thumbnail">
                            <p>Book Name: Mystery 1</p>
                            <p>Author: Author 4</p>
                            <p class="price">Price: Rs 700</p>
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

    <!-- Romantic Category -->
    <div class="container-fluid" id="romantic-books">
        <h3 class="text-center mt-4">Romantic</h3>
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card-container">
                    <div class="card fs-1-custom">
                        <div class="card-body text-center">
                            <img alt="Book 5" src="Book/book5.jpg" class="img-thumbnail">
                            <p>Book Name: Romantic 1</p>
                            <p>Author: Author 5</p>
                            <p class="price">Price: Rs 550</p>
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
                            <img alt="Book 5" src="Book/book5.jpg" class="img-thumbnail">
                            <p>Book Name: Romantic 1</p>
                            <p>Author: Author 5</p>
                            <p class="price">Price: Rs 550</p>
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
                            <img alt="Book 5" src="Book/book5.jpg" class="img-thumbnail">
                            <p>Book Name: Romantic 1</p>
                            <p>Author: Author 5</p>
                            <p class="price">Price: Rs 550</p>
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
                            <img alt="Book 5" src="Book/book5.jpg" class="img-thumbnail">
                            <p>Book Name: Romantic 1</p>
                            <p>Author: Author 5</p>
                            <p class="price">Price: Rs 550</p>
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
                        customSmoothScroll(targetElement, 1500); // Adjust duration for slower speed
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
