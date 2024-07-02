<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Form</title>
<style>
body {
	background-color: black;
	color: white;
	margin: 0;
	padding: 0;
}

.payment-form-container {
	max-width: 400px;
	margin: 20px auto;
	background-color: rgb(40, 40, 40);
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

h2 {
	text-align: center;
	color: white;
}

.payment-form {
	display: flex;
	flex-direction: column;
}

.form-group {
	margin-bottom: 15px;
}

label {
	font-weight: bold;
}

input[type="text"] {
	width: 94%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid rgb(82, 82, 82);
	border-radius: 4px;
	background-color: rgb(75, 75, 75);
	color: white;
	margin-top: 10px;
}

.btn-submit {
	background-color: rgb(218, 189, 43);
	color: black;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	margin-top: 10px;
}

.btn-submit:hover {
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
	margin-top: 460px;
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
	<div class="payment-form-container">
		<h2>Payment Details</h2>
		<form action="#" method="POST" class="payment-form">
			<div class="form-group">
				<label for="card-number">Card Number:</label> <input type="text"
					id="card-number" name="card-number"
					placeholder="Enter your card number" required>
			</div>
			<div class="form-group">
				<label for="expiry-date">Expiry Date:</label> <input type="text"
					id="expiry-date" name="expiry-date" placeholder="MM/YYYY" required>
			</div>
			<div class="form-group">
				<label for="cvv">CVV:</label> <input type="text" id="cvv" name="cvv"
					placeholder="CVV" required>
			</div>
			<button type="submit" class="btn-submit">Submit Payment</button>
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