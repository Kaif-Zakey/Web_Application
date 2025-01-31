<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Management</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    /* General body styling */
    body {
      background-image: url("assets/laser_beams-wallpaper-1920x1080.jpg");
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

    /* Adjusted top margin for content */
    .content {
      margin-top: 60px; /* Height of the navbar */
    }

    .notification {
      text-align: center;
      margin: 20px auto; /* Ensure proper spacing */
      padding: 10px;
      border-radius: 5px;
      max-width: 500px;
      color: white;
      position: relative;
      z-index: 999; /* Ensure it stays on top of other elements */
    }

    .notification.success {
      background-color: #4CAF50;
    }

    .notification.error {
      background-color: #F44336;
    }

    .profile-container {
      width: 100%;
      max-width: 400px;
      margin: 20px auto;
      background-color: rgba(0, 0, 0, 0.7);
      color: #ffffff;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 20px 30px;
      text-align: center;
    }

    .profile-container h1 {
      font-size: 24px;
      color: #ff9900;
      margin-bottom: 20px;
    }

    .profile-container label {
      display: block;
      font-weight: bold;
      margin-top: 10px;
      text-align: left;
    }

    .profile-container input[type="text"],
    .profile-container input[type="email"],
    .profile-container input[type="password"] {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ddd;
      border-radius: 5px;
      background-color: #f9f9f9;
      color: #333;
      font-size: 16px;
    }

    .profile-container input[type="text"]:focus,
    .profile-container input[type="email"]:focus,
    .profile-container input[type="password"]:focus {
      border-color: #ff9900;
      outline: none;
      box-shadow: 0 0 5px rgba(255, 153, 0, 0.5);
    }

    .profile-container .btn {
      width: 100%;
      padding: 12px;
      background-color: #ff9900;
      border: none;
      border-radius: 5px;
      color: #ffffff;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      text-transform: uppercase;
      margin-top: 20px;
      transition: background-color 0.3s ease;
    }

    .profile-container .btn:hover {
      background-color: #e68a00;
    }

    @media (max-width: 768px) {
      .profile-container {
        margin: 50px auto;
        padding: 20px;
      }
    }
  </style>
</head>
<body>
<!-- Navbar -->
<div class="navbar">
  <h1><a href="User_dashboard.jsp">Royal Store</a></h1>
  <ul>
    <li><a href="products">Product List</a></li>
    <li><a href="cart.jsp">Cart</a></li>
    <li><a href="order_placement.jsp">Order Placement</a></li>
    <li><a href="profile_manage.jsp">Profile Manage</a></li>
    <li><a href="index.jsp">Logout</a></li>
  </ul>
</div>

<!-- Content Area -->
<div class="content">
  <% String message = (String) session.getAttribute("message");
    String messageType = (String) session.getAttribute("messageType");
    if (message != null && !message.isEmpty()) { %>
  <div class="notification <%= messageType != null ? messageType : "success" %>">
    <%= message %>
  </div>
  <% session.removeAttribute("message"); %>
  <% session.removeAttribute("messageType"); %>
  <% } %>

  <%
    ecommerce_assignment.dto.UserDTO user = (ecommerce_assignment.dto.UserDTO) session.getAttribute("user");
    if (user == null) {
  %>
  <p>Session expired. Please <a href="index.jsp">log in</a>.</p>
  <% } else { %>
  <div class="profile-container">
    <h1>Profile Management</h1>
    <form action="profile" method="post">
      <label for="profile-name">Full Name</label>
      <input type="text" id="profile-name" name="name" value="<%= user.getUsername() %>" required>

      <label for="profile-email">Email</label>
      <input type="email" id="profile-email" name="email" value="<%= user.getEmail() %>" required>

      <label for="profile-password">Password</label>
      <input type="password" id="profile-password" name="password" required>

      <label for="confirm-password">Confirm Password</label>
      <input type="password" id="confirm-password" name="confirmPassword" required>

      <button type="submit" class="btn">Update Profile</button>
    </form>
  </div>
  <% } %>
</div>

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
