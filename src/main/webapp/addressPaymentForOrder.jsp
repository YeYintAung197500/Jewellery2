<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import = "package1.Connection_provider"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Order Payment</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        body {
            background: #ddd;
        }
        h3 {
            color: black;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
        }
        .left-div, .right-div {
            width: 48%;
            float: left;
            margin-bottom: 20px;
        }
        .right-div {
            margin-left: 4%;
        }
        hr {
            border: 1px solid #ccc;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Order Details</h2>
    <form action="placeOrder.jsp" method="post">
        <!-- Display Cart Items -->
        <table class="table table-bordered tbl-cart">
            <thead>
                <tr>
                    <td>S.No</td>
                    <td>Product Name</td>
                    <td>Category</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Sub Total</td>
                </tr>
            </thead>
            <tbody>
                <%
                int total = 0;
                int sno = 0;
                String email1=session.getAttribute("email").toString();

                try {
                    Connection con = Connection_provider.getConnecttion();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT product.name, product.category, product.price, cart.quantity, (product.price * cart.quantity) as sub_total FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email = '" + email1 + "' AND cart.address IS NULL");

                    while (rs.next()) {
                        sno++;
                        total += rs.getInt("sub_total");
                %>
                <tr>
                    <td><%= sno %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("category") %></td>
                    <td><%= rs.getString("price") %></td>
                    <td><%= rs.getInt("quantity") %></td>
                    <td><%= rs.getInt("sub_total") %></td>
                </tr>
                <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
                <tr>
                    <td colspan="5" align="right"><strong>Total</strong></td>
                    <td><strong><%= total %></strong></td>
                </tr>
            </tbody>
        </table>

        <hr style="width: 100%">
        
        <div class="left-div">
            <div class="form-group">
                <label for="tamount">Amount</label>
                <input type="text" id="tamount" name="tamount" value="<%= total %>" readonly>
            </div>
        </div>
        
        <div class="left-div">
            <div class="form-group">
                <label for="address">Enter Address</label>
                <input type="text" id="address" name="address" required>
            </div>
        </div>

        <div class="right-div">
            <div class="form-group">
                <label for="city">Enter City</label>
                <input type="text" id="city" name="city" required>
            </div>
        </div>

        <div class="left-div">
            <div class="form-group">
                <label for="state">Enter State</label>
                <input type="text" id="state" name="state" required>
            </div>
        </div>

        <div class="right-div">
            <div class="form-group">
                <label for="country">Enter Country</label>
                <input type="text" id="country" name="country" required>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="left-div">
            <div class="form-group">
                <label for="payment_method">Select Way of Payment</label>
                <select id="payment_method" name="payment_method" required>
                    <option value="online">Online Payment</option>
                    <option value="cod">Cash on Delivery</option>
                </select>
            </div>
        </div>

        <div class="right-div">
            <div class="form-group">
                <label for="transaction_id">Transaction ID (if online payment)</label>
                <input type="text" id="transaction_id" name="transaction_id">
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="left-div">
            <div class="form-group">
                <label for="mobile_number">Mobile Number</label>
                <input type="text" id="mobile_number" name="mobile_number" required>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Place Order</button>
        </div>
    </form>
</div>

</body>
</html>
