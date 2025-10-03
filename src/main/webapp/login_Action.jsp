<%@page import="java.sql.Connection"%>
<%@ page import = "package1.Connection_provider"%>
<%@page import="java.sql.*"%>


<%

String email,password;

email=request.getParameter("email");

password=request.getParameter("password");

if("admin@gmail.com".equals(email) && ("admin".equals(password)))
{
	session.setAttribute("email", email);
	response.sendRedirect("home.jsp");
}


else
{
	int z=0;
	
	try{
		
		Connection con=Connection_provider.getConnecttion();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select *from users where email='"+email+"' and password='"+password+"'");
		while(rs.next()){
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(z==0)
		{
			response.sendRedirect("login.jsp?msg=notfound");
		}
		
		
	}
	
	catch(Exception e){
		
		out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
		
		
		
	}
	
	
	
}













%>
