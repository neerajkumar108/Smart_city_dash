<%@ page import="java.sql.*, com.smartcity.util.DBConnection" %>
<html>
<head>
    <title>Traffic Monitoring</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           background:
                        url('https://images.unsplash.com/photo-1465447142348-e9952c393450?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
                        
            
            background-size: cover;
            margin: 0;
            padding: 30px;
            text-align: center;
            color: #2c3e50;
        }

        h2 {
            color: red;
            margin-bottom: 20px;
        }

        table {
            margin: auto;
            width: 80%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0f7fa;
        }
    </style>
</head>
<body>
    <h2>Live Traffic Monitoring</h2>
    <table>
        <tr>
            <th>Location</th>
            <th>Traffic Status</th>
            <th>Last Updated</th>
        </tr>
        <%
            try {
                Connection con = DBConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM traffic");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getString("status") %></td>
            <td><%= rs.getTimestamp("last_updated") %></td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>
