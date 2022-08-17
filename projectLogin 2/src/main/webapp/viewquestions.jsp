<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Questions/Replies</title>
</head>
<body>
	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String username = (String)session.getAttribute("user");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String str = "select * from questions";
		ResultSet result = stmt.executeQuery(str);
		
		Statement stmt1 = con.createStatement();
		String str1 = "select * from replies";
		ResultSet result1 = stmt1.executeQuery(str1);
		
		
		if(result.next())
		{
			out.print("Questions");
			out.print("<br>");
			out.print("<br>");
			out.print("<table>");
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Question ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Posted By ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Question ");
			out.print("</td>");
			out.print("</tr>");
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getInt("qid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("question"));
				out.print("</td>");
				out.print("<td>");
			}while(result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("No Questions");
			out.print("<br>");
			out.print("<br>");
		}
		if(result1.next())
		{
			out.print("Replies");
			out.print("<br>");
			out.print("<br>");
			out.print("<table>");
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Question ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Answered by ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Reply ");
			out.print("</td>");
			out.print("</tr>");
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result1.getInt("qid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("cruser"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("reply"));
				out.print("</td>");
				out.print("<td>");
			}while(result1.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("No Replies to any Questions");
			out.print("<br>");
			out.print("<br>");
		}
		
		//Get parameters from the HTML form at the HelloWorld.jsp
		
		out.print("<a href='features.jsp'>Return</a>");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>