<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="DAO.QuotesDAO"%>
<%@ page import="DAO.BillsDAO"%>
<%@ page import="Model.Quotes"%>
<%@ page import="Model.Bills"%>
<%@ page import="DAO.QuotesDAO"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="Helper.ConnectionProvider"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Root User Dashboard</title>
        <!-- Include Bootstrap CSS -->
        <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
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

            .table th,
            .table   {
                color: #FFFFFF; /* White text color for table headers and cells */
            }

            .table thead {
                background-color: #228B22; /* Dark green background for table header */
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

            .navbar-brand,
            .navbar-nav .nav-link {
                color: #FFFFFF !important; /* White text color for navbar links */
            }

            a {
                color: #FF6347; /* Red color for links */
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">David Smith Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarNav" aria-controls="navbarNav"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end"
                 id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="quote_management.jsp">Incoming
                            Requests</a></li>
                    <li class="nav-item"><a class="nav-link" href="manageOrders.jsp">Manage
                            Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="manageBills.jsp">Manage
                            Bills</a></li>
                    <li class="nav-item"><a class="nav-link"
                                            href="specifiedfunctionalities.jsp">Specified functionalities</a></li>
                </ul>
            </div>
        </nav>

        <div class="container mt-5">
            <h2>David Smith Dashboard</h2>

            <!-- Display most recent quote -->
            <div class="mt-4">
                <h3>Most Recent Quote</h3>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Contractor ID</th>
                            <th>Client ID</th>
                            <th>Price</th>
                            <th>Schedule Start</th>
                            <th>Schedule End</th>
                            <th>Note</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody >
                        <%
                            QuotesDAO quotesDAO = new QuotesDAO(ConnectionProvider.getConnection());
                            Quotes recentQuote = quotesDAO.getMostRecentQuoteFromDatabase();
                            if (recentQuote != null) {
                        %>
                        <tr style="color: black;">
                            <td><%=recentQuote.getId()%></td>
                            <td><%=recentQuote.getContractorid()%></td>
                            <td><%=recentQuote.getClientid()%></td>
                            <td><%=recentQuote.getPrice()%></td>
                            <td><%=recentQuote.getSchedulestart()%></td>
                            <td><%=recentQuote.getScheduleend()%></td>
                            <td><%=recentQuote.getNote()%></td>
                            <td><%=recentQuote.getStatus()%></td>
                        </tr>

                        <%
                        } else {
                        %>
                        <tr>
                            <td colspan="8">No recent quotes.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <!-- Display most recent bill -->
            <div class="mt-4">
                <h3>Most Recent Bill</h3>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Order ID</th>
                            <th>Price</th>
                            <th>Discount</th>
                            <th>Balance</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            BillsDAO billsDAO = new BillsDAO(ConnectionProvider.getConnection());
                            Bills recentBill = billsDAO.getMostRecentBillFromDatabase();
                            if (recentBill != null) {
                        %>
                        <tr style="color: black;">
                            <td><%=recentBill.getId()%></td>
                            <td><%=recentBill.getOrderid()%></td>
                            <td><%=recentBill.getPrice()%></td>
                            <td><%=recentBill.getDiscount()%></td>
                            <td><%=recentBill.getBalance()%></td>
                            <td><%=recentBill.getStatus()%></td>
                        </tr>
                        <%
                        } else {
                        %>
                        <tr>
                            <td colspan="6">No recent bills.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
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
