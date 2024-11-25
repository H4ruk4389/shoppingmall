<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Product Details</title>
</head>
<body>
    <%
        int productId = Integer.parseInt(request.getParameter("id"));
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall", "root", "password");
            pstmt = conn.prepareStatement("SELECT * FROM products WHERE id = ?");
            pstmt.setInt(1, productId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                out.println("<h1>" + rs.getString("name") + "</h1>");
                out.println("<p>Price: $" + rs.getDouble("price") + "</p>");
                out.println("<p>Description: " + rs.getString("description") + "</p>");
                out.println("<form action='cart.jsp' method='POST'>");
                out.println("<input type='hidden' name='id' value='" + rs.getInt("id") + "' />");
                out.println("<input type='submit' value='Add to Cart' />");
                out.println("</form>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
