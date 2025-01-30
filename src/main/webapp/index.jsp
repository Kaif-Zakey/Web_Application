<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Authentication</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <style>
    body {
      background-image: url("assets/markus-spiske-BTKF6G-O8fU-unsplash.jpg");
      background-size: cover;
      background-position: center;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      color: #fff;
      font-family: 'Arial', sans-serif;
      padding: 20px;
      position: relative;
    }
    .form-container {
      background-color: rgba(0, 0, 0, 0.7);  /* Transparent black background */
      color: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.5);
      max-width: 400px;
      width: 100%;
      font-family: 'Roboto', sans-serif;
    }
    .form-container h1 {
      margin-bottom: 20px;
      font-size: 26px;
      font-weight: bold;
      text-align: center;
      color: #ff9900;
    }
    .form-container .form-label {
      font-weight: 500;
      font-size: 14px;
    }
    .form-container input {
      background-color: #333;
      color: #fff;
      border: 1px solid #666;
      padding: 12px 15px;
      border-radius: 8px;
      width: 100%;
      margin-bottom: 15px;
    }
    .form-container input:focus {
      border-color: #ff9900;
      outline: none;
    }
    .form-container .alert {
      border-radius: 8px;
      padding: 10px;
      margin-top: 15px;
    }
    .form-container a {
      color: #ff9900;
      text-decoration: none;
    }
    .form-container a:hover {
      text-decoration: underline;
    }
    .form-container button {
      background-color: #ff9900;
      color: #0e0d0d;
      border: none;
      font-size: 16px;
      padding: 12px;
      border-radius: 8px;
      width: 100%;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    .form-container button:hover {
      background-color: #e68900;
    }
    .form-container p {
      font-size: 14px;
      text-align: center;
      color: #ccc;
    }
    .brand-name {
      position: absolute;
      top: 20px;
      left: 20px;
      font-size: 28px;
      font-weight: bold;
      color: #ff9900;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }
  </style>
</head>
<body>
<div class="brand-name">PrimePicks</div>

<div class="form-container">
  <h1>Login</h1>

  <%-- Display the message from session --%>
  <%
    String message = (String) session.getAttribute("message");
    String alertType = (String) session.getAttribute("alertType");
    if (message != null && !message.isEmpty()) {
  %>
  <div class="alert alert-<%= alertType %> mt-4" role="alert">
    <strong><%= message %></strong>
  </div>
  <%
      session.removeAttribute("message");
      session.removeAttribute("alertType");
    }
  %>

  <form class="mt-4" method="POST" action="login">
    <div class="mb-4">
      <label for="username" class="form-label">Username</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
    </div>
    <div class="mb-4">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
    </div>

    <button type="submit" class="btn btn-primary w-100">Login</button>
    <p class="mt-4">
      Don't have an account? <a href="registration.jsp">Register here</a>
    </p>
  </form>
</div>
</body>
</html>
