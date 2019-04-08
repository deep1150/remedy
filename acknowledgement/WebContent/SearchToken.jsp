<%@page import="com.bean.*"%>
<%@page import="com.service.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Token</title>
<link rel="icon" type="image/ico" href="images/plane.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>
<style>
.header{
	background-color: lightblue;
}
.tab1{
	width: 70%;
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 0 20px black;
}
.tab2{
	width: 70%;
	padding: 30px;
}
.signout{
	padding: 10px;
	float: right;
}
/* #resultDiv{
	visibility: hidden;
} */
</style>
</head>
<body>
<%
	TicketCreateservice tcs = new TicketCreateservice();
%>
<form action="Processor">
	<div align="center" class="jumbotron header">
		<div class="signout">
		<a href="UserHome.jsp" class="btn btn-primary">Back</a>
		</div>
		<h1>&diams; Search Token &diams;</h1>
	</div>
	<br>
	 <div class="mainDiv" align="center">
		
			<table class="table table-striped tab1">
				<tr>
					<th>
						<input type="text" id="search" name="SearchBox" placeholder="Enter Token Number" class="form-control" required autofocus>
					</th>
				</tr>
				<tr>
					<th>
						<input type="submit" id="Search" value="Search" name="action" class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal">
					</th>
				</tr>
			</table>
		
	</div>
	<div align="center">
	<%
		String color="";
		String action = request.getParameter("action");
		System.out.println(action);
		String msg=" ";
		if(action.equals("Navigate"))
				{
					%>
					<h2><%=msg %></h2>
					<%
				}
	else{
		msg="Sorry no records found.";
		System.out.println(action);
		if(session.getAttribute("status")!=null){
			Status st = (Status) session.getAttribute("status");
			if(st.getStatus().equals("Approved")){
				color="bg-success";
			}
			else{
				color="bg-danger";
			}
	%>
		<div id="resultDiv" align="center">
		<h2>Status</h2>
			<table class="table table-bordered tab2">
				<tr><th>Ticket No.</th><th colspan=3><%= st.getId() %></th></tr>
				<tr><th>Name</th><th colspan=3><%= st.getName() %></th></tr>
				<tr><th>Email</th><th colspan=3><%= st.getEmail() %></th></tr>
				<tr><th>Status</th><th colspan=3 class="<%= color %>"><%= st.getStatus() %></th></tr>
				<%
					if(st.getStatus().equals("Approved")){
						try{
							Ack ack = tcs.getAcknowledge(st.getId());
							String []acknow = ack.getAcknow().split(",");
							String doctor = acknow[0].toString();
							String special = acknow[1].toString();
							String date = acknow[2].toString();
							String time = acknow[3].toString();
				%>
					<tr class="bg-info"><th colspan=4><div align="center"><h3>Acknowledgement</h3></div></th></tr>
					<tr><th>Doctor</th><th><%= doctor %></th><th>Specialization</th><th><%= special %></th></tr>
					<tr><th>Date</th><th><%= date %></th><th>Time</th><th><%= time %></th></tr>
				<%
					}
						catch(Exception ex){
							System.out.println("Error : " + ex.getMessage());
						}
					}
				%>
			</table>
		</div>
	<%
		}
		else{
			msg="Sorry no records found.";
	%>
		<div id="error" align='center' style="display: block;">
			<h2><%=msg %></h2>
		</div>
	<% 
			}
		}
	%>
	</div>

	
	</form>
</body>
</html>