<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/24/2025
  Time: 11:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placement</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General body styling */
        body {
            background-image: url("assets/@wallandiamin (26).jpg");
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* Fallback background color */
            color: #ffffff; /* Text color */
            background-size: cover; /* Make the background image cover the entire screen */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent the image from repeating */
            height: 100vh; /* Ensure the body takes the full viewport height */
            overflow-x: hidden; /* Prevent horizontal scrolling */
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 90, 0, 0.7);
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar h1 {
            margin: 0;
        }

        .navbar ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .navbar ul li {
            padding: 10px 20px;
        }

        .navbar ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        .navbar ul li:hover {
            background-color: #ffb600;
            box-shadow: #2c2c2c;
        }

        h1 a {
            text-decoration: none;
            color: white;
            font-weight: bold;
        }


        /* Order container styling */
        .order-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: rgba(0, 0, 0, 0.7); /* Slightly lighter background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(94, 83, 83, 0.3);
        }

        .order-title {
            font-size: 1.8rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #ff9900;
        }

        .list-group-item {
            background-color:  #9f9696;
            color: #ffffff;
            border: none;
            margin-bottom: 10px;
        }

        .list-group-item:last-child {
            margin-bottom: 0;
        }

        .btn-primary {
            background-color: #ff9900;
            border: none;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #e68a00;
        }


    </style>
</head>
<body>
<!-- Navbar -->
<div class="navbar">
    <h1><a href="User_dashboard.jsp">PrimePicks</a></h1>
    <ul>
        <li><a href="products">Product List</a></li>
        <li><a href="cart.jsp">Cart</a></li>
        <li><a href="order_placement.jsp">Order Placement</a></li>
        <li><a href="profile_manage.jsp">Profile Manage</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
</div>

<!-- Order Container -->
<div class="order-container">
    <h2 class="order-title">Order Summary</h2>
    <form action="order-submit" method="post">
        <ul class="list-group">
            <li class="list-group-item">Product 1 - $29.99 x 1</li>
            <li class="list-group-item">Product 2 - $39.99 x 2</li>
        </ul>
        <div class="text-end mt-3">
            <strong>Total: $109.97</strong>
        </div>
        <div class="text-end mt-3">
            <button type="submit" class="btn btn-primary">Place Order</button>
        </div>
    </form>
</div>


</body>
</html>
