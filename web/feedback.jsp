<%@ page session="true" %>
<%@ page import="java.sql.*, com.smartcity.util.DBConnection" %>
<html>
<head><title>Feedback</title></head>
<body>
    <h2>Give Your Feedback</h2>
    <form action="FeedbackServlet" method="post">
        Message:<br>
        <textarea name="message" rows="5" cols="40"></textarea><br>
        <input type="submit" value="Submit Feedback">
    </form>
</body>
</html>
