<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Rep Portal</title>
</head>
<body>
	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String username = (String)session.getAttribute("user");
		out.print(username + "'s Customer Rep Portal");
		out.print("<br>");
		out.print("<br>");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		out.println("<a href='unansq.jsp'>View and Reply to Unanswered Questions</a>");
		//Get parameters from the HTML form at the HelloWorld.jsp
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='cruser.jsp'>View/Edit End-User Account Information</a>");
		//Get parameters from the HTML form at the HelloWorld.jsp
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='crbids.jsp'>View/Delete Bids</a>");
		//Get parameters from the HTML form at the HelloWorld.jsp
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='crauction.jsp'>View/Delete Auctions</a>");
		
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='logout.jsp'>Log out</a>");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>