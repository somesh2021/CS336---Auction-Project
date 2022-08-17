<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction of Similar Items</title>
</head>
<body>
	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String username = (String)session.getAttribute("user");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String str = "select a.aucid, ap.name, a.username, a.initial_price, a.increment, a.closing from auctions a, apparel ap where a.apid=ap.apid and a.apid in (select apid from Shirts) and year(a.closing) = year(current_date - interval 1 month) and month(a.closing) = month(current_date - interval 1 month)";
		ResultSet result = stmt.executeQuery(str);
		
		Statement stmt1 = con.createStatement();
		String str1 = "select a.aucid, ap.name, a.username, a.initial_price, a.increment, a.closing from auctions a, apparel ap where a.apid=ap.apid and a.apid in (select apid from Pants) and year(a.closing) = year(current_date - interval 1 month) and month(a.closing) = month(current_date - interval 1 month)";
		ResultSet result1 = stmt1.executeQuery(str1);
		
		Statement stmt2 = con.createStatement();
		String str2 = "select a.aucid, ap.name, a.username, a.initial_price, a.increment, a.closing from auctions a, apparel ap where a.apid=ap.apid and a.apid in (select apid from Shoes) and year(a.closing) = year(current_date - interval 1 month) and month(a.closing) = month(current_date - interval 1 month)";
		ResultSet result2 = stmt2.executeQuery(str2);
		
		if(result.next())
		{
			out.print("Auctions of Shirts in the preceding month");
			out.print("<br>");
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
		}
		else
		{
			out.print("No Auctions of Shirts in the preceding month");
			out.print("<br>");
			out.print("<br>");
		}
		if(result1.next())
		{
			out.print("Auctions of Pants in the preceding month");
			out.print("<br>");
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
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result1.getInt("aucid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("name"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result1.getFloat("initial_price"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result1.getFloat("increment"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getTimestamp("closing"));
				out.print("</td>");
				out.print("<td>");
			}while(result1.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("No Auctions of Pants in the preceding month");
			out.print("<br>");
			out.print("<br>");
		}
		if(result2.next())
		{
			out.print("Auctions of Shoes in the preceding month");
			out.print("<br>");
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
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result2.getInt("aucid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result2.getString("name"));
				out.print("</td>");
				out.print("<td>");
				out.print(result2.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result2.getFloat("initial_price"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result2.getFloat("increment"));
				out.print("</td>");
				out.print("<td>");
				out.print(result2.getTimestamp("closing"));
				out.print("</td>");
				out.print("<td>");
			}while(result2.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("No Auctions of Shoes in the preceding month");
			out.print("<br>");
			out.print("<br>");
		}
		//Get parameters from the HTML form at the HelloWorld.jsp
		
		out.print("<a href='buyer.jsp'>Return</a>");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>