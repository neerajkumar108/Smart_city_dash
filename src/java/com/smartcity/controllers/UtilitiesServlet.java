package com.smartcity.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.smartcity.util.DBConnection;

public class UtilitiesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String service = req.getParameter("service_type");
        String status = req.getParameter("status");
        String area = req.getParameter("area");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO utilities(service_type, status, area) VALUES (?, ?, ?)");
            ps.setString(1, service);
            ps.setString(2, status);
            ps.setString(3, area);
            ps.executeUpdate();
            res.sendRedirect("utilities.jsp?msg=Utility+Data+Added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
