<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link rel="icon" type="image/ico" href="images/plane.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>
<style>
.header{
	background-color: lightblue;
}
.tab1{
	width: 50%;
	text-align: center;
}
.text1{
	font-size: 20px;
}
a:link{
	text-decoration: none;
}
.alink{
	border-radius: 10px;
	width: relative;
	color: black;
	padding: 20px;
	box-shadow: 0 0 20px black;
	box-shadow: 0 0 20px black;
	transition: 0.3s ease-in-out;
}
.alink:hover{
	color: green;
	box-shadow: 0 0 20px green;
	transition: 0.3s ease-in-out;
}
.signout{
	padding: 10px;
	float: right;
}
</style>
</head>
<body>
	<div align="center" class="jumbotron header">
		<div class="signout">
			<a href="index.jsp" class="btn btn-primary">Home</a>
		</div>
		<h1>&diams; User Dashboard &diams;</h1>
	</div>
	<br>
	<div class="mainDiv" align="center">
		<table class="table tab1">
			<tr>
				<th>
				<a href="UserDetail.jsp">
					<div class="alink">
						<i class="far fa-file-alt fa-6x"></i><br>
						<div class="text1">Submit queries/issues</div>
					</div>
					</a>
				</th>
				<th>
				<a href="SearchToken.jsp?action=Navigate">
					<div class="alink">
						<i class="fas fa-search fa-6x"></i><br>
						<div class="text1">Search status with token</div>
					</div>
				</a>
				</th>
			</tr>
		</table>
	</div>
</body>
</html>