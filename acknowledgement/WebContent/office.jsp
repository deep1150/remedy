<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.*, com.controller.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remedy Acknowledgement</title>
<link rel="icon" type="image/ico" href="images/plane.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.header{
	background-color: lightblue;
}
.loginDiv{
	text-align: center;
}
.table{
	width: 40%;
}
.btn1{
	width: 100%;
}
.input-group-addon{
	padding: 8px 15px;
	color: black; 
	background-color: white
}
.signout{
	padding: 10px;
	float: right;
}
</style>
</head>
<body>
	<div class="jumbotron header" align="center">
	<div class="signout">
		<a href="index.jsp" class="btn btn-primary">Home</a>
	</div>
		<h1>&diams; Remedy Acknowledgement &diams;</h1>
	</div>
	<br />
	<div class="loginDiv">
		<form action="Processor">
			<table class="table table-hover table-dark" align="center">
				<tr>
					<th>
						<div class="input-group">
   							<div class="input-group-addon rounded-left">
								<i class="fas fa-user fa-lg"></i>
   							</div>
						<input type="text" placeholder="User Name" name="uname" class="form-control" autofocus required>
						</div>
					</th>
				</tr>
				<tr>
					<th>
						<div class="input-group">
   							<div class="input-group-addon rounded-left">
								<i class="fas fa-lock fa-lg"></i>
   							</div>
						<input type="password" placeholder="Password" name="pword" class="form-control" required>
						</div>
					</th>
				</tr>
				<tr><th><input type="submit" value="Login" class="btn btn-success btn1" name="action"></th></tr>
			</table>
		</form>
	</div>
	<footer align="center">
		<p>Posted by: Hege Refsnes</p>
  		<p>Contact information: <a href="mailto:someone@example.com">
  			someone@example.com</a>.</p>
	</footer>
</body>
<!-- <script>
	var x = $("#wrong").val();
	$(document).ready(function(){
		if(x!=null){
			alert(x);
		}
	});
</script> -->
</html>