<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecommerce_assignment.dto.CategoryDTO" %>
<%@ page import="ecommerce_assignment.dto.ProductDTO" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Browsing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
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


        .btn-primary {
            background-color:  #ff9900;
            border-color:  #ff9900;
            color: white;
        }

        .btn-primary:hover {
            background-color:  #ff9900;
            border-color: #ff9900;
        }

        /* Cards Styling */
        .card {
            background-color: rgba(0, 0, 0, 0.7);
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .card-img-top {
            height: 225px; /* Set a fixed height */
            object-fit: cover; /* Ensure image fits well within the container */
        }

    </style>
</head>
<body>
<%
    // Fetching categories and products from request scope
    List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categories");
    List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
    String selectedCategory = request.getParameter("category");
    String sortOrder = request.getParameter("sort");
%>

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

<div class="container mt-5">
    <h2 class="mb-4 mt-5">Browse Products</h2>
    <form method="get" action="products">
        <div class="row mb-3">
            <div class="col-md-6">
                <select class="form-select" name="category">
                    <option value="">All Categories</option>
                    <% if (categories != null) {
                        for (CategoryDTO category : categories) { %>
                    <option value="<%= category.getId() %>"
                            <%= String.valueOf(category.getId()).equals(selectedCategory) ? "selected" : "" %>>
                        <%= category.getName() %>
                    </option>

                    <% }
                    } %>
                </select>
            </div>
            <div class="col-md-6">
                <select class="form-select" name="sort">
                    <option value="asc" <%= "asc".equals(sortOrder) ? "selected" : "" %>>Price: Low to High</option>
                    <option value="desc" <%= "desc".equals(sortOrder) ? "selected" : "" %>>Price: High to Low</option>
                </select>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Apply Filters</button>
    </form>

    <div class="row">
        <% if (products != null) {
            for (ProductDTO product : products) { %>
        <div class="col-md-4">
            <div class="card mb-3">
                <% if (product.getPhotos() != null && !product.getPhotos().isEmpty()) { %>
                <img src="${pageContext.request.contextPath}/<%= product.getPhotos().get(0).getPhotoUrl() %>"
                     class="card-img-top"
                     alt="<%= product.getName() %>">
                <% } else { %>
                <img src="default-product.jpg" class="card-img-top" alt="<%= product.getName() %>">
                <% } %>
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %>
                    </h5>
                    <p class="card-text">Rs.<%= product.getPrice() %>
                    </p>
                    <button class="btn btn-primary btn-sm">Add to Cart</button>
                </div>
            </div>
        </div>
        <% }
        } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>