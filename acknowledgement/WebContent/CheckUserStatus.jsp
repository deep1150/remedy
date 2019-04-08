<%@include file="clearCache.jsp" %>
<%@page import="com.service.TicketCreateservice,java.util.*,com.bean.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Status</title>
<link rel="icon" type="image/ico" href="images/plane.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.signout{
	float: right;
}
.header{
	background-color: lightblue;
}
</style>
</head>
<body>
<%
	if(session.getAttribute("uname")!=null){
%>
<div align="center" class="jumbotron header">
	<div class="signout">
	<table>
		<tr>
			<td><a class="btn btn-success" href="Mailbox.jsp">MailBox</a></td>
			<td><a class="btn btn-danger" href="Logout.jsp">Logout</a></td>
		</tr>
	</table>
	</div>
		<h1>&diams; Check User Status &diams;</h1>
</div>
<div class="container" align="center">
	<table class="table table-bordered">
	<tr><th colspan="3" class="bg-secondary"><div align="center">Status</div></th><th class="bg-warning" colspan=4><div align="center">Acknowledgement</div></th></tr>
  	<tr class="bg-primary"><th>Id</th><th>Name</th><th>Status</th><th>Doctor</th><th>Specialization</th><th>Date</th><th>Time</th></tr>
      <%
      	String color = "";
      	TicketCreateservice tcs = new TicketCreateservice();
      	ArrayList<checkStatus> al=(ArrayList<checkStatus>)tcs.getUserStatus();
      	for(checkStatus cs:al){
      	if(cs.getStatus().equals("Approved")){
      		color = "bg-success";
      	}
      	else{
      		color = "bg-danger";
      	}
      %>
      <tr>
          <th><%= cs.getId() %>   </th>  
          <th><%= cs.getName() %>   </th>  
          <th class="<%= color %>"><%= cs.getStatus() %></th>
          <%
          	if(cs.getStatus().equals("Approved")){
          		try{
					Ack ack = tcs.getAcknowledge(cs.getId());
					String []acknow = ack.getAcknow().split(",");
					String doctor = acknow[0].toString();
					String special = acknow[1].toString();
					String date = acknow[2].toString();
					String time = acknow[3].toString();
          %>
          	<th><%= doctor %></th>
          	<th><%= special %></th>
          	<th><%= date %></th>
          	<th><%= time %></th>
          <%
          		}
          		catch(Exception ex){
          			System.out.println("Error : " + ex.getMessage());
          		}
          	}
          %> 
      </tr>
      <%
      	}
      %>
  </table>
</div>
<%
	}else{
		response.sendRedirect("invalidLoginMessage.jsp");
	}
%>
</body>
</html>