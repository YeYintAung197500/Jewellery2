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
String email1=session.getAttribute("email").toString();

    

    String address = request.getParameter("que");
    

   
    try {
        Connection con = Connection_provider.getConnecttion();
        Statement st = con.createStatement();

 
      

        // Insert message into the orders table
        String messageQuery = "INSERT INTO message(email, question) VALUES (?, ?)";
        PreparedStatement psOrder = con.prepareStatement(messageQuery);
        psOrder.setString(1, email1);
        psOrder.setString(2, address);
        psOrder.executeUpdate();

        

        // Display order confirmation message
        out.println("<h2>Your message Successfully Send</h2>");

    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h2>There was an error for messge send. Please try again.</h2>");
    }
%>
</body>
</html>
