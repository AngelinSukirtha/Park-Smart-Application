<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.parksmart.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login Success</title>
<style>
body {
	background-color: rgb(230, 230, 230);
	margin: 0;
}

nav {
	background-color: black;
	opacity: 0.9;
	overflow: hidden;
}

nav img {
	width: 26px;
	height: auto;
}

nav h1 {
	color: white;
	display: inline;
}

nav a {
	float: right;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topleft {
	float: left;
	margin: auto;
	display: inline;
	height: auto;
}

.btn1 {
	display: block;
	width: 80px;
	margin: 5px 5px;
	padding: 10px 20px;
	text-align: center;
	background-color: rgb(253, 220, 54);
	color: black;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.btn1:hover {
	background-color: rgba(253, 220, 54, 0.854);
	color: black;
}

.center {
	text-align: center;
	margin: auto;
	font-size: 15px;
}

table {
	width: 100%;
	background-color: white;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

.btn {
	padding: 5px 10px;
	cursor: pointer;
}

.btn-search {
	background-color: rgb(253, 220, 54);
	color: black;
	border: none;
	height: 20px;
}

.search {
	margin-left: 1000px;
}

footer {
	margin-top: 400px;
}
</style>
</head>
<body>
	<nav>
		<img src="image/logo1.png" alt="Logo" class="topleft"
			style="margin-top: 12px;">
		<h1 class="topleft"
			style="color: rgb(253, 220, 54); margin-top: 10px;">ark</h1>
		<h1 class="topleft" style="margin-top: 10px;">Smart</h1>
		<a href="index.html" target="blank" class="btn1">Logout</a>
	</nav>
	<div class="center">
		<h1 style="color: black;">USER DETAILS</h1>
	</div>
	<%
	List<User> list = (ArrayList<User>) request.getAttribute("list");
	%>
	<form action="/searchUser" method="get">
		<div class="search">
			<input type="text" name="searchText" id="searchText" required>
			<input type="submit" value="Search" class="btn-search">
		</div>
	</form>
	<div>
		<table border="1" style="margin-top: 20px">
			<tr style="background-color: rgb(253, 220, 54); height: 40px;">
				<th style="color: black;">User Id</th>
				<th style="color: black;">Name</th>
				<th style="color: black;">Password</th>
				<th style="color: black;">Phone Number</th>
				<th style="color: black;">Email</th>
				<th style="color: black;" colspan="1">Actions</th>
			</tr>
			<%
			if (list != null) {
				for (User user : list) {
			%>
			<tr
				style="color: black; background-color: white; text-align: center;">
				<td><%=user.getUserId()%></td>
				<td><%=user.getUserName()%></td>
				<td><%=user.getUserPassword()%></td>
				<td><%=user.getPhoneNumber()%></td>
				<td><%=user.getEmail()%></td>
				<td><form action="/deleteUser" method="get">
						<input type="hidden" name="email" value="<%=user.getEmail()%>">
						<button type="submit"
							style="border-color: rgb(253, 220, 54); background-color: white"
							title="delete">Delete</button>
					</form></td>
			</tr>
			<%
			}
			}
			%>
		</table>
	</div>
	<br>
	<div style="text-align: center;">
		<form action="admin.jsp">
			<button type="submit"
				style="border-color: rgb(253, 220, 54); background-color: rgb(253, 220, 54); width: 117px; height: 37px;"
				title="logout">Back</button>
		</form>
	</div>
	<footer
		style="background-color: black; opacity: 0.9; padding: 20px 0; color: white; display: flex; flex-direction: column; align-items: center;">
		<div style="text-align: center; margin-top: 20px;">
			<p>&copy; 2024 Park Smart. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>
