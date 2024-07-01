<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Parking Spot</title>
<style>
body {
	margin: 0;
	background-image:
		url('https://images.pexels.com/photos/1756957/pexels-photo-1756957.jpeg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
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
}

nav a {
	float: right;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

nav .active, a:hover {
	color: rgb(253, 220, 54);
}

.topleft {
	float: left;
	margin: auto;
	display: inline;
	height: auto;
}

h1 {
	display: inline;
}

.btn, .btn1 {
	display: block;
	width: 150px;
	margin: 20px auto;
	padding: 10px 20px;
	text-align: center;
	background-color: rgb(253, 220, 54);
	color: black;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.btn:hover {
	background-color: rgb(200, 174, 46);
	color: black;
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
	margin-top: 235px;
}

footer a {
	text-decoration: none;
	color: white;
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
		<a href="userLogin.jsp" target="blank" class="btn1">Sign-In</a> <a
			href="priceDetails.jsp" target="blank">Pricing</a> <a
			href="aboutUs.jsp" target="blank">AboutUs</a>
	</nav>
	<div style="margin-top: 100px; margin-left: 40px;">
		<p style="color: white; font: size 100px;">Welcome to</p>
		<h1 style="color: rgb(253, 220, 54); font-size: 50px;">PARK</h1>
		<h1 style="color: whitesmoke; font-size: 50px;">SMART</h1>
		<p style="color: rgb(194, 186, 186)">Plan ahead and secure your
			parking spot in advance to streamline your day. Take the hassle out
			of</p>
		<p style="color: rgb(194, 186, 186)">parking by reserving your
			spot online, ensuring you have a convenient place to park when you
			arrive.</p>
		<a href="userLogin.jsp" class="btn">Get Started</a>
	</div>
	<footer
		style="background-color: black; opacity: 0.9; padding: 20px 0; color: white; display: flex; flex-direction: column; align-items: center;">
		<div
			style="display: flex; justify-content: space-between; width: 90%;">
			<div style="text-align: center;">
				<h3>Contact Us</h3>
				<p>parking@gmail.com</p>
				<p>support@gmail.com</p>
			</div>
			<div style="text-align: center;">
				<h3>Legal</h3>
				<p>
					<a href="#">Terms and Conditions</a>
				</p>
				<p>
					<a href="#">Privacy Policy</a>
				</p>
			</div>
			<div style="text-align: center;">
				<h3>Help and FAQs</h3>
				<p>
					<a href="#">FAQs</a>
				</p>
				<p>
					<a href="#">Help Center</a>
				</p>
			</div>
			<div style="text-align: center;">
				<h3>Stay Connected</h3>
				<a href="https://www.facebook.com/" class="fa fa-facebook"
					style="padding: 10px;">FaceBook</a><br> <a
					href="https://www.instagram.com/" class="fa fa-instagram"
					style="padding: 10px;">Instagram</a>
			</div>
		</div>
		<div style="text-align: center; margin-top: 20px;">
			<p>&copy; 2024 Park Smart. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>
