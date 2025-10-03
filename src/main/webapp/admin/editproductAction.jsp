<%@page import="java.sql.Connection"%>
<%@ page import = "package1.Connection_provider"%>
<%@page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>

<%

String id,name,category,price,active;


id=request.getParameter("id");
name=request.getParameter("name");
category=request.getParameter("category");
price=request.getParameter("price");
active=request.getParameter("active");

try{
	
	Connection con=Connection_provider.getConnecttion();
	Statement st=con.createStatement();
	st.executeUpdate("update product set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	if(active.equals("no")){
		
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is null ");
	}
	
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
	
	
	
}


catch(Exception e){
	
	out.println(e);
	
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");

	
	
	
}











%>