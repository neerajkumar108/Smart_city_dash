<%@ page session="true" import="java.util.Calendar" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }

    String greeting;
    int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
    if (hour >= 5 && hour < 12) {
        greeting = "Good Morning";
    } else if (hour >= 12 && hour < 18) {
        greeting = "Good Afternoon";
    } else {
        greeting = "Good Evening";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Smart City Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, rgba(0, 0, 50, 0.7), rgba(0, 0, 0, 0.8)),
                        url('https://img.freepik.com/premium-photo/futuristic-smart-city-concept-technology-infrastructure-ai-iot_31965-52078.jpg?w=1380') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
        }

        .dashboard-header {
            background: linear-gradient(to right, #007bff, #00c6ff);
            color: white;
            padding: 2.5rem;
            border-radius: 0 0 30px 30px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.4);
            animation: fadeInDown 1s ease;
        }

        .dashboard-header h2 {
            font-size: 2rem;
        }

        .dashboard-header p {
            font-size: 1.2rem;
        }

        @keyframes fadeInDown {
            from {
                transform: translateY(-40px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .dashboard-card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4);
            color: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .dashboard-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 30px rgba(0, 255, 255, 0.4);
            background-color: rgba(255, 255, 255, 0.15);
        }

        .dashboard-card h5 {
            font-size: 1.4rem;
            font-weight: bold;
            margin-bottom: 0;
        }

        .btn-custom {
            font-weight: bold;
            padding: 0.8rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-outline-primary:hover {
            background-color: #00c6ff;
            color: white;
        }

        .btn-outline-danger:hover {
            background-color: #ff4d4d;
            color: white;
        }

        a.text-decoration-none:focus .dashboard-card {
            outline: 3px solid #00c6ff;
        }
    </style>
</head>
<body>

    <div class="dashboard-header">
        <h2><%= greeting %>, <%= user %></h2>
        <p>Welcome to your futuristic Smart City Control Center ? monitor, manage & connect seamlessly </p>
    </div>

    <div class="container mt-5 mb-5">
        <div class="row g-4">
            <div class="col-md-4">
                <a href="traffic.jsp" class="text-decoration-none">
                    <div class="card dashboard-card text-center p-5">
                        <h5>Traffic Monitoring</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="pollution.jsp" class="text-decoration-none">
                    <div class="card dashboard-card text-center p-5">
                        
                       <h5>Pollution Levels</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="weather.jsp" class="text-decoration-none">
                    <div class="card dashboard-card text-center p-5">
                        <h5>Weather Updates</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="transport.jsp" class="text-decoration-none">
                    <div class="card dashboard-card text-center p-5">
                        <h5>Public Transport Info</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="utilities.jsp" class="text-decoration-none">
                    <div class="card dashboard-card text-center p-5">
                        <h5>Utility Services</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="emergency.jsp" class="text-decoration-none">
                    <div class="card dashboard-card text-center p-5">
                        
                        <h5>Emergency Contacts</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-6 mx-auto mt-4">
                <a href="feedback.jsp" class="btn btn-outline-primary btn-custom w-100 mb-3"> Feedback</a>
                <a href="logout.jsp" class="btn btn-outline-danger btn-custom w-100">Logout</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
