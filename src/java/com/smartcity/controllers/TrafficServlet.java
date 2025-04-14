package com.smartcity.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.smartcity.util.DBConnection;

public class TrafficServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String location = req.getParameter("location");
        String status = req.getParameter("status");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO traffic(location, status) VALUES (?, ?)");
            ps.setString(1, location);
            ps.setString(2, status);
            ps.executeUpdate();
            res.sendRedirect("traffic.jsp?msg=Traffic+Data+Added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
