<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.parksmart.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: #f0f0f0;
}

.sidebar {
	position: fixed;
	left: 0;
	top: 0;
	width: 250px;
	height: 100%;
	background-color: #333;
	color: white;
	padding-top: 20px;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.sidebar ul li {
	margin-bottom: 10px;
}

.sidebar ul li a {
	display: block;
	padding: 10px 20px;
	color: white;
	text-decoration: none;
	transition: background-color 0.3s;
}

.sidebar ul li a:hover {
	background-color: #555;
}

.content {
	margin-left: 250px;
	padding: 20px;
}

.content .header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.content .header h1 {
	font-size: 2rem;
}

.content .header .logout {
	background-color: #555;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
}

.content .header .logout:hover {
	background-color: #777;
}

.main-content {
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

@media screen and (max-width: 768px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.content {
		margin-left: 0;
	}
}

nav {
	margin-left: 15px;
}

nav img {
	width: 36px;
	height: auto;
}

nav h1 {
	color: white;
	display: inline;
}

.container {
	padding: 20px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.card {
	background-color: white;
	width: calc(50% - 20px);
	padding: 20px;
	border: 1px solid rgb(232, 232, 232);
	border-radius: 5px;
	margin-bottom: 20px;
	box-sizing: border-box;
	width: calc(50% - 20px);
}

.card-header {
	text-align: center;
	font-size: 24px;
	margin-bottom: 10px;
	font-size: 24px;
	font-size: 24px;
}

.button {
	background-color: rgb(253, 220, 54);
	margin-left: 80px;
	border: none;
	color: black;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-top: 10px;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	width: 250px;
}

.button:hover {
	background-color: rgba(253, 220, 54, 0.854);
}

.topleft {
	float: left;
	margin: auto;
	display: inline;
	height: auto;
	font-size: 40px;
}
</style>
</head>
<body>
	<div class="sidebar">
		<nav>
			<img src="image/logo1.png" alt="Logo" class="topleft"
				style="margin-top: 12px;">
			<h1 class="topleft"
				style="color: rgb(253, 220, 54); margin-top: 10px;">ark</h1>
			<h1 class="topleft" style="margin-top: 10px;">Smart</h1>
		</nav>
		<br> <br> <br> <br>
		<ul style="font-size: 20px">
			<li><a href="admin.jsp">Home</a></li>
			<li><a href="aboutUs.jsp">About Us</a></li>
			<li><a href="priceDetails.jsp">Pricing</a></li>
			<li><a href="/manageLocations">Add Location</a></li>
			<li><a href="index.jsp">Logout</a></li>
		</ul>
	</div>

	<div class="content">
		<div class="header">
			<h1>Welcome, Angelin!</h1>
		</div>
		<div class="container">
			<div class="card">
				<form action="/users" method="get">
					<div class="card-header">Users</div>
					<a href="userManagement.jsp"><button class="button">Manage</button></a>
				</form>
			</div>

			<div class="card">
				<form action="/manageSpots" method="get">
					<div class="card-header">Spots</div>
					<a href="spotsManagement.jsp"><button class="button">Manage</button></a>
				</form>
			</div>

			<div class="card">
				<form action="/manageReservations" method="get">
					<div class="card-header">Reservations</div>
					<a href="reservationManagement.jsp"><button class="button">Manage</button></a>
				</form>
			</div>

			<div class="card">
				<form action="/manageTransactions" method="get">
					<div class="card-header">Transactions</div>
					<a href="transactionManagement.jsp"><button class="button">Manage</button></a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
