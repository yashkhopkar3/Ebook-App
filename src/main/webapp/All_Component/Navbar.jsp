<!-- Navbar.jsp -->
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3">
            <h3>BookMart</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search for books" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        <div class="col-md-3 text-right">
            <a href="login.jsp" class="btn btn-outline-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
            <a href="register.jsp" class="btn btn-outline-primary"><i class="fa-solid fa-user"></i>  Register</a>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.jsp#recent-books"><i class="fa-solid fa-book-open-reader"></i> Recent</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.jsp#old-books"><i class="fa-solid fa-book-open"></i> Old Books</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.jsp#new-books"><i class="fa-solid fa-plane-arrival"></i> New Arrivals</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="categories.jsp"><i class="fa-solid fa-plane-arrival"></i> Categories</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa-solid fa-envelope"></i> Offers</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <button class="btn btn-outline-dark my-2 my-sm-0" type="button"><i class="fa-solid fa-gear"></i> Settings</button>
            <button class="btn btn-outline-dark my-2 my-sm-0 ml-2" type="button"><i class="fa-solid fa-phone"></i> Contact Us</button>
            <button class="btn btn-primary my-2 my-sm-0 ml-2" type="button"><i class="fa-solid fa-cart-shopping"></i></button>
        </form>
    </div>
</nav>
