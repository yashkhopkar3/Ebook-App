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
    height: 250px;
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
                            <img alt="Book 1" src="Book/Ratan Tata A Complete Biography 254.png" class="img-thumbnail">
                            <p>Book Name: Ratan Tata A Complete Biography</p>
                            <p>Author:AK GANDHI </p>
                            <p class="price">Price: Rs 399</p>
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
                            <img alt="Book 1" src="Book/Sudha Murty.png" class="img-thumbnail">
                            <p>Book Name: HereThere and Everywhere</p>
                            <p>Author: Sudha Murty</p>
                            <p class="price">Price: Rs 450</p>
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
                            <img alt="Book 1" src="Book/Sachin Tendulkar.png" class="img-thumbnail">
                            <p>Book Name: Sachin Tendulkar</p>
                            <p>Author: Sachin Tendulkar</p>
                            <p class="price">Price: Rs 299</p>
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
                            <img alt="Book 1" src="Book/STEVE JOBS (PB) 299.png" class="img-thumbnail">
                            <p>Book Name: STEVE JOBS (PB)</p>
                            <p>Author: Walter Isaacson's</p>
                            <p class="price">Price: Rs 399</p>
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
                            <img alt="Book 2" src="Book/Ancient Indian History 499.png" class="img-thumbnail">
                            <p>Book Name: Ancient Indian History</p>
                            <p>Author: Dr. Sunil saxena</p>
                            <p class="price">Price: Rs 499</p>
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
                            <img alt="Book 2" src="Book/Early Indian History And Beyond 399.png" class="img-thumbnail">
                            <p>Book Name: Early Indian History And Beyond</p>
                            <p>Author: Suchandra Ghosh</p>
                            <p class="price">Price: Rs 399</p>
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
                            <img alt="Book 2" src="Book/India After Gandhi.png" class="img-thumbnail">
                            <p>Book Name: India After Gandhi</p>
                            <p>Author: Ramchandra Guha</p>
                            <p class="price">Price: Rs 499</p>
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
                            <img alt="Book 2" src="Book/Perspectives in Indian History 450.png" class="img-thumbnail">
                            <p>Book Name: Perspectives in Indian History </p>
                            <p>Author: M. Jankiraman PH.D</p>
                            <p class="price">Price: Rs 450</p>
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
                            <img alt="Book 3" src="Book/A Dailay Dose Of DAD Jokes.png" class="img-thumbnail">
                            <p>Book Name: A Dailay Dose Of DAD Jokes</p>
                            <p>Author: Taylor Calmus</p>
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
                            <img alt="Book 3" src="Book/A Puffin Chapter Book 399.png" class="img-thumbnail">
                            <p>Book Name: A Puffin Chapter Book </p>
                            <p>Author: Anand Neelakantan</p>
                            <p class="price">Price: Rs 299</p>
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
                            <img alt="Book 3" src="Book/Jokelopedia 399.png" class="img-thumbnail">
                            <p>Book Name: Jokelopedia</p>
                            <p>Author: Mike Wright</p>
                            <p class="price">Price: Rs 499</p>
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
                            <img alt="Book 3" src="Book/Santa Banta 350.png" class="img-thumbnail">
                            <p>Book Name: Santa Banta</p>
                            <p>Author: Santa Banta</p>
                            <p class="price">Price: Rs 199</p>
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
                            <img alt="Book 4" src="Book/STORIES CRIME MYSTERY 399.png" class="img-thumbnail">
                            <p>Book Name: STORIES CRIME MYSTERY</p>
                            <p>Author: Arvind Updyay</p>
                            <p class="price">Price: Rs 250</p>
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
                            <img alt="Book 4" src="Book/The Dare 449.png" class="img-thumbnail">
                            <p>Book Name: The Dare</p>
                            <p>Author: Cynthea Liu</p>
                            <p class="price">Price: Rs 350</p>
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
                            <img alt="Book 4" src="Book/The Great Indian Mystery 450.png" class="img-thumbnail">
                            <p>Book Name:The Great Indian Mystery </p>
                            <p>Author: Dhanesh Kumar M</p>
                            <p class="price">Price: Rs 499</p>
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
                            <img alt="Book 4" src="Book/The Mystery of Darkhill School 550.png" class="img-thumbnail">
                            <p>Book Name: The Mystery of Darkhill School </p>
                            <p>Author: C J Loughty</p>
                            <p class="price">Price: Rs 450</p>
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
                            <img alt="Book 5" src="Book/Love Hypothesis 399.png" class="img-thumbnail">
                            <p>Book Name: Love Hypothesis</p>
                            <p>Author: Ali Hazelwood</p>
                            <p class="price">Price: Rs 399</p>
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
                            <img alt="Book 5" src="Book/When I am with You.png" class="img-thumbnail">
                            <p>Book Name: When I am with You</p>
                            <p>Author: Durjoy Dutta</p>
                            <p class="price">Price: Rs 299</p>
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
                            <img alt="Book 5" src="Book/You are the Best Wife.png" class="img-thumbnail">
                            <p>Book Name: You are the Best Wife</p>
                            <p>Author: Ajay k Pandey</p>
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
                            <img alt="Book 5" src="Book/Until Love set us apart.png" class="img-thumbnail">
                            <p>Book Name: Until Love set us apart</p>
                            <p>Author: Aditya Nighhot</p>
                            <p class="price">Price: Rs 699</p>
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
