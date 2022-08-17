<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Portal</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String username = (String)session.getAttribute("user");
		out.println(username + "'s Seller Portal");
		out.print("<br>");
		out.print("<br>");
		out.print("Start New Auction for Shirts");
		out.print("<br>");
		out.print("<form method='post' action='shirtauction.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Shirt Name (Ex: Hollister T-Shirt):</td><td><input type='text' name='name' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Shirt Size (S-XL):</td><td><input type='text' name='size' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Shirt Color:</td><td><input type='text' name='color' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Starting Price: $</td><td><input type='text' name='initial_price' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Reserve: $</td><td><input type='text' name='minprice' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Increment: $</td><td><input type='text' name='increment' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Closing Date/Time (YYYY-MM-DD HH:MM:SS):</td><td><input type='text' name='closing' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Start'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.print("Start New Auction for Pants");
		out.print("<br>");
		out.print("<form method='post' action='pantauction.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Pant Name (Ex: Hollister Jeans):</td><td><input type='text' name='name' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Pant Waist Size:</td><td><input type='text' name='waist' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Pant Length:</td><td><input type='text' name='length' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Pant Color:</td><td><input type='text' name='color' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Starting Price: $</td><td><input type='text' name='initial_price' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Reserve: $</td><td><input type='text' name='minprice' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Increment: $</td><td><input type='text' name='increment' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Closing Date/Time (YYYY-MM-DD HH:MM:SS):</td><td><input type='text' name='closing' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Start'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.print("Start New Auction for Shoes");
		out.print("<br>");
		out.print("<form method='post' action='shoeauction.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Shoe Name (Ex: Nike Air Force):</td><td><input type='text' name='name' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Shoe Size:</td><td><input type='text' name='size' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Shoe Color:</td><td><input type='text' name='color' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Starting Price: $</td><td><input type='text' name='initial_price' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Reserve: $</td><td><input type='text' name='minprice' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Increment: $</td><td><input type='text' name='increment' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Closing Date/Time (YYYY-MM-DD HH:MM:SS):</td><td><input type='text' name='closing' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Start'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.print("<a href='features.jsp'>Return</a>");
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>