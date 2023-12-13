<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="DAO.QuotesDAO"%>
<%@ page import="Model.Quotes"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="Helper.ConnectionProvider"%>
<%@ page import="Model.Users"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Incoming Requests</title>
<!-- Include your CSS stylesheets here -->
</head>
<body>
	<div>
		<h2>Incoming Requests</h2>

		<!-- Display incoming quote requests -->
		<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>Contractor ID</th>
					<th>Client ID</th>
					<th>Price</th>
					<th>Schedule Start</th>
					<th>Status</th>
					<th>Note</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				QuotesDAO quotesDAO = new QuotesDAO(ConnectionProvider.getConnection());
				List<Quotes> incomingRequests = quotesDAO.getAllQuotes();
				for (Quotes q : incomingRequests) {
				%>
				<tr>
					<td><%=q.getId()%></td>
					<td><%=q.getContractorid()%></td>
					<td><%=q.getClientid()%></td>
					<td><%=q.getPrice()%></td>
					<td><%=q.getSchedulestart()%></td>
					<td><%=q.getStatus()%></td>
					<td><%=q.getNote()%></td>
					<td><a
						href="processQuote.jsp?id=<%=q.getId()%>&action=approve">Approve</a>
						| <a href="processQuote.jsp?id=<%=q.getId()%>&action=reject">Reject</a></td>
				</tr>
				<%
				}
				if (incomingRequests.isEmpty()) {
				%>
				<tr>
					<td colspan="8">No incoming requests.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
