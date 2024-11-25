<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
    <h1>Your Cart</h1>
    <%
        HttpSession session = request.getSession();
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        if (request.getMethod().equalsIgnoreCase("POST")) {
            int productId = Integer.parseInt(request.getParameter("id"));
            cart.add(productId);
            session.setAttribute("cart", cart);
        }

        out.println("<h2>Products in Cart:</h2>");
        for (Integer id : cart) {
            out.println("<p>Product ID: " + id + "</p>");
        }
    %>
    <a href="index.jsp">Continue Shopping</a>
</body>
</html>
