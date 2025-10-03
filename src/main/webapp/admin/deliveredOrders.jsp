<%@ page import="java.sql.*" %>
<%@ page import="package1.Connection_provider" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Deliver Order</title>
</head>
<body>
<%
    int orderId = Integer.parseInt(request.getParameter("order_id"));

    try {
        Connection con = Connection_provider.getConnecttion();

        // Update the order status to "Delivered"
        PreparedStatement ps = con.prepareStatement("UPDATE orders SET status='Delivered' WHERE order_id=?");
        ps.setInt(1, orderId);

        int updateCount = ps.executeUpdate();

        if (updateCount > 0) {
            out.println("<h2>Order Marked as Delivered Successfully!</h2>");
            out.println("<p>Order ID: " + orderId + " has been delivered.</p>");
        } else {
            out.println("<h2>Error: Unable to mark the order as delivered.</h2>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>There was an error marking the order as delivered. Please try again.</h2>");
    }
%>
<a href="ordersReceived.jsp">Go back to Approved Orders</a>
</body>
</html>
