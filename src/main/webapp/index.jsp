<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="All_Component/AllCSS.jsp"%>
<style type="text/css">
.back-img {
    background: url("Book/Bookbg.jpg");
    height: 50vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}

.fs-1-custom {
    font-size: 13px;
    font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="All_Component/Navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">BookMart</h2>
	</div>

	<div class="container-fluid">
		<h3 class="text-center">Recent Books</h3>
		<div class="col-md-3">
			<div class="card">
			<div class="card-body text-center" >
				<img alt="" src="Book/java.jpg" style="width: 150px; height:200px class="img-thumblin">
				<p class="fs-1-custom">Book Name : Java Programming</p>
				<p class="fs-1-custom">Author : Balagurusamy</p>
			</div></div>
		</div>
	</div>
</body>
</html>