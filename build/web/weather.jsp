<%@ page import="java.sql.*, com.smartcity.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weather Updates - Smart City Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1579003593419-98f949b9398f?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 30px;
            color: #333;
        }

        .weather-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(8px);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
            max-width: 1000px;
            margin: auto;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .table thead {
            background-color: #3498db;
            color: white;
        }

        .table-hover tbody tr:hover {
            background-color: #e0f7ff;
            transition: 0.3s ease;
            box-shadow: 0 0 10px rgba(0, 140, 255, 0.3);
        }

        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body>

    <div class="weather-container">
        <h2>Current Weather Updates</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th> Location</th>
                        <th>Temperature</th>
                        <th> Humidity</th>
                        <th> Condition</th>
                        <th>Last Updated</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Connection con = DBConnection.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM weather");
                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getString("location") %></td>
                            <td><%= rs.getString("temperature") %></td>
                            <td><%= rs.getString("humidity") %></td>
                            <td><%= rs.getString("condition") %></td>
                            <td><%= rs.getTimestamp("last_updated") %></td>
                        </tr>
                    <%
                            }
                            rs.close();
                            st.close();
                            con.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='5' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
