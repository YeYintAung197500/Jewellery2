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
    <h2>Message Us</h2>
    <form action="messageUsAction.jsp" method="post">
        
                
		 
        <hr style="width: 100%">
        
        
        
        <div class="left-div">
            <div class="form-group">
                <label for="address">Enter Question</label>
                <input type="text" id="que" name="que" required>
            </div>
        </div>


        <div class="form-group">
            <button type="submit" class="btn btn-primary">Send message</button>
        </div>
    </form>
</div>

</body>
</html>
