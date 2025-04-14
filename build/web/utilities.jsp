<%@ page import="java.sql.*, com.smartcity.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Utility Services</title>
    <style>
        body {
            margin: 0;
            padding: 40px 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://plus.unsplash.com/premium_photo-1716999684531-b8f40731a827?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
        }

        .utility-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            padding: 30px;
            max-width: 800px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 10px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f4faff;
        }

        tr:hover {
            background-color: #dff0ff;
            transition: 0.3s;
        }
    </style>
</head>
<body>
    <div class="utility-container">
        <h2>Water & Electricity Status</h2>
        <table>
            <tr>
                <th>Type</th>
                <th>Status</th>
                <th>Area</th>
            </tr>
            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                try {
                    con = DBConnection.getConnection();
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM utilities");

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("service_type") %></td>
                <td><%= rs.getString("status") %></td>
                <td><%= rs.getString("area") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
            %>
            <tr>
                <td colspan="3" style="color: red;">Error: <%= e.getMessage() %></td>
            </tr>
            <%
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                    if (st != null) try { st.close(); } catch (SQLException ignored) {}
                    if (con != null) try { con.close(); } catch (SQLException ignored) {}
                }
            %>
        </table>
    </div>
</body>
</html>
