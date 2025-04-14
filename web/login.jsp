<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Smart City Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, rgba(106, 17, 203, 0.6), rgba(37, 117, 252, 0.6)),
                        url('https://img.freepik.com/free-vector/background-abstract-realistic-technology-particle_23-2148431264.jpg?t=st=1744364239~exp=1744367839~hmac=c300abcc1fb903cd629417042a9ec2f04722d03110f80512aed88cfc8b697f63&w=1380');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .login-card {
            background-color: white;
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        .login-card h2 {
            margin-bottom: 1.5rem;
            text-align: center;
            color: #343a40;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h2>Login</h2>

        <% 
            String error = request.getParameter("error");
            if (error != null) { 
        %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
            <div class="text-center mt-3">
                <a href="register.jsp" class="text-decoration-none">New user? Register here</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
