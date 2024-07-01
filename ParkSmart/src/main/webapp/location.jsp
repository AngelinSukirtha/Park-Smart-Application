<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Location</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: white;
}

.container {
	max-width: 1200px;
	margin: 20px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.card {
	background-color: white;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin: 10px;
	overflow: hidden;
	width: 300px;
	text-decoration: none;
	color: inherit;
	transition: transform 0.3s ease;
}

.card:hover {
	transform: translateY(-5px);
}

.card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.card-content {
	padding: 20px;
}

.card-title {
	font-size: 1.2rem;
	margin-bottom: 10px;
}

.card-description {
	color: #666;
	font-size: 0.9rem;
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

nav .active, a:hover {
	color: rgb(253, 220, 54);
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
		<h1 class="topleft"
			style="color: rgb(253, 220, 54); margin-top: 10px;">ark</h1>
		<h1 class="topleft" style="margin-top: 10px;">Smart</h1>
		<a href="index.jsp" target="blank" class="btn1">Logout</a> <a
			href="priceDetails.jsp" target="blank">Pricing</a> <a
			href="aboutUs.jsp" target="blank">AboutUs</a>
	</nav>
	<h1 style="text-align: center; margin-top: 50px">AVAILABLE
		LOCATIONS</h1>
	<div class="container" style="margin-top: 50px;">
		<form action="/locationName" method="get" class="card">
			<input type="hidden" name="locationName" value="Chennai">
			<button style="border: none;">
				<img src="image/chennai1.jpg" width="300" height="300"
					alt="Location 1">
			</button>
			<div class="card-content">
				<h3 class="card-title" style="text-align: center;">CHENNAI</h3>
			</div>
		</form>
		<form action="/locationName" method="get" class="card">
			<input type="hidden" name="locationName" value="Madurai">
			<button style="border: none;">
				<img src="image/madurai2.jpg" width="300" height="300"
					alt="Location 2">
			</button>
			<div class="card-content">
				<h3 class="card-title" style="text-align: center;">MADURAI</h3>
			</div>
		</form>
		<form action="/locationName" method="get" class="card">
			<input type="hidden" name="locationName" value="Bangalore">
			<button style="border: none;">
				<img src="image/bangalore.jpg" width="300" height="300"
					alt="Location 1">
			</button>
			<div class="card-content">
				<h3 class="card-title" style="text-align: center;">BANGALORE</h3>
			</div>
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
