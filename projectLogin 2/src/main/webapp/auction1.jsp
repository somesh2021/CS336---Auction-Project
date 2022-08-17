<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Active Auctions and Bidding</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT a.aucid, ap.name, a.username, a.initial_price, a.increment, a.closing FROM auctions a, Apparel ap WHERE closing >= current_timestamp() and a.apid=ap.apid";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			Statement stmt1 = con.createStatement();
			String str1 = "select b.bid_id, b.aucid, b.username, b.amount from bids b, auctions a where b.aucid=a.aucid and a.closing >= current_timestamp()";
			ResultSet result1 = stmt1.executeQuery(str1);
	if(result.next())
		{
			//Make an HTML table to show the results in:
			out.print("Active Auctions");
			out.print("<br>");
			out.print("<table>");

			//make a row
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
			out.print(" Seller Username ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Initial Price ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Increment ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Closing Date/Time ");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			do{
				//make a row
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
				out.print(result.getString("username"));
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
		if(result1.next())
		{
			out.print("Current Bids on Active Auctions");
			out.print("<br>");
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Bid ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Auction ID ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Bidder ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Bid Amount ");
			out.print("</td>");
			out.print("</tr>");
			do
			{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result1.getInt(1));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getInt(2));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString(3));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result1.getFloat(4));
				out.print("</td>");
			}while(result1.next());
			out.print("</table>");
		}
		else
		{
			out.print("No bids on active auctions");
			out.print("<br>");
			out.print("<br>");
		}
			out.print("<br>");
			out.print("Set Manual Bid");
			out.print("<br>");
			out.print("<form method='post' action='manualbid.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Amount (Must be greater than or equal to starting price of auction):</td><td><input type='text' name='amount' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Set'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.println("Update Manual Bid");
			out.print("<br>");
			out.print("<form method='post' action='updatebid.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>New Amount:</td><td><input type='text' name='newamount' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Update'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.print("Start Automatic Bidding");
			out.print("<br>");
			out.print("<form method='post' action='autobid.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Initial Amount (Must be greater than or equal to starting price of auction):</td><td><input type='text' name='initamount' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Upper Limit:</td><td><input type='text' name='upperlim' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Start'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.print("<a href='buyer.jsp'>Return</a>");
			//close the connection.
		}
		else {
			Statement stmt2 = con.createStatement();
			String str2 = "SELECT current_timestamp";
			ResultSet result2 = stmt2.executeQuery(str2);
			result2.next();
			out.print("No active auctions as of ");
			out.print(result2.getString(1));
			out.print("<br>");
			out.print("<br>");
			out.print("<a href='buyer.jsp'>Return</a>");
		}
		db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	%>
		
</body>
</html>