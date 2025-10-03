<%@ page import="java.sql.*" %>
<%@ page import="package1.Connection_provider" %>
<%@ include file="adminHeader.jsp" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin - Pending Orders</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Pending Orders</h2>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Email</th>
                <th>Total Amount</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Country</th>
                <th>Mobile Number</th>
                <th>Payment Method</th>
                <th>Transaction ID</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection con = Connection_provider.getConnecttion();
                    Statement st = con.createStatement();

                    // Fetch pending orders
                    ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE status='Pending'");
                    while (rs.next()) {
                        int orderId = rs.getInt("order_id");
                        String email = rs.getString("email");
                        int totalAmount = rs.getInt("total_amount");
                        String address = rs.getString("address");
                        String city = rs.getString("city");
                        String state = rs.getString("state");
                        String country = rs.getString("country");
                        String mobileNumber = rs.getString("mobile_number");
                        String paymentMethod = rs.getString("payment_method");
                        String transactionId = rs.getString("transaction_id");
                        String status = rs.getString("status");
            %>
                        <tr>
                            <td><%= orderId %></td>
                            <td><%= email %></td>
                            <td><%= totalAmount %></td>
                            <td><%= address %></td>
                            <td><%= city %></td>
                            <td><%= state %></td>
                            <td><%= country %></td>
                            <td><%= mobileNumber %></td>
                            <td><%= paymentMethod %></td>
                            <td><%= transactionId %></td>
                            <td><%= status %></td>
                            <td>
                                <form action="ApprovedOrder.jsp" method="post">
                                    <input type="hidden" name="order_id" value="<%= orderId %>">
                                    <input type="submit" value="Approve">
                                </form>
                                <form action="cancelOrders.jsp" method="post">
                                    <input type="hidden" name="order_id" value="<%= orderId %>">
                                    <input type="submit" value="Cancel">
                                </form>
                                <form action="deliveredOrders.jsp" method="post">
                                    <input type="hidden" name="order_id" value="<%= orderId %>">
                                    <input type="submit" value="Deliver">
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</body>
</html>
