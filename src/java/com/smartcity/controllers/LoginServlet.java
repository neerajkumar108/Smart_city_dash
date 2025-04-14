package com.smartcity.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import com.smartcity.util.DBConnection;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();

            if (con == null) {
                res.sendRedirect("login.jsp?error=Database+Connection+Failed");
                return;
            }

            String query = "SELECT * FROM users WHERE email=? AND password=?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("user", rs.getString("name"));
                session.setAttribute("role", rs.getString("role"));
                res.sendRedirect("dashboard.jsp");
            } else {
                res.sendRedirect("login.jsp?error=Invalid+Email+or+Password");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("login.jsp?error=An+unexpected+error+occurred");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
