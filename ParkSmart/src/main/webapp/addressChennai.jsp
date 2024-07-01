<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Address</title>
<style>
body {
	background-color: white;
	color: black;
	margin: 0;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	background-color: white;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
	position: relative;
}

th {
	background-color: white;
}

label {
	cursor: pointer;
}

.select-button {
	background-color: rgb(218, 189, 43);;
	color: black;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	position: absolute;
	top: 5px;
	right: 5px;
}

.select-button:hover {
	background-color: rgb(196, 169, 34);;
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
	<h2 style="text-align: center; margin-top: 50px">AVAILABLE ADDRESS</h2>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>Address</th>
				</tr>
			</thead>
			<tbody>
				<form action="/address" method="get">
					<tr>
						<td>Mylapore<input type="hidden" name="address"
							value="Mylapore">
							<button class="select-button">Select</button>
						</td>
					</tr>
				</form>
				<form action="/address" method="get">
					<tr>
						<td>Velachery<input type="hidden" name="address"
							value="Velachery">
							<button class="select-button">Select</button>
						</td>
					</tr>
				</form>
				<form action="/address" method="get">
					<tr>
						<td>Perungudi<input type="hidden" name="address"
							value="Perungudi">
							<button class="select-button">Select</button>
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
	<footer
		style="background-color: black; opacity: 0.9; padding: 20px 0; color: white; display: flex; flex-direction: column; align-items: center;">
		<div style="text-align: center; margin-top: 20px;">
			<p>&copy; 2024 Parking Spot. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>
