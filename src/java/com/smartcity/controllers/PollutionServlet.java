package com.smartcity.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.smartcity.util.DBConnection;

public class PollutionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String location = req.getParameter("location");
        int pm25 = Integer.parseInt(req.getParameter("pm25"));
        int pm10 = Integer.parseInt(req.getParameter("pm10"));
        int no2 = Integer.parseInt(req.getParameter("no2"));

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO pollution(location, pm25, pm10, no2) VALUES (?, ?, ?, ?)");
            ps.setString(1, location);
            ps.setInt(2, pm25);
            ps.setInt(3, pm10);
            ps.setInt(4, no2);
            ps.executeUpdate();
            res.sendRedirect("pollution.jsp?msg=Pollution+Data+Added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
