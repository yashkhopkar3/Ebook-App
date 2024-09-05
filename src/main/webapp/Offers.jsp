<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Available Offers</title>
    <%@include file="All_Component/AllCSS.jsp"%>
    <style>
        /* Offers Page Specific Styles */
        .offers-container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .offer-card {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .offer-card:hover {
            transform: translateY(-5px);
        }

        .offer-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .offer-description {
            font-size: 16px;
            color: #555;
            margin-top: 10px;
        }

        .offer-discount {
            font-size: 18px;
            color: #28a745;
            font-weight: bold;
            margin-top: 10px;
        }
        
        .offer-expiry {
            font-size: 14px;
            color: #999;
            margin-top: 5px;
        }

        @media (max-width: 576px) {
            .offer-card {
                padding: 15px;
            }

            .offer-title {
                font-size: 18px;
            }

            .offer-discount {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <%@include file="All_Component/Navbar.jsp"%>
    <div class="offers-container">
        <h2 class="text-center my-4">Available Offers</h2>
        
        <c:forEach var="offer" items="${availableOffers}">
            <div class="offer-card">
                <div class="offer-title">${offer.offerTitle}</div>
                <div class="offer-description">${offer.description}</div>
                <div class="offer-discount">Discount: ${offer.discountPercentage}% off</div>
                <div class="offer-expiry">Valid until: ${offer.expiryDate}</div>
            </div>
        </c:forEach>
    </div>
    <%@include file="All_Component/footer.jsp"%>
</body>
</html>
