<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Answer Questions</title>
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
			String str = "select * from questions where qid not in (select qid from replies)";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
	if(result.next())
		{
			//Make an HTML table to show the results in:
			out.print("Unanswered Questions");
			out.print("<br>");
			out.print("<table>");

			//make a row
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

			//parse out the results
			do{
				//make a row
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
			out.println("Answer Question");
			out.print("<br>");
			out.print("<form method='post' action='ansq.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Question ID:</td><td><input type='text' name='qid' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Reply (max 300 chars):</td><td><input type='text' name='reply' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Submit'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.println("<a href='CustomerRep.jsp'>Return</a>");
			//close the connection.
		}
		else {
			
			out.print("No unanswered questions");
			out.print("<br>");
			out.print("<br>");
			out.println("<a href='CustomerRep.jsp'>Return</a>");
		}
		db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	%>
		
</body>
</html>