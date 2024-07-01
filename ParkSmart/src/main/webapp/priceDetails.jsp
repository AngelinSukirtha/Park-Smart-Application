<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parking Price Details</title>
<style>
body {
	background-color: rgb(227, 225, 225);
	margin: 0;
}

.container {
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	justify-content: center;
}

.card {
	width: 300px;
	padding: 20px;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	margin: 10px;
	text-align: center;
	transition: transform 0.2s ease-in-out;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.card h2 {
	margin-top: 0;
	color: #333;
	font-size: 24px;
}

.card p {
	margin-bottom: 10px;
	font-size: 18px;
}

.card-footer {
	margin-top: 20px;
	font-size: 14px;
	color: #888;
}

.icon {
	font-size: 48px;
	margin-bottom: 10px;
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

footer {
	margin-top: 120px;
}
</style>
</head>
<body>
	<nav>
		<img src="image/logo1.png" alt="Logo" class="topleft"
			style="margin-top: 12px;">
		<h1 class="topleft" style="color: rgb(253, 220, 54); margin-top: 9px;">ark</h1>
		<h1 class="topleft" style="margin-top: 9px;">Smart</h1>
		<a href="index.jsp" target="blank" class="btn1">Logout</a>
	</nav>
	<form action="/price">
		<div class="container">
			<h1 style="text-align: center;">Parking Price Details</h1>
			<div class="card">
				<h2>Car</h2>
				<p>Price per hour: Rs.50</p>
				<div class="card-footer">
					<p>No height restrictions.</p>
					<p>Monthly parking available.</p>
				</div>
			</div>

			<div class="card">
				<h2>Bike</h2>
				<p>Price per hour: Rs.20</p>
				<div class="card-footer">
					<p>No height restrictions.</p>
					<p>Monthly parking available.</p>
				</div>
			</div>

			<div class="card">
				<h2>Truck</h2>
				<p>Price per hour: Rs.60</p>
				<div class="card-footer">
					<p>No height restrictions.</p>
					<p>Special oversized vehicle area.</p>
				</div>
			</div>
		</div>
	</form>
	<footer
		style="background-color: black; opacity: 0.9; padding: 20px 0; color: white; display: flex; flex-direction: column; align-items: center;">
		<div style="text-align: center; margin-top: 20px;">
			<p>&copy; 2024 Park Smart. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>
