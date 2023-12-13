<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="DAO.BillsDAO"%>
<%@ page import="Model.Bills"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="Helper.ConnectionProvider"%>
<%@ page import="Model.Users"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bills</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom Styles -->
    <style>
        body {
            background-color: #FF6347; /* Red background */
            color: #008000; /* Green text color */
            font-family: 'monospace', sans-serif;
        }

        table {
            background-color: #F8F9FA; /* Light gray table background */
        }

        th, td {
            color: #008000; /* Green text color for table headers and data */
        }

        a {
            color: #FF6347; /* Red color for links */
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
            <a class="navbar-brand" href="rootDashboard.jsp">David Smith Dashboard</a>
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
    
    
    
    
    <div>
        <h2>Manage Bills</h2>

        <!-- Display all bills -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Order ID</th>
                    <th>Price</th>
                    <th>Discount</th>
                    <th>Balance</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                BillsDAO billsDAO = new BillsDAO(ConnectionProvider.getConnection());
                List<Bills> allBills = billsDAO.getAllBills(); // 0 or any specific order ID
                for (Bills bill : allBills) {
                %>
                <tr>
                    <td><%=bill.getId()%></td>
                    <td><%=bill.getOrderid()%></td>
                    <td><%=bill.getPrice()%></td>
                    <td><%=bill.getDiscount()%></td>
                    <td><%=bill.getBalance()%></td>
                    <td><%=bill.getStatus()%></td>
                    <td>
                        <a href="processBill.jsp?id=<%=bill.getId()%>&action=cancel"><i class="fas fa-times"></i> Cancel</a>
                    </td>
                </tr>
                <%
                }
                if (allBills.isEmpty()) {
                %>
                <tr>
                    <td colspan="7">No bills available.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
