<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us</title>
<style>
body {
	background-color: rgb(227, 225, 225);
	line-height: 1.6;
	margin: 0;
	padding: 0;
}

.container {
	margin: auto;
	padding: 20px;
	text-align: center;
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

.container  p {
	font-size: 20px;
}
</style>
</head>
<body>
	<nav>
		<img src="image/logo1.png" alt="Logo" class="topleft"
			style="margin-top: 12px;">
		<h1 class="topleft"
			style="color: rgb(253, 220, 54); margin-top: 6px;">ark</h1>
		<h1 class="topleft" style="margin-top: 6px;">Smart</h1>
		<a href="index.jsp" target="blank" class="btn1">Logout</a>
	</nav>
	<form action="/about">
		<div class="container">
			<h1>Who We Are</h1>
			<p>Welcome to Parking Spot, your one-stop solution for finding
				convenient parking spots.</p>

			<h1>Our Mission</h1>
			<p>Our mission is to provide a hassle-free parking experience by
				offering reliable information about available parking spots.</p>

			<h1>Why Choose Us?</h1>
			<p>Easy-to-use platform</p>
			<p>Accurate and up-to-date information</p>
			<p>Diverse range of parking options</p>
			<p>Customer-focused service</p>

			<h1>Contact Us</h1>
			<p>If you have any questions or feedback, feel free to contact us
			</p>
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
