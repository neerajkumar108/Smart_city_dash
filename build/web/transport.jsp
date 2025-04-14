<%@ page import="java.sql.*, com.smartcity.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Public Transport Info</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1538937806205-c93f12376d8b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .transport-container {
            background: rgba(255, 255, 255, 0.88);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 12px 25px rgba(0,0,0,0.3);
            padding: 40px;
            margin-top: 50px;
            max-width: 950px;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .table-hover tbody tr:hover {
            background-color: #e3f2fd;
            transition: all 0.3s ease;
        }

        .table th {
            background-color: #0275d8 !important;
            color: white;
        }
    </style>
</head>
<body>

    <div class="transport-container">
        <h2>🚍 Public Transport Status</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>Route</th>
                        <th>Status</th>
                        <th>Timing</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Connection con = DBConnection.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM transport");

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("route_number") %></td>
                        <td><%= rs.getString("status") %></td>
                        <td><%= rs.getString("departure_time") %> - <%= rs.getString("arrival_time") %></td>
                    </tr>
                    <%
                            }
                            rs.close();
                            st.close();
                            con.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='3' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
