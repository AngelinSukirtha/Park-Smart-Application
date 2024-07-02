<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transaction Confirmation</title>
<style>
body {
	background-image:
		url('https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?cs=srgb&dl=pexels-veeterzy-39811.jpg&fm=jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	margin: 0;
}

.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	background-color: #222;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1, h2 {
	text-align: center;
	color: white;
}

.confirmation {
	text-align: center;
	margin-top: 30px;
}

.confirmation p {
	margin-bottom: 10px;
	color: white;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: rgb(218, 189, 43);
	color: black;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.btn:hover {
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
	<div class="container">
		<form action="TransactionServlet" method="post">
			<h2>Thank You for Your Reservation!</h2>
			<div class="confirmation">
				<p>Your transaction for a parking spot has been confirmed.</p>
				<p>Reservation Details</p>
				<p>
					Name:
					<%=request.getAttribute("userName")%></p>
				<p>
					Email:
					<%=request.getAttribute("email")%></p>
				<p>
					Phone:
					<%=request.getAttribute("phoneNumber")%></p>
			</div>
			<div class="confirmation">
				<p>
					Selected spots are
					<%=request.getAttribute("spotNumber")%></p>
				<p>
					Your payment of Rs.
					<%=request.getAttribute("price")%>
					has been processed.
				</p>
				<p>
					Transaction time is
					<%=request.getAttribute("transactionTime")%>
				</p>
			</div>
			<div class="confirmation">
				<a href="index.html" class="btn">Back to Home</a>
			</div>
		</form>
		<div class="confirmation">
			<form action="SendVerificationServlet" method="post">
				<input type="hidden" name="email"
					value="<%=request.getAttribute("email")%>">
				<button class="btn">Send Verification Email</button>
			</form>
		</div>
	</div>
	<footer
		style="background-color: black; opacity: 0.9; padding: 20px 0; color: white; display: flex; flex-direction: column; align-items: center;">
		<div style="text-align: center; margin-top: 20px;">
			<p>&copy; 2024 Park Smart. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>