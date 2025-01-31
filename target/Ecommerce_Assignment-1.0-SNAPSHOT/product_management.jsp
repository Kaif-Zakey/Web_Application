<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ecommerce_assignment.dto.ProductDTO" %>
<%@ page import="ecommerce_assignment.dto.ProductPhotoDTO" %>
<%@ page import="ecommerce_assignment.dto.CategoryDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
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

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        /* Category and Product Card Styling */
        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            color: #000;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background: rgba(115, 107, 107, 0.5); /* Background for the cards */
        }

        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .card h3 {
            margin-top: 0;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .action-buttons button {
            padding: 5px 10px;
            margin-right: 5px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        /* Edit button custom style */
        .card-footer .btn-warning {
            background-color: #39ee5d;
            color: #fff;
        }

        .card-footer .btn-warning:hover {
            background-color: #218838;
        }

        /* Delete button custom style */
        .card-footer .btn-danger {
            background-color: #ff0c0c;
            color: #fff;
        }

        .card-footer .btn-danger:hover {
            background-color: #c82333;
        }

        /* Add Product Button custom style */
        .btn-add-product {
            padding: 10px 15px; /* Increase padding for better clickability */
            background-color: #ffb600; /* Amazon-like yellow */
            color: #111; /* Text color */
            font-weight: bold; /* Bold text */
            border: none;
            border-radius:5px; /* Slight border radius for a clean look */
            transition: background-color 0.3s ease-in-out;
            cursor: pointer;
            display: inline-block;
            text-align: center;
            margin-bottom: 10px;
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

<%
    String message = (String) session.getAttribute("message");
    String messageType = (String) session.getAttribute("messageType");
    if (message != null && !message.isEmpty()) {
%>
<div class="notification <%= messageType != null ? messageType : "success" %>">
    <%= message %>
</div>
<% session.removeAttribute("message"); %>
<% session.removeAttribute("messageType"); %>
<% } %>

<div class="main-content">
    <div class="card">
        <div id="products" class="table-container">
            <h2>Product Management</h2>
            <button class="btn-add-product mb-3" data-bs-toggle="modal" data-bs-target="#addProductModal">
                Add Product
            </button>

            <!-- Product Card Layout -->
            <%
                List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
                List<ProductPhotoDTO> productPhotos = (List<ProductPhotoDTO>) request.getAttribute("productPhotos");
                if (products != null && !products.isEmpty()) {
            %>
            <div class="card-container">
                <%
                    for (ProductDTO product : products) {
                        // Get the photos for the current product
                        List<String> photoUrls = new ArrayList<>();
                        for (ProductPhotoDTO photo : productPhotos) {
                            if (photo.getProductId() == product.getProductId()) {
                                photoUrls.add(photo.getPhotoUrl());
                            }
                        }
                %>
                <div class="card">
                    <div class="card-body">
                        <h3><%= product.getName() %></h3>
                        <p><strong>Category:</strong> <%= product.getCategoryId() %></p>
                        <p><strong>Price:</strong> $<%= product.getPrice() %></p>
                        <p><strong>Stock:</strong> <%= product.getStock() %></p>
                        <div class="card-images">
                            <%
                                if (photoUrls != null && !photoUrls.isEmpty()) {
                                    for (String photoUrl : photoUrls) {
                            %>
                            <img src="${pageContext.request.contextPath}/<%= photoUrl %>" alt="Product Image">
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-warning btn-sm"
                                data-bs-toggle="modal"
                                data-bs-target="#editProductModal"
                                onclick="populateEditModal('<%= product.getProductId() %>', '<%= product.getName() %>', '<%= product.getCategoryId() %>', '<%= product.getPrice() %>', '<%= product.getStock() %>')">
                            Edit
                        </button>
                        <form action="product-manage" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= product.getProductId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </div>
                </div>
                <% } %>
            </div>
            <% } else { %>
            <p>No products available to display.</p>
            <% } %>
        </div>
    </div>

    <!-- Add Product Modal -->
    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="product-manage?action=add" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="productName" class="form-label">Product Name</label>
                            <input type="text" class="form-control" id="productName" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="productCategory" class="form-label">Category</label>
                            <select class="form-select" id="productCategory" name="categoryId" required>
                                <% for (CategoryDTO category : (List<CategoryDTO>) request.getAttribute("categories")) { %>
                                <option value="<%= category.getId() %>"><%= category.getName() %>
                                </option>
                                <% } %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="productPrice" class="form-label">Price</label>
                            <input type="number" step="0.01" class="form-control" id="productPrice" name="price" required>
                        </div>
                        <div class="mb-3">
                            <label for="productStock" class="form-label">Stock</label>
                            <input type="number" class="form-control" id="productStock" name="stock" required>
                        </div>
                        <div class="mb-3">
                            <label for="productPhotos" class="form-label">Upload Photos (Max 5)</label>
                            <input type="file" class="form-control" id="productPhotos" name="photos" multiple accept="image/*">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Product Modal -->
    <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="product-manage?action=edit" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="editProductId" name="id">
                        <div class="mb-3">
                            <label for="editProductName" class="form-label">Product Name</label>
                            <input type="text" class="form-control" id="editProductName" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="editProductCategory" class="form-label">Category</label>
                            <select class="form-select" id="editProductCategory" name="categoryId" required>
                                <% for (CategoryDTO category : (List<CategoryDTO>) request.getAttribute("categories")) { %>
                                <option value="<%= category.getId() %>"><%= category.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="editProductPrice" class="form-label">Price</label>
                            <input type="number" step="0.01" class="form-control" id="editProductPrice" name="price" required>
                        </div>
                        <div class="mb-3">
                            <label for="editProductStock" class="form-label">Stock</label>
                            <input type="number" class="form-control" id="editProductStock" name="stock" required>
                        </div>
                        <div class="mb-3">
                            <label for="editProductPhotos" class="form-label">Upload New Photos</label>
                            <input type="file" class="form-control" id="editProductPhotos" name="photos" multiple accept="image/*">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function populateEditModal(id, name, categoryId, price, stock) {
        document.getElementById('editProductId').value = id;
        document.getElementById('editProductName').value = name;
        document.getElementById('editProductCategory').value = categoryId;
        document.getElementById('editProductPrice').value = price;
        document.getElementById('editProductStock').value = stock;
    }
</script>

<script>
    setTimeout(function () {
        const notification = document.querySelector('.notification');
        if (notification) {
            notification.style.display = 'none';
        }
    }, 5000);
</script>

</body>
</html>
