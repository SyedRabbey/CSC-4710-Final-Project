<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Include Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- Custom Styles -->
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa; /* Light gray background */
            }

            .container {
                margin-top: 0px;
            }

            h2 {
                color: #007bff; /* Blue heading color */
            }

            table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #dee2e6; /* Light gray border */
            }

            th {
                background-color: #007bff; /* Blue header background */
                color: #ffffff; /* White header text color */
            }

            tbody tr:hover {
                background-color: #f8f9fa; /* Light gray background on hover */
            }

            .no-bills {
                text-align: center;
                color: #868e96; /* Dark gray text color */
            }

            .action-links {
                color: #007bff; /* Blue link color */
                text-decoration: none;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="clientNavbar.jsp" %>

        <div class="container">
            <h2>Manage Bills</h2>

            <!-- Display all bills -->
            <table class="table">
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
                        List<Bills> allBills = billsDAO.getAllBillsForOrder(0); // 0 or any specific order ID
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
                            <a href="processBill.jsp?id=<%=bill.getId()%>&action=pay" class="action-links">Pay</a>
                            <a href="processBill.jsp?id=<%=bill.getId()%>&action=cancel" class="action-links">Cancel</a>
                        </td>
                    </tr>
                    <%
                        }
                        if (allBills.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="7" class="no-bills">No bills available.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Include Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
