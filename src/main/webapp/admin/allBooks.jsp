<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Books</title>
<%@ include file="AllCSS.jsp" %>
<!-- Include Bootstrap CSS for styling -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color: #f0f1f2;">
<%@ include file="Navbar.jsp" %>
<div class="container mt-5">
    <table class="table table-striped table-hover">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author Name</th>
                <th scope="col">Price</th>
                <th scope="col">Book Categories</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Sample row data -->
            <tr>
                <td>19</td>
                <td>
                    <img src="path/to/c_programming.jpg" alt="C Programming" style="width: 50px; height: 50px;"/>
                    C Programming
                </td>
                <td>Balaguruswamy</td>
                <td>250</td>
                <td>New</td>
                <td>Active</td>
                <td>
                    <button class="btn btn-primary btn-sm">Edit</button>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            <tr>
                <td>20</td>
                <td>
                    <img src="path/to/c_ansi_programming.jpg" alt="C Ansi Programming" style="width: 50px; height: 50px;"/>
                    C Ansi Programming
                </td>
                <td>Balaguruswamy</td>
                <td>550</td>
                <td>New</td>
                <td>Active</td>
                <td>
                    <button class="btn btn-primary btn-sm">Edit</button>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            <tr>
                <td>21</td>
                <td>
                    <img src="path/to/linux_with_command.jpg" alt="Linux With Command" style="width: 50px; height: 50px;"/>
                    Linux With Command
                </td>
                <td>Jageswar</td>
                <td>799</td>
                <td>New</td>
                <td>Active</td>
                <td>
                    <button class="btn btn-primary btn-sm">Edit</button>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            <tr>
                <td>22</td>
                <td>
                    <img src="path/to/the_art_of_letting_go.jpg" alt="The Art of Letting Go" style="width: 50px; height: 50px;"/>
                    The Art of Letting Go
                </td>
                <td>Amit</td>
                <td>190</td>
                <td>New</td>
                <td>Active</td>
                <td>
                    <button class="btn btn-primary btn-sm">Edit</button>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            <!-- Repeat rows as needed -->
        </tbody>
    </table>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
