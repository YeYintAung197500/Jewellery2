<%@page import="java.sql.Connection"%>
<%@ page import = "package1.Connection_provider"%>
<%@page import="java.sql.*"%>



<%


String email,number,sq,answer,password;

email=request.getParameter("email");

number=request.getParameter("phone");

sq=request.getParameter("sq");

answer= request.getParameter("answer");

password=request.getParameter("password");

int check=0;

try{
	

	  Connection con=Connection_provider.getConnecttion();
      Statement s1=con.createStatement();
      ResultSet rs=s1.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+number+"'and securityQuestion='"+sq+"'and answer='"+answer+"'");
      
      while(rs.next()){
    	  
    	  check=1;
    	 s1.executeUpdate("update users set password='"+password+"' where email='"+email+"'");
    	 
    	 response.sendRedirect("forgotPassword.jsp?msg=done");
    	 
    	   }
      
      if(check==0){
    	  
    	  response.sendRedirect("forgotPassword.jsp?msg=invalid");
    	  
      }
      
      
      
}

catch(Exception e){
	
	out.println(e);
	
	
}











%>
