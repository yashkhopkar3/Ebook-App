<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-D8i3CVL25q8D5+HglPM3gOFfbt4GRaN5m5Ec8xREUSxV5xOTfC6l+CRjAHKXOcSeF6rZf3eA0GAzy6wLU+T2Cw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
  <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
</svg>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
            padding: 50px;
            background-color: #fff;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Left Side - Image */
        .left-side {
            width: 50%;
            text-align: center;
        }

        .left-side img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
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

        @media (max-width: 768px) {
            .container {
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
<body>

    <div class="container">
        <!-- Left Side with Image -->
        <div class="left-side">
            <img src="your-image-path.png" alt="Contact Image">
        </div>

        <!-- Right Side with Contact Info -->
        <div class="right-side">
            <h2>Contact Us</h2>
            <p>Feel free to reach out to us via email or phone. You can also visit us at our office location. We look forward to assisting you!</p>
            
            <ul class="contact-info">
                <li><i class="fas fa-phone-alt"></i><p>+9325789925</p></li>
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

</body>
</html>
