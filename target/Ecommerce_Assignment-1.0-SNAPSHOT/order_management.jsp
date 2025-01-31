<%@ page import="java.util.List" %>
<%@ page import="ecommerce_assignment.dto.OrderDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url("assets/retailpos.jpg");
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
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

        h1 a{
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        .main-content {
            margin-top: 80px;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            background: rgba(115, 107, 107, 0.51);
            color: #fff;
        }

        .card h3 {
            margin-top: 0;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            color: #000;
            border-radius: 8px;  /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);  /* Box shadow */
            overflow: hidden;  /* Rounded corners to avoid overflow */
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        table th {
            background-color: rgba(246, 248, 250, 0.51);
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;  /* Striped rows */
        }

        table tr:hover {
            background-color: #f1f1f1;  /* Hover effect */
            transition: background-color 0.3s ease;
        }

        .action-buttons button {
            padding: 5px 10px;
            margin-right: 5px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .action-buttons .edit {
            background-color: #28a745;
            color: #fff;
        }

        .action-buttons .edit:hover {
            background-color: #218838;
        }

        .action-buttons .delete {
            background-color: #dc3545;
            color: #fff;
        }

        .action-buttons .delete:hover {
            background-color: #c82333;
        }

        .btn-primary.btn-sm {
            padding: 5px 10px;
        }

        /* Notification Styling */
        .notification {
            position: fixed;
            top: 70px;
            left: 50%;
            transform: translateX(-50%);
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            text-align: center;
            z-index: 1000;
            width: auto;
            min-width: 300px;
            text-align: center;
        }

        .success {
            background-color: #28a745;
        }

        .error {
            background-color: #dc3545;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<div class="navbar">
    <h1><a href="Admin_dashboard.jsp">Royal Store</a></h1>
    <ul>
        <li><a href="category-manage">Category Management</a></li>
        <li><a href="product-manage">Product Management</a></li>
        <li><a href="order-manage">Order Management</a></li>
        <li><a href="user-manage">User Management</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="card">
        <h3>Orders</h3>
        <table>
            <thead>
            <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Order Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<ecommerce_assignment.dto.OrderDTO> orders =
                        (List<OrderDTO>) request.getAttribute("orders");
                if (orders != null) {
                    for (ecommerce_assignment.dto.OrderDTO order : orders) {
            %>
            <tr>
                <td><%= order.getOrderId() %></td>
                <td><%= order.getCustomerName() %></td>
                <td><%= order.getTotalPrice() %></td>
                <td><%= order.getOrderStatus() %></td>
                <td><%= order.getCreatedAt() %></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
