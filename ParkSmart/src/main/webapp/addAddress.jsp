<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Form</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
body {
	background-color: #f4f4f4;
	color: #333;
	font-family: Arial, sans-serif;
	margin: 0;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

label {
	margin-bottom: 10px;
}

input[type="text"], input[type="submit"] {
	padding: 10px;
	margin-bottom: 15px;
	width: 100%;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 16px;
}

input[type="submit"] {
	background-color: rgb(218, 189, 43);
	color: black;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="submit"]:hover {
	background-color: rgb(196, 169, 34);
}
</style>
<body>
	<div class="container">
		<form action="/manageAddress" method="get">
			<label for="address">Address</label> <input type="text" id="address"
				name="address" required> <input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>
