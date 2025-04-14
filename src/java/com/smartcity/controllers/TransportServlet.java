package com.smartcity.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.smartcity.util.DBConnection;

public class TransportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String route = req.getParameter("route");
        String status = req.getParameter("status");
        String timing = req.getParameter("timing");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO transport(route, status, timing) VALUES (?, ?, ?)");
            ps.setString(1, route);
            ps.setString(2, status);
            ps.setString(3, timing);
            ps.executeUpdate();
            res.sendRedirect("transport.jsp?msg=Transport+Data+Added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
