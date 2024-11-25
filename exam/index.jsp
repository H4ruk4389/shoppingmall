<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Simple Shopping Mall</title>
</head>
<body>
    <h1>Welcome to the Shopping Mall</h1>
    <h2>Products</h2>
    <%
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall", "root", "password");
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products");

            while (rs.next()) {
                out.println("<div>");
                out.println("<h3>" + rs.getString("name") + " - $" + rs.getDouble("price") + "</h3>");
                out.println("<p>" + rs.getString("description") + "</p>");
                out.println("<a href='product.jsp?id=" + rs.getInt("id") + "'>View Details</a>");
                out.println("</div><hr>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
