<%@ page import="java.sql.*" %>
<%@ page import="package1.Connection_provider" %>
<%@ include file="header.jsp" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Place Order</title>
</head>
<body>
<%
    String email1 = (String) session.getAttribute("email");
//String email2=session.getAttribute("email1").toString();
    Integer amount = null;
    try {
        amount = Integer.parseInt(request.getParameter("tamount"));
    } catch (NumberFormatException e) {
        out.println("<h2>Invalid amount format. Please try again.</h2>");
        return;
    }

    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String country = request.getParameter("country");
    String mobileNumber = request.getParameter("mobile_number");
    String paymentMethod = request.getParameter("payment_method");
    String transactionId = request.getParameter("transaction_id");

    int totalAmount = 0;

    try {
        Connection con = Connection_provider.getConnecttion();
        Statement st = con.createStatement();

        // Calculate total amount
        ResultSet rsTotal = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email1 + "' AND address IS NULL");
        if (rsTotal.next()) {
            totalAmount = rsTotal.getInt(1);
        }

        // Insert order details into the orders table
        String insertOrderQuery = "INSERT INTO orders(email, total_amount, address, city, state, country, mobile_number, payment_method, transaction_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement psOrder = con.prepareStatement(insertOrderQuery);
        psOrder.setString(1, email1);
        psOrder.setInt(2, totalAmount);
        psOrder.setString(3, address);
        psOrder.setString(4, city);
        psOrder.setString(5, state);
        psOrder.setString(6, country);
        psOrder.setString(7, mobileNumber);
        psOrder.setString(8, paymentMethod);
        psOrder.setString(9, transactionId);
        psOrder.executeUpdate();

        // Update the cart with the address details
        String updateCartQuery = "UPDATE cart SET address = ?, city = ?, state = ?, country = ?, mobilenumber = ? WHERE email = ? AND address IS NULL";
        PreparedStatement psCart = con.prepareStatement(updateCartQuery);
        psCart.setString(1, email1);
        psCart.setString(2, address);
        psCart.setString(3, city);
        psCart.setString(4, state);
        psCart.setString(5, country);
        psCart.setString(6, mobileNumber);
        psCart.executeUpdate();

        // Display order confirmation message
        out.println("<h2>Order Placed Successfully!</h2>");
        out.println("<p>Thank you for your purchase.</p>");
        out.println("<p>Total Amount: <strong>" + totalAmount + "</strong></p>");
        out.println("<p>Your order will be delivered to: <strong>" + address + ", " + city + ", " + state + ", " + country + "</strong></p>");
        out.println("<p>Payment Method: <strong>" + paymentMethod + "</strong></p>");
        if ("online".equals(paymentMethod)) {
            out.println("<p>Transaction ID: <strong>" + transactionId + "</strong></p>");
        }

    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h2>There was an error placing your order. Please try again.</h2>");
    }
%>
</body>
</html>
