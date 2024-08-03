<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3">
            <h3>BookMart</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2 w-75" type="search" placeholder="Search for books" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit"><i class="fa-solid fa-search"></i> Search</button>
            </form>
        </div>
        <div class="col-md-3 text-right">
            <c:choose>
                <c:when test="${not empty userobj}">
                    <span class="mr-2"><i class="fa-solid fa-user"></i> ${userobj.name}</span>
                    <a class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="../login.jsp" class="btn btn-outline-success mr-2"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                    <a href="../register.jsp" class="btn btn-outline-primary"><i class="fa-solid fa-user"></i> Register</a>
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
                <a href="../logout" class="btn btn-primary">Logout</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
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
                <a class="nav-link" href="home.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
