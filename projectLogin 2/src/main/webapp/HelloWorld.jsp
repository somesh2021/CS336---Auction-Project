<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe Login Page</title>
	</head>
	
	<body>

		BuyMe Login Page <!-- the usual HTML way -->
							  
		<br>
		<br>
	End-User Login:
	<br>
		<form method="get" action="checkLogin.jsp">
			<table>
				<tr>    
					<td>Username:</td><td><input type="text" name="username" required></td>
				</tr>
				<tr>
					<td>Password:</td><td><input type="password" name="password"required></td>
				</tr>
			</table>
			<input type="submit" value="Submit">
		</form>
	<br>
	Customer Representative Login:
	<br>
		<form method="get" action="checkCR.jsp">
			<table>
				<tr>    
					<td>Username:</td><td><input type="text" name="username" required></td>
				</tr>
				<tr>
					<td>Password:</td><td><input type="password" name="password"required></td>
				</tr>
			</table>
			<input type="submit" value="Submit">
		</form>
	<br>
	Admin Login:
	<br>
		<form method="get" action="checkAdmin.jsp">
			<table>
				<tr>    
					<td>Username:</td><td><input type="text" name="username" required></td>
				</tr>
				<tr>
					<td>Password:</td><td><input type="password" name="password"required></td>
				</tr>
			</table>
			<input type="submit" value="Submit">
		</form>
	<br>
	Forgot your Password?
	<br>
		<form method="get" action="forgotPw.jsp">
			<table>
				<tr>    
					<td>Email:</td><td><input type="email" name="email" required></td>
				</tr>
				<tr>
					<td>Name:</td><td><input type="text" name="name" required></td>
				</tr>
				<tr>
					<td>Username:</td><td><input type="text" name="username" required></td>
				</tr>
			</table>
			<input type="submit" value="Submit">
		</form>
	<br>
	If you don't have an account, register below:
	<br>
		<form method="post" action="register.jsp">
		<table>
		<tr>    
		<td>Name (max 100 chars):</td><td><input type="text" name="name" required></td>
		</tr>
		<tr>    
		<td>Email (max 100 chars):</td><td><input type="email" name="email" required></td>
		</tr>
		<tr>
		<td>Username (max 50 chars):</td><td><input type="text" name="username" required></td>
		</tr>
		<tr>
		<td>Password (max 20 chars):</td><td><input type="password" name="password" required></td>
		</tr>
		</table>
		<input type="submit" value="Register">
		</form>
	<br>
	

</body>
</html>