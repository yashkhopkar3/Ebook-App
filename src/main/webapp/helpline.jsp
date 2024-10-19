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
            background-color: #f0f1f2;
            height: 100vh;
        }

        .contact-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            max-width: 1200px;
            margin: 50px auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        /* Left Side - Contact Information */
        .left-side {
            width: 48%;
            padding-right: 30px; /* Add more space between left and right */
            border-right: 2px solid #e0e0e0; /* Subtle divider */
        }

        .left-side h2 {
            font-size: 36px;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .left-side p {
            font-size: 16px;
            color: #555;
            margin-bottom: 25px;
            line-height: 1.7;
        }

        .contact-info {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .contact-info li {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .contact-info li i {
            font-size: 28px;
            color: #007bff;
            margin-right: 20px;
        }

        .contact-info li p {
            font-size: 18px;
            color: #333;
        }

        .social-icons {
            display: flex;
            margin-top: 30px;
        }

        .social-icons a {
            text-decoration: none;
            color: #555;
            font-size: 28px;
            margin-right: 20px;
            transition: color 0.3s ease;
        }

        .social-icons a:hover {
            color: #007bff;
        }

        /* Right Side - Contact Form */
        .right-side {
            width: 48%;
        }

        .right-side h2 {
            font-size: 36px;
            color: #2c3e50;
            margin-bottom: 25px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
        }

        .contact-form {
            width: 100%;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            font-size: 16px;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #f9f9f9;
        }

        .form-group textarea {
            height: 130px;
            resize: vertical;
        }

        button {
            padding: 12px 24px;
            font-size: 18px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
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
                margin-top: 30px;
            }

            .left-side {
                border-right: none;
                padding-right: 0;
            }
        }
    </style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <!-- Include Navbar -->
    <%@ include file="All_Component/Navbar.jsp" %>

    <!-- Contact Us Container -->
    <div class="contact-container">
        <!-- Left Side with Contact Info -->
        <div class="left-side">
            <h2>Contact Information</h2>
            <p>If you have any questions, feel free to contact us. We are available through the following channels:</p>
            
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

        <!-- Right Side with Contact Form -->
        <div class="right-side">
            <h2>Send Us a Message</h2>
             <!-- Success Message -->
            <c:if test="${not empty successMsg}">
                <div class="alert-success">
                    <p>${successMsg}</p>
                </div>
            </c:if>
            <form class="contact-form" action="SendEmailServlet" method="post">
                <div class="form-group">
                    <input type="hidden" id="name" name="name" value="<%=u.getName()%>" required>
                </div>
                <div class="form-group">
                    <input type="hidden" id="email" name="email" value="<%=u.getEmail()%>" required>
                </div>
                <div class="form-group">
                    <label for="subject">Subject:</label>
                    <input type="text" id="subject" name="subject" required>
                </div>
                <div class="form-group">
                    <label for="message">Message:</label>
                    <textarea id="message" name="message" required></textarea>
                </div>
                <button type="submit">Send Message</button>
            </form>
        </div>
    </div>

    <!-- Include Footer -->
    <%@ include file="All_Component/footer.jsp" %>

</body>
</html>
