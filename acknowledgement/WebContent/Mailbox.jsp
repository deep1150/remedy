<%@include file="clearCache.jsp" %>
<%@page import="com.service.TicketCreateservice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page import="com.bean.*, com.controller.Processor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mailbox</title>
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
.avatar {
  vertical-align: middle;
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
.signout{
	padding: 10px;
	float: right;
}
.mainBody-left{
	float: left;
	width: 25%;
	height: 500px;
	overflow: auto;
}
.mainBody-right{
	float: right;
	width: 75%;
}
#mail-body{
	height: auto;
	height: 500px;
	display: none;
}
.content-frame{
	border: 1px solid lightgrey;
	height: 500px;
	text-align: center;
	overflow: auto;
}
a {
	display: block;
	color:blue;
	text-decoration: none;
}
a:hover{
	display: block;
	color:green;
	background-color: lightgrey;
	text-decoration: none;
}
a:active{
	display: block;
	color:green;
	background-color: grey;
	text-decoration: none;
}
.mailContent:hover{
	display: block;
	color:green;
	background-color: lightgrey;
	text-decoration: none;
}
</style>
</head>
<body>
<%
	HttpSession sn = request.getSession(false);
	System.out.println("Before session");
	if(sn.getAttribute("uname")!=null){
		System.out.println("After session");
%>
	<div class="card">
 		<div class="card-body">
 			 <!-- <img src="images/batman.png" width="60">&nbsp; -->
 			 <div class="d-inline-block">
 			 <%
 			 	String name = (String) session.getAttribute("uname");
 			 %>
  				<h1>Hello, <%= name %></h1>
			</div>
			<div class="signout">
				<table>
					<tr>
						<td><a class="btn btn-success" href="CheckUserStatus.jsp">Check User Status</a></td>
						<td><a class="btn btn-info" href="changePassword.jsp">Change Password</a></td>
						<td><a class="btn btn-danger" href="Logout.jsp">Logout</a></td>
					</tr>
				</table>
			</div>
 		</div>
	</div>
	<br />
	<div class="mainBody">
		<div class="mainBody-left">
			<div class="card">
			  	<%
			  		TicketCreateservice tcs = new TicketCreateservice();
					ArrayList<UserDetails> udlist = tcs.getUserDetails();
					for(UserDetails ud : udlist){
				%>
		    		<a href="DoctorView.jsp?mail=<%= ud.getTicketno() %>" target="mail-body" class="divlink" id="link">
		    		<div class="card mailContent">
		    			<div class="card-body">
			      			<h5 class="card-title"><%= ud.getName() %></h5>
			      			<p class="card-text"><%= ud.getEmail() %></p>
		    			</div>
		    		</div>
		    		</a>
				<% 
					}
				%> 
			</div>
		</div>
		<div class="mainBody-right">
			<div class="card">
				<div class="content-frame">
				<br><br><br><br><br>
	  				<span class="fa-stack fa-5x">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="far fa-envelope fa-stack-1x fa-inverse"></i>
					</span>
					<h3>Your Mailbox</h3>
				</div>
    			<iframe id="mail-body" frameborder="0" name="mail-body" class="card-body">
    			</iframe>
    		</div>
    	</div>
	</div>
<%
	}else{
		response.sendRedirect("invalidLoginMessage.jsp");
	}
%>
</body>
<script type="text/javascript">
    $(document).ready(function(){
         $(".divlink").click(function(){
        	 $(".content-frame").hide();
        	 $("#mail-body").show();
        	 $("#mail-body").attr("src" , $(this).attr("href"));
         });
    });
</script>
</html>