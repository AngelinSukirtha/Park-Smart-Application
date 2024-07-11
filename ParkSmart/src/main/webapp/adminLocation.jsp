<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.parksmart.model.*"%>
<%@ page import="com.chainsys.parksmart.dao.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Location</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	max-width: 1200px;
	margin: 20px auto;
	flex-wrap: wrap;
	justify-content: center;
	display: inline-block;
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

.containers {
	text-align: center;
	width: 80%;
	margin: 0 auto;
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
		<a href="index.jsp" target="_blank" class="btn1">Logout</a> <a
			href="priceDetails.jsp" target="_blank">Pricing</a> <a
			href="aboutUs.jsp" target="_blank">AboutUs</a> <a
			href="addLocation.jsp">Add Location</a>
	</nav>
	<h1 style="text-align: center; margin-top: 50px;">AVAILABLE
		LOCATIONS</h1>
	<div class="containers">
		<%
		List<Locations> list = (List<Locations>) request.getAttribute("list");
		if (list != null) {
			for (Locations location : list) {
				if (location != null) {
			byte[] locationImage = location.getLocationImage();
			if (locationImage != null) {
				String base64Image = Base64.getEncoder().encodeToString(locationImage);
		%>

		<div class="container" style="margin-top: 50px;">
			<form action="adminAddress.jsp" class="card">
				<input type="hidden" name="locationId"
					value="<%=location.getLocationId()%>">
				<button style="border: none;">
					<img src="data:image/jpeg;base64, <%=base64Image%>"
						alt="Location Image" width="300" height="300">
				</button>
				<div class="card-content">
									<h3 class="card-title" style="text-align: center;"><%=location.getLocation()%></h3>
				</div>
			</form>
		</div>

		<%
		}
		}
		}
		}
		%>
	</div>
</body>

<footer
	style="margin-top: 500px; background-color: black; opacity: 0.9; padding: 20px 0; color: white; display: flex; flex-direction: column; align-items: center;">
	<div style="text-align: center; margin-top: 20px;">
		<p>&copy; 2024 Park Smart. All Rights Reserved.</p>
	</div>
</footer>
</body>
</html>
