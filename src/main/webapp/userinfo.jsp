<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>TIY, HW06</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar, .modal-footer, .modal-header {
            margin-bottom: 0;
            border-radius: 0;
            background-color: #095b77;
        }
        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 450px}
        /* Set black background color, white text and some padding */
        footer {
            background-color: #095b77;
            color: white;
            padding: 15px;
        }
        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {height:auto;}
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="home.jsp"><img src="imgs/TIY.png" style="width:40px;"></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="home.jsp">Home</a></li>
                <li class="active"><a href="/createUser">User Info</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-4 col-sm-offset-1 text-left">
            <h2>Users Info Report</h2>
            <table class="table table-striped">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Age</th>
                    <th>City</th>
                    <th>County</th>
                </tr>
                <c:forEach items="${users_list}" var="user">
                    <tr>
                        <td><c:out value="${user.first_name}"/></td>
                        <td><c:out value="${user.last_name}"/></td>
                        <td><c:out value="${user.age}"/></td>
                        <td><c:out value="${user.city}"/></td>
                        <td><c:out value="${user.county}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<br/>
<footer class="container-fluid text-center">
    <p> &copy; Copyright 2015-2017 - The Iron Yard</p>
</footer>
</body>
</html>