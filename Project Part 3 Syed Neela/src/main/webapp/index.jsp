<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    
    <!-- Your custom CSS if needed -->
    <style>
        body {
            padding: 0px;
            font-family: 'monospace', sans-serif;
            background-color: #f8f9fa; /* Light gray background */
        }

        h1 {
            color: #dc3545; /* Red color for headings */
        }

        .card {
            background-color: #28a745; /* Green color for cards */
            color: #fff; /* White text color for cards */
        }

        .navbar {
            background-color: #007bff; /* Blue color for navbar */
        }

        .navbar-brand,
        .navbar-nav .nav-link {
            color: #fff !important; /* White text color for navbar links */
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">David Smith Contractor</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="userlogin.jsp">Client's Log In</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">David Smith's Log In</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="root.jsp">Initialize Database</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <h1 class="text-center">Welcome to David Smith Contractor Web Base</h1>

    <div class="row justify-content-center mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Navigation Menu</h5>
                </div>
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="userlogin.jsp">Client's Log In</a>
                        </li>
                        <li class="list-group-item">
                            <a href="login.jsp">David Smith's Log In</a>
                        </li>
                        <li class="list-group-item">
                            <a href="root.jsp">Initialize Database</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js (optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"
        integrity="sha384-VqO8kahzfjBLl6SvEXuAqjsQvTowb4pJfl5a1tZi83ic9OdkkcttKbq5Rz0cUEx9"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyIxSTSM9RdCRO"
        crossorigin="anonymous"></script>
<!-- Your custom scripts if needed -->
</body>
</html>
