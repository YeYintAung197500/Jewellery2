<%@ page import="java.sql.*" %>
<%@ page import="package1.Connection_provider" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Cancel Order</title>
</head>
<body>
<%
    int orderId = Integer.parseInt(request.getParameter("order_id"));

    try {
        Connection con = Connection_provider.getConnecttion();

        // Update the order status to "Cancelled"
        PreparedStatement ps = con.prepareStatement("UPDATE orders SET status='Cancelled' WHERE order_id=?");
        ps.setInt(1, orderId);

        int updateCount = ps.executeUpdate();

        if (updateCount > 0) {
            out.println("<h2>Order Cancelled Successfully!</h2>");
            out.println("<p>Order ID: " + orderId + " has been cancelled.</p>");
        } else {
            out.println("<h2>Error: Unable to cancel the order.</h2>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>There was an error cancelling the order. Please try again.</h2>");
    }
%>
<a href="ordersReceived.jsp">Go back to Pending Orders</a>
</body>
</html>
