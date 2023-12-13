<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.Quotes" %>
<%@ page import="DAO.QuotesDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="Model.Users" %>

<%
// Retrieve user information from the session
    Users user = (Users) session.getAttribute("user");

    if (user != null) {
        // Get user ID
        int userId = user.getId();

        // Create a QuotesDAO instance and call the method to get quotes by user ID
        QuotesDAO quotesDAO = new QuotesDAO(ConnectionProvider.getConnection());
        List<Quotes> quotesList = quotesDAO.getQuotesByUserId(userId);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>View Quotes</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    </head>
    <body>

        <%@include file="clientNavbar.jsp"%>
        <div class="container mt-5">
            <h2>View Quotes</h2>
            <% if (quotesList != null && !quotesList.isEmpty()) { %>
            <table class="table">
                <thead>
                    <tr>
                        <th><i class="fas fa-id-badge"></i> ID</th>
                        <th><i class="fas fa-user"></i> Contractor ID</th>
                        <th><i class="fas fa-dollar-sign"></i> Price</th>
                        <th><i class="fas fa-calendar-alt"></i> Schedule Start</th>
                        <th><i class="fas fa-calendar-alt"></i> Schedule End</th>
                        <th><i class="fas fa-sticky-note"></i> Note</th>
                        <th><i class="fas fa-info-circle"></i> Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Quotes quote : quotesList) {%>
                    <tr>
                        <td><%= quote.getId()%></td>
                        <td><%= quote.getContractorid()%></td>
                        <td><%= quote.getPrice()%></td>
                        <td><%= quote.getSchedulestart()%></td>
                        <td><%= quote.getScheduleend()%></td>
                        <td><%= quote.getNote()%></td>
                        <td><%= quote.getStatus()%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <% } else { %>
            <p>No quotes available for this user.</p>
            <% } %>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

<%
    } else {
        // If the user is not logged in, redirect to the login page
        response.sendRedirect("userlogin.jsp?error=notLoggedIn");
    }
%>
