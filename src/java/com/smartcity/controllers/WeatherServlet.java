package com.smartcity.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.smartcity.util.DBConnection;

public class WeatherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String location = req.getParameter("location");
        String temperature = req.getParameter("temperature");
        String humidity = req.getParameter("humidity");
        String condition = req.getParameter("condition");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO weather(location, temperature, humidity, condition) VALUES (?, ?, ?, ?)");
            ps.setString(1, location);
            ps.setString(2, temperature);
            ps.setString(3, humidity);
            ps.setString(4, condition);
            ps.executeUpdate();
            res.sendRedirect("weather.jsp?msg=Weather+Data+Added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
