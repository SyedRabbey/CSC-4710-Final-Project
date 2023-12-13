<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
body {
	background-color: #F8F9FA; /* Light gray background */
	color: #495057; /* Dark gray text color */
	font-family: 'monospace', sans-serif;
}

.container {
	background-color: #FFF; /* White container background */
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-top: 50px;
}

h2 {
	color: #DC3545; /* Red color for headings */
}

.form-group {
	margin-bottom: 20px;
}

label {
	font-weight: bold;
	color: #28A745; /* Green color for labels */
}

.btn-primary {
	background-color: #DC3545; /* Red color for signup button */
	border-color: #DC3545;
}

.btn-primary:hover {
	background-color: #C82333; /* Darker red color on hover */
	border-color: #C82333;
}

.login-link {
	display: block;
	text-align: center;
	margin-top: 20px;
	color: #007BFF; /* Blue color for login link */
}
</style>
<title>User Signup</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">David Smith</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="userlogin.jsp">Login</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container mt-5">
		<h2 class="mb-4">
			User Signup <i class="fas fa-user-plus"></i>
		</h2>

		<form action="SignUpServlet.jsp" method="post">
			<div class="form-group">
				<label for="firstname">First Name:</label> <input type="text"
					class="form-control" id="firstname" name="firstname" required>
			</div>

			<div class="form-group">
				<label for="lastname">Last Name:</label> <input type="text"
					class="form-control" id="lastname" name="lastname" required>
			</div>

			<div class="form-group">
				<label for="creditcard">Credit Card:</label> <input type="text"
					class="form-control" id="creditcard" name="creditcard" required>
			</div>

			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" name="email" required>
			</div>

			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" name="password" required>
			</div>

			<button type="submit" class="btn btn-primary">
				Signup <i class="fas fa-user-plus"></i>
			</button>
		</form>

		<a href="userlogin.jsp" class="login-link">Already have an
			account? Login here.</a>
	</div>

	<!-- Bootstrap JS and jQuery -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
