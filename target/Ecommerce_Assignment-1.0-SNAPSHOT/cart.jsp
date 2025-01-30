<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/13/2025
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
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

        /* Cart container styling */
        .cart-container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: rgba(0, 0, 0, 0.7); /* Slightly lighter background for the cart */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(255, 255, 255, 0.3);
        }

        .cart-title {
            font-size: 1.8rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #ff9900; /* Gold accent */
        }

        .cart-table {
            color: #ffffff;
            width: 100%;
        }

        .cart-table th, .cart-table td {
            text-align: center;
            padding: 10px;
        }

        .cart-table th {
            background-color: #9f9696;
        }

        .cart-table td {
            background-color: #9f9696;
        }

        .cart-table input[type="number"] {
            width: 80px;
            text-align: center;
            border: 1px solid #6a7073;
            border-radius: 5px;
            background-color: #6a7073;
            color: #ffffff;
        }

        .btn-primary {
            background-color: #ff9900;
            border: none;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #e68a00;
        }

        .btn-danger {
            background-color: #dc3545;
            border-radius: 5px;
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

<!-- Cart Container -->
<div class="cart-container">
    <h2 class="cart-title">Shopping Cart</h2>
    <form action="cart-update" method="post">
        <table class="cart-table table table-bordered">
            <thead>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Product 1</td>
                <td>$29.99</td>
                <td>
                    <input type="number" name="quantity[1]" value="1" min="1">
                </td>
                <td>$29.99</td>
                <td>
                    <button type="submit" name="action" value="remove-1" class="btn btn-danger btn-sm">Remove</button>
                </td>
            </tr>
            <tr>
                <td>Product 2</td>
                <td>$39.99</td>
                <td>
                    <input type="number" name="quantity[2]" value="2" min="1">
                </td>
                <td>$79.98</td>
                <td>
                    <button type="submit" name="action" value="remove-2" class="btn btn-danger btn-sm">Remove</button>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="text-end mt-3">
            <strong>Total: $109.97</strong>
        </div>
        <div class="text-end mt-3">
            <button type="submit" name="action" value="checkout" class="btn btn-primary">Checkout</button>
        </div>
    </form>
</div>

</body>
</html>
