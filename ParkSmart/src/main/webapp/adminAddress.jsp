<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.parksmart.model.*"%>
<%@ page import="com.chainsys.parksmart.dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Address</title>
<style>
body {
	background-color: #f4f4f4;
	color: #333;
	margin: 0;
	font-family: 'Times New Roman', Times, serif;
	font-weight: 510;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
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
	background-color: #f2f2f2;
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
	background-color: rgb(196, 169, 34);
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
	width: 118px;
	margin: 5px 5px;
	padding: 8px 20px;
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
			style="color: rgb(253, 220, 54); margin-top: 10px; font-size: x-large;">
			<b>ark</b>
		</h1>
		<h1 class="topleft" style="margin-top: 10px; font-size: x-large;">
			<b>Smart</b>
		</h1>
		<a href="index.jsp" target="_blank" class="btn1">Logout</a> <a
			href="priceDetails.jsp" target="_blank">Pricing</a> <a
			href="aboutUs.jsp" target="_blank">AboutUs</a>
	</nav>
	<div class="modal fade" id="addressModal" tabindex="-1" role="dialog"
		aria-labelledby="addressModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
	<h2 style="text-align: center; margin-top: 50px">
		<b>AVAILABLE ADDRESS</b>
	</h2>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>Address <a onclick="openAddressModal()"
						data-toggle="modal" data-target="#addressModal">
							<button class="select-button" style="width: 60px">Add</button>
					</a>
					</th>
				</tr>
			</thead>
			<%
			List<Addresses> list = (List<Addresses>) request.getAttribute("list");
			if (list != null) {
				for (Addresses addresses : list) {
					if (addresses != null) {
			%>
			<tbody>
				<form action="/manageAddress" method="get">
					<tr>
						<td><input type="hidden" name="address"></td>
					</tr>
				</form>
			</tbody>
			<%
			}
			}
			}
			%>
		</table>
	</div>
	<footer
		style="margin-top: 350px; background-color: black; opacity: 0.9; padding: 20px 0; color: white; display: flex; flex-direction: column; align-items: center;">
		<div style="text-align: center; margin-top: 20px;">
			<p>&copy; 2024 Parking Spot. All Rights Reserved.</p>
		</div>
	</footer>
	<script>
		function openAddressModal() {
			$('#addressModal .modal-body').load(
					'addAddress.jsp',
					function(response, status, xhr) {
						if (status == "error") {
							console.error("Error loading content:", xhr.status,
									xhr.statusText);
						} else {
							$('#addressModal').modal('show');
						}
					});
		}
	</script>
</body>
</html>
</html>