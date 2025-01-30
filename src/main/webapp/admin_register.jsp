<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
            color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
            max-width: 350px; /* Further reduced form width */
            width: 100%;
            margin: auto;
        }

        .form-container h1 {
            margin-bottom: 15px;
            font-size: 22px; /* Smaller header */
            font-weight: bold;
            text-align: center;
            color: #ff9900;
        }

        .form-container .form-label {
            font-weight: 400;
            font-size: 12px; /* Smaller label text */
        }

        .form-container input,
        .form-container select {
            background-color: #333;
            color: #fff;
            border: 1px solid #666;
            padding: 8px 10px; /* Smaller padding */
            border-radius: 6px;
            width: 100%;
            margin-bottom: 10px; /* Reduced margin */
            font-size: 12px; /* Smaller text in input */
        }

        .form-container input:focus,
        .form-container select:focus {
            border-color: #ff9900;
            outline: none;
        }

        .form-container button {
            background-color: #ff9900;
            color: #0e0d0d;
            border: none;
            font-size: 14px; /* Smaller button text */
            padding: 10px; /* Reduced padding */
            border-radius: 6px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #e68900;
        }

        .form-container .alert {
            border-radius: 6px;
            padding: 8px;
            margin-top: 10px;
        }

        .form-container p {
            font-size: 12px;
            text-align: center;
            color: #ccc;
        }

        .form-container a {
            color: #ff9900;
            text-decoration: none;
        }

        .form-container a:hover {
            text-decoration: underline;
        }

        /* Responsive adjustments */
        @media (max-width: 480px) {
            .form-container {
                padding: 15px; /* Further reduced padding on smaller screens */
            }

            .form-container h1 {
                font-size: 18px;
            }

            .form-container input,
            .form-container select,
            .form-container button {
                font-size: 11px; /* Smaller text on mobile */
                padding: 8px; /* Reduced padding on mobile */
            }
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
    <h1>Admin Register</h1>

    <%-- Display any messages from the session --%>
    <c:if test="${not empty requestScope.message}">
        <div class="alert alert-${requestScope.alertType} mt-4" role="alert">
            <strong>${requestScope.message}</strong>
        </div>
        <c:remove var="message"/>
        <c:remove var="alertType"/>
    </c:if>

    <form class="mt-4" method="POST" action="admin-registration">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="mb-3">
            <label for="role" class="form-label">Role</label>
            <select class="form-control" id="role" name="role" required>
                <option value="">Select a role</option>
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary w-100">Register</button>
    </form>

    <p class="mt-4">Already have an account? <a href="admin_login.jsp" class="text-decoration-none">Login</a></p>
</div>
</body>
</html>
