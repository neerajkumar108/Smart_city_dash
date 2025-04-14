package com.smartcity.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.smartcity.util.DBConnection;

public class EmergencyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String dept = req.getParameter("department");
        String contact = req.getParameter("contact");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO emergency(department, contact_number) VALUES (?, ?)");
            ps.setString(1, dept);
            ps.setString(2, contact);
            ps.executeUpdate();
            res.sendRedirect("emergency.jsp?msg=Contact+Added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
