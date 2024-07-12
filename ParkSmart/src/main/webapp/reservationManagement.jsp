<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.parksmart.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Reservation Management</title>
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
	padding: 6px;
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
		<a href="index.jsp" target="blank" class="btn1">Logout</a> <a
			href="priceDetails.jsp" target="blank">Pricing</a> <a
			href="aboutUs.jsp" target="blank">AboutUs</a>
	</nav>
	<div class="center">
		<h1 style="color: black;">RESERVATION DETAILS</h1>
	</div>
	<%
	List<Reservation> list = (ArrayList<Reservation>) request.getAttribute("list");
	%>
	<form action="/searchReservation" method="get">
		<div class="search">
			<input type="text" name="searchText" id="searchText" required>
			<input type="submit" value="Search" class="btn-search">
		</div>
	</form>
	<table border="1" style="margin-top: 20px">
		<tr style="background-color: rgb(253, 220, 54); height: 40px;">
			<th style="color: black;">User Id</th>
			<th style="color: black;">Reservation Id</th>
			<th style="color: black;">Number Plate</th>
			<th style="color: black;">Start Date And Time</th>
			<th style="color: black;">End Date And Time</th>
			<th style="color: black;">Fine Amount</th>
			<th style="color: black;">Reservation Status</th>
			<th style="color: black;" colspan="2">Approval</th>
		</tr>
		<%
		if (list != null) {
			for (Reservation reservation : list) {
		%>
		<tr style="color: black; background-color: white; text-align: center;">
			<td><%=reservation.getUserId()%></td>
			<td><%=reservation.getReservationId()%></td>
			<td><%=reservation.getNumberPlate()%></td>
			<td><%=reservation.getStartDateTime()%></td>
			<td><%=reservation.getEndDateTime()%></td>
			<td>Rs.<%=reservation.getFineAmount()%></td>
			<td><%=reservation.getReservationStatus()%></td>
			<td>
				<form action="/updateReservationStatus" method="get">
					<input type="hidden" name="reservationId"
						value="<%=reservation.getReservationId()%>"> <select
						name="reservationStatus">
						<option>Select</option>
						<option value="Approved">Approved</option>
						<option value="Rejected">Rejected</option>
					</select> <input type="submit" value="Update"
						style="margin: 0 15px; border-color: rgb(253, 220, 54); background-color: white">
				</form>
			</td>
			<%
			}
			}
			%>
		
	</table>
	<br>
	<div style="text-align: center">
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
