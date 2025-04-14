<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Smart City Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, rgba(0, 198, 255, 0.7), rgba(0, 114, 255, 0.7)),
                        url('https://img.freepik.com/premium-photo/digital-agricultural-biotechnology-holographic-plant-concept-biotechnology-bioengineering_697211-9178.jpg?w=1380');
            background-size: cover;
            background-position: center;
            color: white;
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .welcome-box {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 3rem;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(12px);
            animation: fadeInUp 1s ease-out;
            max-width: 500px;
            width: 90%;
        }

        .logo {
            width: 80px;
            margin-bottom: 1rem;
        }

        .welcome-box h2 {
            margin-bottom: 2rem;
            font-size: 2rem;
            font-weight: bold;
        }

        .btn-custom {
            margin: 0 10px;
            padding: 0.7rem 2rem;
            font-size: 1.1rem;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(255, 255, 255, 0.4);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

    <div class="welcome-box">
        <img src="https://cdn-icons-png.flaticon.com/512/3103/3103446.png" class="logo" alt="City Icon">
        <h2>Welcome to Smart City Dashboard</h2>
        <a href="login.jsp" class="btn btn-light btn-custom">Login</a>
        <a href="register.jsp" class="btn btn-outline-light btn-custom">Register</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
