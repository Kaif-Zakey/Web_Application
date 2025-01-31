<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-image: url("assets/cyberpunk-sci-fi-city-hd-wallpaper-uhdpaper.com-337@1@m.jpg");
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #fff;
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
            color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.5);
            max-width: 450px;
            width: 100%;
            font-family: 'Roboto', sans-serif;
        }

        .form-container h1 {
            margin-bottom: 20px;
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            color: #b46bef;
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
            border-color: #b46bef;
            outline: none;
        }

        .form-container .alert {
            border-radius: 8px;
            padding: 10px;
            margin-top: 15px;
        }

        .form-container button {
            background-color: #b46bef;
            color: #b46bef;
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

        .form-container a {
            color: #b46bef;
            text-decoration: none;
        }

        .form-container a:hover {
            text-decoration: underline;
        }

        .brand-name {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 28px;
            font-weight: bold;
            color: #b46bef;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

    </style>
</head>
<body>

<div class="brand-name">Royal Store</div>


<div class="form-container">
    <h1>Register</h1>

    <%-- Display any messages --%>
    <%
        String message = (String) request.getAttribute("message");
        String alertType = (String) request.getAttribute("alertType");
        if (message != null && !message.isEmpty()) {
    %>
    <div class="alert alert-<%= alertType %>" role="alert">
        <strong><%= message %></strong>
    </div>
    <% } %>

    <form class="mt-4" method="POST" action="registration">
        <div class="mb-4">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="mb-4">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="mb-4">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <input type="hidden" name="role" value="Customer"/>
        <button type="submit" class="btn btn-primary w-100">Register</button>
    </form>

    <p>Already have an account? <a href="index.jsp">Login</a></p>
</div>
</body>
</html>
