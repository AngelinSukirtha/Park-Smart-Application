<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Location Choosing Page</title>
<style>
body {
	margin: 0;
	padding: 0;
}

.container {
	margin-left: 60px;
	display: flex;
	flex-wrap: wrap;
	justify-content: left;
	align-items: center;
	height: 100vh;
}

.grid {
	display: grid;
	grid-template-columns: repeat(2, 100px);
	grid-gap: 20px;
}

.cell {
	width: 100px;
	height: 100px;
	border: 1px solid black;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cell:hover {
	background-color: #f0f0f0;
}

.grid1 {
	margin-left: 150px;
	display: grid;
	grid-template-columns: repeat(3, 100px);
	grid-gap: 8px;
}

.cell1 {
	width: 80px;
	height: 100px;
	border: 1px solid black;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cell1:hover {
	background-color: #f0f0f0;
}

.grid2 {
	margin-left: 150px;
	display: grid;
	grid-template-columns: repeat(2, 100px);
	grid-gap: 75px;
}

.cell2 {
	width: 150px;
	height: 100px;
	border: 1px solid black;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cell2:hover {
	background-color: #f0f0f0;
}

.vehicle-buttons {
	margin-top: 50px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.vehicle-button {
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	background-color: rgb(253, 220, 54);
	color: black;
	border-radius: 5px;
}

.checkbox-cell {
	display: none;
}

.checkbox-cell:checked+label.cell, .checkbox-cell:checked+label.cell1,
	.checkbox-cell:checked+label.cell2 {
	background-color: rgb(90, 209, 90);
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

nav .active, a:hover {
	color: rgb(253, 220, 54);
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
	margin-top: 700px;
}

.cell.disabled {
	background-color: #ccc;
	cursor: not-allowed;
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
	<div class="vehicle-buttons">
		<button class="vehicle-button" style="margin-left: 100px;"
			onclick="setVehicleType('Car')">
			<i class="fas fa-car"></i>CAR
			<p>Rs.50 per hour</p>
		</button>
		<button class="vehicle-button" style="margin-right: 70px;"
			onclick="setVehicleType('Bike')">
			<i class="fas fa-bicycle"></i>BIKE
			<p>Rs.20 per hour</p>
		</button>
		<button class="vehicle-button" style="margin-right: 140px;"
			onclick="setVehicleType('Truck')">
			<i class="fas fa-truck"></i>TRUCK
			<p>Rs.60 per hour</p>
		</button>
	</div>
	<form id="parkingForm" action="/spots" method="get">
		<input type="hidden" name="vehicleType" id="vehicleTypeInput">
		<div class="container">
			<%
			if (session.getAttribute("spotList") != null) {
				ArrayList<String> spotList = (ArrayList<String>) session.getAttribute("spotList");
			%>
			<div class="grid">
				<%
				for (int i = 1; i <= 20; i++) {
					String spotId = "C" + i;
					boolean isOccupied = false;
					for (String spot : spotList) {
						if (spot.equals(spotId)) {
					isOccupied = true;
					break;
						}
					}
				%>
				<input type="checkbox" class="checkbox-cell" id="<%=spotId%>"
					<%=isOccupied ? "disabled" : ""%>> <label for="<%=spotId%>"
					class="cell <%=isOccupied ? "occupied disabled" : ""%>"><%=spotId%></label>
				<%
				}
				%>
			</div>

			<div class="grid1">
				<%
				for (int i = 1; i <= 33; i++) {
					String spotId = "B" + i;
					boolean isOccupied = false;
					for (String spot : spotList) {
						if (spot.equals(spotId)) {
					isOccupied = true;
					break;
						}
					}
				%>
				<input type="checkbox" class="checkbox-cell" id="<%=spotId%>"
					<%=isOccupied ? "disabled" : ""%>> <label for="<%=spotId%>"
					class="cell <%=isOccupied ? "occupied disabled" : ""%>"><%=spotId%></label>
				<%
				}
				%>
			</div>

			<div class="grid2">
				<%
				for (int i = 1; i <= 14; i++) {
					String spotId = "T" + i;
					boolean isOccupied = false;
					for (String spot : spotList) {
						if (spot.equals(spotId)) {
					isOccupied = true;
					break;
						}
					}
				%>
				<input type="checkbox" class="checkbox-cell" id="<%=spotId%>"
					<%=isOccupied ? "disabled" : ""%>> <label for="<%=spotId%>"
					class="cell <%=isOccupied ? "occupied disabled" : ""%>"><%=spotId%></label>
				<%
				}
				%>
			</div>
			<div style="text-align: center; margin-top: 50px;">
				<button
					style="padding: 10px 20px; border: none; cursor: pointer; background-color: rgb(253, 220, 54); color: black; border-radius: 5px; margin-bottom: 50px; margin-left: 500px;">
					Book Now</button>
			</div>
			<%
			}
			%>
		</div>
	</form>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			const checkboxes = $('.checkbox-cell');
			const parkingForm = $('#parkingForm');

			parkingForm.on('submit', function(event) {
				event.preventDefault();

				let selectedCells = [];

				checkboxes.each(function() {
					if ($(this).prop('checked')) {
						let spotId = $(this).attr('id');
						selectedCells.push(spotId);
					}
				});

				if (selectedCells.length === 0) {
					alert("Please select at least one spot.");
					return;
				}

				$('<input>').attr({
					type : 'hidden',
					name : 'selectedSpots',
					value : JSON.stringify(selectedCells)
				}).appendTo(parkingForm);

				parkingForm.get(0).submit();
			});
		});
	</script>
	<footer
		style="background-color: black; opacity: 0.9; padding: 20px 0; color: white; display: flex; flex-direction: column; align-items: center;">
		<div style="text-align: center; margin-top: 20px;">
			<p>&copy; 2024 Park Smart. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>