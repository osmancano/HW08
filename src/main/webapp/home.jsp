<!DOCTYPE html>
<html lang="en">
<head>
    <title>TIY, HW06</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function validateForm1(){
            var results = [];
            var mySelect = document.getElementById("myForm1").getElementsByTagName("select");
            $('#myForm1').find('select').each(function (index, val) {
                results[index] = $(val).val();
            });
            if(hasZero(results)){
                alert("You Must choose all the 6 numbers");
                return false;
            }
            if(hasDuplicates(results) || hasZero(results)){
                alert("Numbers must be unique");
                return false;
            }
        }
        function validateForm2() {
            var results = [];
            $('#myForm2').find('select').each(function (index, val) {
                results[index] = $(val).val();
            });
            if(hasZero(results)){
                alert("You Must choose all the 6 numbers");
                return false;
            }
            if(hasDuplicates(results) || hasZero(results)){
                alert("Numbers must be unique");
                return false;
            }
        }
        function hasZero(array) {
            return array.indexOf("0") != -1;
        }
        function hasDuplicates(array) {
            return (new Set(array)).size !== array.length;
        }
    </script>
    <style>
        html,body{
            height: 100%
        }
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
                <li class="active"><a href="home.jsp">Home</a></li>
                <li ><a href="/createUser">User Info</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-4 col-sm-offset-1 text-left">
            <h2>User Info Form</h2>
            <div>
                <form action="/createUser" id="myForm" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="txtFirstName">First Name:</label>
                        <input type="text" class="form-control" id="txtFirstName" name="txtFirstName" required>
                    </div>
                    <div class="form-group">
                        <label for="txtLastName">Last Name:</label>
                        <input type="text" class="form-control" id="txtLastName" name="txtLastName" required>
                    </div>
                    <div class="form-group">
                        <label for="txtAge">Age:</label>
                        <input type="number" class="form-control" id="txtAge" name="txtAge" min="1" max="100" required>
                    </div>
                    <div class="form-group">
                        <label for="txtCity">City:</label>
                        <input type="text" class="form-control" id="txtCity" name="txtCity" required>
                    </div>
                    <div class="form-group">
                        <label for="txtCounty">County:</label>
                        <input type="text" class="form-control" id="txtCounty" name="txtCounty" required>
                    </div>
                        <button type="submit" class="btn btn-info">Submit</button>
                    </form>
            </div>
        </div>
    </div>
</div>
<br/>
<footer class="container-fluid text-center">
    <p> &copy; Copyright 2015-2017 - The Iron Yard</p>
</footer>

</body>
</html>