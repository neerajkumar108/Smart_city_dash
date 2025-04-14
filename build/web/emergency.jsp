<%@ page import="java.sql.*, com.smartcity.util.DBConnection" %>
<html>
<head>
    <title>Emergency Contacts</title>
    <style>
        body {
            margin: 0;
            padding: 40px 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://plus.unsplash.com/premium_photo-1672759455710-70c879daf721?q=80&w=2016&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
        }

        h2 {
            color: #e74c3c;
            margin-bottom: 25px;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 20px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #c0392b;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #fef9f9;
        }

        tr:hover {
            background-color: #fdecea;
            transition: 0.3s ease;
        }

        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Emergency Contact Information</h2>
    <table>
        <tr>
            <th>Department</th>
            <th>Contact Number</th>
        </tr>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                con = DBConnection.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM emergency");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getString("contact_number") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="2" class="error">Error: <%= e.getMessage() %></td>
        </tr>
        <%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (st != null) st.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }
        %>
    </table>
</body>
</html>
