<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*"%>
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
	font-size: 12px;
	color: #28a745;
}

.btn-custom {
	font-size: 9px; /* Default font size */
	padding: 0px 0px; /* Larger padding for bigger buttons */
	margin-left: 1px; /* Adjust margin for spacing */
}

.btn-custom .fa {
	margin-right: 0px;
}

.row-buttons {
	display: flex;
	margin-left: 0px;
	justify-content: center;
	/* Center buttons when "Add to Cart" is not present */
}

.row-buttons.no-cart .btn-custom {
	font-size: 14px;
	/* Increased font size when "Add to Cart" is not present */
	padding: 10px 15px;
	/* Larger padding when "Add to Cart" is not present */
}

.row-buttons .btn-custom {
	font-size: 13px; /* Default font size for buttons */
	padding: 7px 12px; /* Default padding for buttons */
}

@media ( max-width : 576px) {
	.row-buttons {
		flex-direction: column;
		align-items: center; /* Center buttons on small screens */
	}
}

.card-container {
	width: 100%;
	max-width: 250px;
	margin: 0 auto;
	padding: 15px;
}

/* Toast Container */
#toast {
	min-width: 300px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #333;
	padding: 15px;
	color: white;
	text-align: center;
	z-index: 9999;
	font-size: 16px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
	visibility: hidden;
	opacity: 0;
	transition: opacity 0.5s, transform 0.5s;
}

/* Display Toast */
#toast.display {
	visibility: visible;
	opacity: 1;
	transform: translate(-50%, -50%);
}

/* Animation */
@
keyframes fadeIn {from { opacity:0;
	transform: translate(-50%, -60%);
}

to {
	opacity: 1;
	transform: translate(-50%, -50%);
}

}
@
keyframes fadeOut {from { opacity:1;
	transform: translate(-50%, -50%);
}

to {
	opacity: 0;
	transform: translate(-50%, -60%);
}

}

/* Toast Display and Hide */
#toast.display {
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}
</style>
</head>
<body>
	<%@include file="All_Component/Navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%
	String[] categories = {"Autobiography", "History", "Humor", "Mystery", "Romantic"};
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String query = "SELECT * FROM book_dtls WHERE bookCategory = ?";

	try {
		// Load JDBC driver and establish connection
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookMart", "root", "yash");

		for (String category : categories) {
			out.println("<div class='container-fluid' id='" + category.toLowerCase() + "-books'>");
			out.println("<h3 class='text-center mt-4'>" + category + "</h3>");
			out.println("<div class='row'>");

			// Fetch all books in the category
			pst = con.prepareStatement(query);
			pst.setString(1, category);
			rs = pst.executeQuery();

			List<Map<String, Object>> books = new ArrayList<>();
			while (rs.next()) {
		Map<String, Object> book = new HashMap<>();
		book.put("bookId", rs.getInt("bookId")); // Ensure correct data type
		book.put("bookName", rs.getString("bookname"));
		book.put("author", rs.getString("author"));
		book.put("price", rs.getDouble("price"));
		book.put("photo", rs.getString("photo"));
		book.put("status", rs.getString("status"));
		books.add(book);
			}

			// Shuffle and select random 4 books
			Collections.shuffle(books);
			List<Map<String, Object>> selectedBooks = books.subList(0, Math.min(4, books.size()));

			for (Map<String, Object> book : selectedBooks) {
		String bookId = String.valueOf(book.get("bookId")); // Ensure the correct type
		String bookName = (String) book.get("bookName");
		String author = (String) book.get("author");
		double price = (double) book.get("price");
		String photo = (String) book.get("photo");
		String status = (String) book.get("status");

		out.println("<div class='col-md-3 col-sm-6 mb-4'>");
		out.println("<div class='card-container'>");
		out.println("<div class='card fs-1-custom'>");
		out.println("<div class='card-body text-center'>");
		out.println("<img alt='Book' src='Book/" + photo + "' class='img-thumbnail'>");
		out.println("<p>Book Name: " + bookName + "</p>");
		out.println("<p>Author: " + author + "</p>");
		out.println("<p class='price'>Price: Rs " + price + "</p>");
		out.println("<div class='row-buttons " + ("Available".equalsIgnoreCase(status) ? "" : "no-cart") + "'>");

		// Conditional display based on status
		if ("Available".equalsIgnoreCase(status)) {
			if (u == null) {
				out.println("<a href='login.jsp' class='btn btn-primary btn-custom'>");
				out.println("<i class='fa-solid fa-cart-shopping'></i> Add to Cart");
				out.println("</a>");
			} else {
				out.println("<a href='cart?bid=" + bookId + "&&uid=" + u.getId()
						+ "&addCart=true' class='btn btn-primary btn-custom'>");
				out.println("<i class='fa-solid fa-cart-shopping'></i> Add to Cart");
				out.println("</a>");
			}
		}

		out.println("<a href='view_books.jsp?bid="+ bookId+"' class='btn btn-outline-primary btn-custom'>");
		out.println("View Details");
		out.println("</a>");
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");
			}
			out.println("</div>");
			out.println("</div>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)
		rs.close();
			if (pst != null)
		pst.close();
			if (con != null)
		con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	%>


	<%@include file="All_Component/footer.jsp"%>

	<!-- Toast Notification -->
	<div id="toast"></div>

	<script>
        document.addEventListener("DOMContentLoaded", function() {
            const toast = document.getElementById('toast');

            window.showToast = function(message) {
                toast.textContent = message;
                toast.classList.add("display");
                
                setTimeout(() => {
                    toast.classList.remove("display");
                }, 3000); // Duration for the toast to be visible
            };

            // Smooth Scroll functionality if needed
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
