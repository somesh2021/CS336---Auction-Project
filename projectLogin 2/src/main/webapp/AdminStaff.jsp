<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Staff Member</title>
</head>
<body>
<p> Create Customer Representative Account 
	<br>
		<form method="get" action="insertCustRep.jsp">
			<table>
				<tr>    
					<td>Username:</td><td><input type="text" name="username" required></td>
				</tr>
				<tr>
					<td>Password:</td><td><input type="password" name="password" required></td>
				</tr>
				<tr>
					<td>Name:</td><td><input type = "text" name = "name" required></td>
				</tr>
				<tr>
					<td>Email:</td><td><input type = "email" name = "email" required></td>
				<tr>
			</table>
			<input type="submit" value="Submit">
		</form>
	<br>
	
<p> Generates Sales Report
	<br>
		<form method = "get" action = "checkgenerates.jsp">
			Total Earnings:<input type = "radio" name = "command" value = "totalEarnings"><br>
			Earning per Item :<input type = "radio" name = "command" value = "earningsPerItem"><br>
			Earning per Item Type :<input type = "radio" name = "command" value = "earningPerItemType"><br>
			Earning per End-User :<input type = "radio" name = "command" value = "earningPerEndUser"><br>
			Best Selling Items :<input type = "radio" name = "command" value = "bestSellingItems"><br>
			Best Buyer:<input type = "radio" name = "command" value = "bestBuyer"><br>
			<input type="submit" value="Submit">
		</form>

	<br>
	<a href='logout.jsp'>Log out</a>
</body>
</html>
