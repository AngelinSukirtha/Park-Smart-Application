<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
body {
	background-color: #000;
	color: white;
	background-image:
		url('https://images.unsplash.com/photo-1517672651691-24622a91b550?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FyJTIwYW5kJTIwYmlrZXxlbnwwfHwwfHx8MA%3D%3D');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	margin-top: 50px;
	margin: 0;
}

.container {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background-color: black;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

h2 {
	text-align: center;
	color: white;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
	color: white;
}

input[type="text"], input[type="password"], input[type="email"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #444;
	border-radius: 5px;
	box-sizing: border-box;
	background-color: #333;
	color: white;
}

button[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #007bff;;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button[type="submit"]:hover {
	background-color: #0056b3;;
}

.register {
	text-align: center;
	margin-top: 20px;
}

.register a {
	color: blue;
	text-decoration: none;
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

.topleft {
	float: left;
	margin: auto;
	display: inline;
	height: auto;
}
</style>
</head>
<body>
	<nav>
		<img src="image/logo1.png" alt="Logo" class="topleft"
			style="margin-top: 12px; margin-bottom: 10px;">
		<h1 class="topleft" style="color: rgb(253, 220, 54); margin-top: 9px;">ark</h1>
		<h1 class="topleft" style="margin-top: 9px;">Smart</h1>
	</nav>
	<div class="container">
		<h2>Login</h2>
		<form action="/login" method="get">
			Email: <input type="email" id="email" name="email"
				pattern="[a-z0-9]+@[a-z]+\.[a-z]{2,}$" required> Password: <input
				type="password" id="userPassword" name="userPassword"
				pattern="[A-z a-z 0-9]{8}" required><input type="hidden"
				name="action" value="login">
			<button type="submit">Login</button>
		</form>
		<div class="register">
			<p>
				Don't have an account? <a href="userRegister.jsp">Register</a>
			</p>
		</div>
	</div>
</body>
</html>
