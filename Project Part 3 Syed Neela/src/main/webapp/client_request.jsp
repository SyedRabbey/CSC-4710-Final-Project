<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="Model.Quotes"%>
<%@ page import="DAO.QuotesDAO"%>
<%@ page import="Helper.ConnectionProvider"%>
<%@ page import="Model.Users"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Client's Request for Quote</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f0f0f0; /* Light gray background */
	font-family: 'monospace', monospace;
	color: #333; /* Dark gray font color */
}

.container {
	background-color: #fff; /* White container background */
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #e44d26; /* Red heading color */
}

p {
	color: #4caf50; /* Green text color */
}

label {
	color: #555; /* Dark gray label color */
}

.form-control {
	border: 1px solid #ddd; /* Light gray border */
}

.btn-primary {
	background-color: #4caf50; /* Green button background */
	border: 1px solid #4caf50; /* Green button border */
}

.btn-primary:hover {
	background-color: #45a049; /* Darker green on hover */
}
</style>

</head>
<body>
	<%@include file="clientNavbar.jsp"%>


	<%
	// Check if the user is logged in
	Users user = (Users) session.getAttribute("user");
	if (user == null) {
		// If the user is not logged in, redirect to the login page
		response.sendRedirect("userlogin.jsp");
	}
	%>
	<div class="container mt-5">
		<h2>
			<i class="fas fa-file-alt"></i> Submit Request for Quote
		</h2>
		<form action="ClientRequestServlet.jsp" method="post">
			<!-- Display user information -->
			<p>
				Welcome,
				<%=user.getFirstname()%>
				<%=user.getLastname()%></p>
			<p>
				<i class="fas fa-envelope"></i> Email:
				<%=user.getEmail()%></p>

			<!-- Additional fields for quote request -->
			<div class="mb-3">
				<label for="initialPrice" class="form-label">Initial Price:</label>
				<input type="text" class="form-control" name="initialPrice" required>
			</div>

			<div class="mb-3">
				<label for="timeWindow" class="form-label">Time Window:</label> <input
					type="date" class="form-control" name="timeWindow" required>
			</div>

			<div class="mb-3">
				<label for="note" class="form-label">Note:</label>
				<textarea class="form-control" name="note" rows="4"></textarea>
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="fas fa-check"></i> Register a Quote
			</button>
		</form>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Font Awesome JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
