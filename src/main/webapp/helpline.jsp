<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <%@ include file="All_Component/AllCSS.jsp" %>
    <!-- FontAwesome Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            height: 100vh;
        }

        /* New container class specific to the Contact Us page */
        .contact-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
            padding: 50px;
            background-color: #fff;
            border-radius: 8px;
        }

        /* Left Side - Image */
        .left-side {
            width: 50%;
            text-align: center;
        }

        /* Removed shadow from image */
        .left-side img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            /* Removed shadow */
        }

        /* Right Side - Contact Information */
        .right-side {
            width: 45%;
            padding-left: 30px;
        }

        .right-side h2 {
            font-size: 36px;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .right-side p {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .contact-info {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .contact-info li {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .contact-info li i {
            font-size: 24px;
            color: #007bff;
            margin-right: 15px;
        }

        .contact-info li p {
            font-size: 18px;
            color: #333;
        }

        .social-icons {
            display: flex;
            justify-content: flex-start;
            margin-top: 20px;
        }

        .social-icons a {
            text-decoration: none;
            color: #555;
            font-size: 24px;
            margin-right: 15px;
        }

        .social-icons a:hover {
            color: #007bff;
        }

        /* Prevent flex layout from affecting the header and footer */
        header, footer {
            display: block !important;
        }

        @media (max-width: 768px) {
            .contact-container {
                flex-direction: column;
                text-align: center;
            }

            .left-side, .right-side {
                width: 100%;
                padding: 0;
            }

            .right-side {
                padding-top: 30px;
            }
        }
    </style>
</head>
<body style="background-color: #f0f1f2;">

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <!-- Include Navbar (keeps the original style) -->
    <%@ include file="All_Component/Navbar.jsp" %>

    <!-- New Contact Us container -->
    <div class="contact-container">
        <!-- Left Side with Image -->
        <div class="left-side">
            <img src="Book/contactus.jpg" alt="Contact Us Image">
        </div>

        <!-- Right Side with Contact Info -->
        <div class="right-side">
            <h2>Contact Us</h2>
            <p>Feel free to reach out to us via email or phone. You can also visit us at our office location. We look forward to assisting you!</p>
            
            <ul class="contact-info">
                <li><i class="fas fa-phone-alt"></i><p>+91 869899023</p></li>
                <li><i class="fas fa-envelope"></i><p>bookmart768@gmail.com</p></li>
                <li><i class="fas fa-map-marker-alt"></i><p>Khopoli, Raigad</p></li>
            </ul>

            <!-- Social Media Links -->
            <div class="social-icons">
                <a href="#"><i class="fab fa-google"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-facebook"></i></a>
            </div>
        </div>
    </div>

    <!-- Include Footer (keeps the original style) -->
    <%@ include file="All_Component/footer.jsp" %>

</body>
</html>
