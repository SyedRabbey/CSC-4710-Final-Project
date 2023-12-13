<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User Registration</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
body {
	background-color: #FF6347; /* Red background */
	color: #008000; /* Green text color */
	font-family: 'monospace', sans-serif;
}

.container {
	background-color: #F8F9FA; /* Light gray container background */
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-top: 50px;
}

label {
	font-weight: bold;
	color: #228B22; /* Dark green label color */
}

.form-control {
	border-color: #228B22; /* Dark green border for input fields */
}

.btn-primary {
	background-color: #FF6347; /* Red color for buttons */
	border-color: #FF6347;
}

.btn-primary:hover {
	background-color: #CD5C5C; /* Darker red color on hover */
	border-color: #CD5C5C;
}

.navbar {
	background-color: #228B22; /* Dark green color for navbar */
}

.navbar-brand, .navbar-nav .nav-link {
	color: #FFFFFF !important; /* White text color for navbar links */
}

a {
	color: #FF6347; /* Red color for links */
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">Divid Smith</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container mt-5">
		<h2 class="mb-4">
			Divid Smith Registration <i class="fas fa-user-plus"></i>
		</h2>
		<form method="post" action="RegisterServlet.jsp">
			<div class="form-group">
				<label for="userName">UserName:</label> <input type="text"
					class="form-control" id="userName" name="userName" required="true" />
			</div>

			<div class="form-group">
				<label for="userRole">User Role:</label> <input type="text"
					class="form-control" id="userRole" name="userRole" required="true" />
			</div>

			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" name="email" required="true" />
			</div>

			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" name="password" required="true" />
			</div>

			<div class="form-group">
				<label for="confirmPassword">Confirm Password:</label> <input
					type="password" class="form-control" id="confirmPassword"
					name="confirmPassword" required="true" />
			</div>

			<div class="form-group">
				<span id="passwordMatchError" style="color: red;"></span>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary mt-4"
					onclick="return validatePassword()">
					Register <i class="fas fa-user-plus"></i>
				</button>
			</div>
		</form>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		function validatePassword() {
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;

			if (password !== confirmPassword) {
				document.getElementById("passwordMatchError").innerHTML = "Passwords do not match!";
				return false;
			} else {
				document.getElementById("passwordMatchError").innerHTML = "";
				return true;
			}
		}
	</script>
</body>
</html>
