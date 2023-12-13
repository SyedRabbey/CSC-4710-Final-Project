<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="DAO.OrdersDAO"%>
<%@ page import="Model.Orders"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="Helper.ConnectionProvider"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Orders</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
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
    <a class="navbar-brand" href="rootDashboard.jsp">David Smith Dashboard</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="quote_management.jsp"><i class="fas fa-inbox"></i> Incoming Requests</a></li>
            <li class="nav-item"><a class="nav-link" href="manageOrders.jsp"><i class="fas fa-tasks"></i> Manage Orders</a></li>
            <li class="nav-item"><a class="nav-link" href="manageBills.jsp"><i class="fas fa-file-invoice-dollar"></i> Manage Bills</a></li>
            <li class="nav-item"><a class="nav-link" href="specifiedfunctionalities.jsp"><i class="fas fa-cogs"></i> Specified functionalities</a></li>
        </ul>
    </div>
</nav>



	<div class="container mt-5">
		<h2>Manage Orders</h2>

		<!-- Display orders from the database -->
		<%
		OrdersDAO ordersDAO = new OrdersDAO(ConnectionProvider.getConnection());
		List<Orders> orderList = ordersDAO.getAllOrders();

		if (!orderList.isEmpty()) {
		%>
		<table class="table table-bordered mt-4">
			<thead>
				<tr>
					<th>ID</th>
					<th>Quote ID</th>
					<th>Price</th>
					<th>Schedule Start</th>
					<th>Schedule End</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Orders order : orderList) {
				%>
				<tr>
					<td><%=order.getId()%></td>
					<td><%=order.getQuoteid()%></td>
					<td><%=order.getPrice()%></td>
					<td><%=order.getSchedulestart()%></td>
					<td><%=order.getScheduleend()%></td>
					<td><a href="deleteOrder.jsp?id=<%=order.getId()%>"
						class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<p>No orders found in the database.</p>
		<%
		}
		%>

		<!-- Add a link or button to go back to the dashboard or another page -->
		<div class="mt-4">
			<a href="rootDashboard.jsp" class="btn btn-primary">Back to
				Dashboard</a>
		</div>
	</div>

	<!-- Include Bootstrap JS and jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
