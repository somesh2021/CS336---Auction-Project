<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buyer Portal</title>
</head>
<body>
	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String username = (String)session.getAttribute("user");
		out.print(username + "'s Buyer Portal");
		out.print("<br>");
		out.print("<br>");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		out.println("Check out Apparel");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='shirtInput.jsp'>Search for Shirts</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='pantsInput.jsp'>Search for Pants</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='shoesInput.jsp'>Search for Shoes</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='viewAllApparels.jsp'>View All Apparel</a>");
		out.print("<br>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='auction1.jsp'>See Active Auctions and Bids</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='pastauction.jsp'>See Past Auctions</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("See History of Bids for any Auction");
		out.print("<br>");
		out.print("<form method='post' action='bidhistory.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Submit'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.println("See Auction History for any User");
		out.print("<br>");
		out.print("<form method='post' action='userhistory.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Username:</td><td><input type='text' name='username' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Submit'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='similaritems.jsp'>See Auction History for Similar Items in the Past Month</a>");
		out.print("<br>");
		out.print("<br>");
		out.print("<a href='features.jsp'>Return</a>");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>