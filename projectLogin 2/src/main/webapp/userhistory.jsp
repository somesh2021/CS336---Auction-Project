<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Auction History</title>
</head>
<body>
	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String username = request.getParameter("username");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String str = "SELECT a.aucid, a.initial_price, a.increment, a.closing, ap.name from auctions a, apparel ap where a.apid=ap.apid and username = '" + username + "'";
		ResultSet result = stmt.executeQuery(str);
		
		if(result.next())
		{
			out.print("Auction Selling History for User " + username);
			out.print("<br>");
			out.print("<table>");
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Auction ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Apparel Name ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Starting Price ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Increment ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Closing Date/Time ");
			out.print("</td>");
			out.print("</tr>");
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getInt("aucid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("name"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result.getFloat("initial_price"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result.getFloat("increment"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getTimestamp("closing"));
				out.print("</td>");
				out.print("<td>");
			}while(result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("No Selling History for User " + username);
			out.print("<br>");
			out.print("<br>");
		}
		Statement stmt1 = con.createStatement();
		String str1="select * from bids where username = '" + username + "'";
		ResultSet result1 = stmt1.executeQuery(str1);
		
		if(result1.next())
		{
			out.print("Bidding History for User " + username);
			out.print("<br>");
			out.print("<table>");
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Bid ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Auction ID ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Bid Amount ");
			out.print("</td>");
			out.print("</tr>");
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result1.getInt("bid_id"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getInt("aucid"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result1.getFloat("amount"));
				out.print("</td>");
				out.print("<td>");
			}while(result1.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("No Bidding History for User " + username);
		}
		//Get parameters from the HTML form at the HelloWorld.jsp
		out.print("<br>");
		out.print("<br>");
		
		out.print("<a href='buyer.jsp'>Return</a>");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>