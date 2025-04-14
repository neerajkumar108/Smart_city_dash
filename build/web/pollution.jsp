<%@ page import="java.sql.*, com.smartcity.util.DBConnection" %>
<html>
<head>
    <title>Pollution Levels</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           background:
                        url('https://images.unsplash.com/photo-1606994868513-d480e1a1cab0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
           
            
            background-size: cover;
            margin: 0;
            padding: 30px;
            text-align: center;
            color: #2c3e50;
        }

        h2 {
            color: #ffffff;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8);
            margin-bottom: 25px;
        }

        table {
            width: 85%;
            margin: auto;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.85);
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 16px;
            border: 1px solid #ccc;
            text-align: center;
            font-size: 15px;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f9ff;
        }

        tr:hover {
            background-color: #d0ebff;
            transition: 0.3s;
        }
    </style>
</head>
<body>
    <h2>Air Pollution Monitoring Dashboard</h2>
    <table>
        <tr>
            <th>Location</th>
            <th>PM2.5 (µg/m³)</th>
            <th>PM10 (µg/m³)</th>
            <th>NO? (µg/m³)</th>
            <th>Last Updated</th>
        </tr>
        <%
            try {
                Connection con = DBConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM pollution");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getInt("pm25") %></td>
            <td><%= rs.getInt("pm10") %></td>
            <td><%= rs.getInt("no2") %></td>
            <td><%= rs.getTimestamp("last_updated") %></td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>
