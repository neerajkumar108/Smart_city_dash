package com.smartcity.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.smartcity.util.DBConnection;

@WebServlet("/FeedbackServlet") // This is crucial for deployment!
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");

        HttpSession session = req.getSession(false);
        String user = (session != null) ? (String) session.getAttribute("user") : null;
        String message = req.getParameter("message");

        if (user == null || message == null || message.trim().isEmpty()) {
            res.sendRedirect("dashboard.jsp?error=Invalid+Feedback");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO feedback(user_id, message) VALUES ((SELECT id FROM users WHERE name=?), ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, user);
                ps.setString(2, message);
                ps.executeUpdate();
            }

            res.sendRedirect("dashboard.jsp?msg=Feedback+Submitted");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("dashboard.jsp?error=Feedback+Failed");
        }
    }
}
