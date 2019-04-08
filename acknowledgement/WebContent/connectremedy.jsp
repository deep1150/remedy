<%@include file="clearCache.jsp" %>
<%@page import="com.service.TicketCreateservice"%>
<%@page import="java.text.*, java.util.*, com.bean.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Connect Remedy</title>
<link rel="icon" type="image/ico" href="images/plane.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.red-text{
	color: red;
}
.header{
	background-color: lightblue;
}
.signout{
	float: right;
}
</style>
</head>
<body>
<%
	if(session.getAttribute("uname")!=null){
%>
<div align="center">
    
<div align="center" class="jumbotron header">
	<div class="signout">
	<table>
		<tr>
			<td><a class="btn btn-success" href="Mailbox.jsp">MailBox</a></td>
			<td><a class="btn btn-danger" href="Logout.jsp">Logout</a></td>
		</tr>
	</table>
	</div>
		<h1>&diams; Connect Remedy &diams;</h1>
	</div>
</div>
<div class="container">
<%
	UserDetails ud = (UserDetails)session.getAttribute("user");
	TicketCreateservice tcs = new TicketCreateservice();
	Status st = tcs.getStatus(ud.getTicketno());
	Ack ack = tcs.getAcknowledge(ud.getTicketno());
%>
	<div class="card">
		<div class="card-body div1">
			<h5>Ticket No : <%=st.getId() %></h5>
			<h5>Name : <%= st.getName() %></h5>
		</div>
	</div>
</div>
<div class="container">
<div align="center">
	<form action="Processor">
	<input type="hidden" name="ticketno" value="<%= st.getId() %>">
	<div align="center">
	<%
		if(tcs.getAckId(ud.getTicketno())){
			String []acknow = ack.getAcknow().split(",");
			String doctor = acknow[0].toString();
			String special = acknow[1].toString();
			String date = acknow[2].toString();
			String time = acknow[3].toString();
	%>
		<div class="card" align="center">
			<div class="card-header bg-warning"><h3>Resources already allocated.</h3></div>
			<div class="card-body">
				<table class="table table-bordered" style="width: 70%;">
					<tr><th>Doctor</th><th><%= doctor %></th><th>Specialization</th><th><%= special %></th></tr>
					<tr><th>Date</th><th><%= date %></th><th>Time</th><th><%= time %></th></tr>
				</table>
			</div>
		</div>
	<%
		}
		else{
			int count = tcs.getDocStatus(ud.getTreatment());
			if(count==0){
	%>
		<div class="card">
			<div class="card-body bg-danger">
				<h2>Sorry no doctors found for your treatment!!!</h2>
			</div>
		</div>
	</div>
	<%
			}else{
	%>
	<table class="table table-bordered">
		<tr>
			<th>Assign Resources</th>
			<th colspan="3">
				<select name="doctor" class="custom-select">
				<option value="">Choose from Following</option>
					<%
						try{
						  	ArrayList<Doctor> docname=tcs.getDoctorName(ud.getTreatment());
						   	for(Doctor d : docname){
						   		String iName = d.getId()+"#"+d.getName()+"#"+d.getSpecial();
					%>
						<option value="<%= iName %>"><%=d.getName() %>(<%=d.getSpecial() %>)</option>
					<%
						}
					%>
				</select>
			</th>
		</tr>
		<tr>
			<th>Date</th>
			<th>
				<%
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Date date = new Date();
					String date1 = dateFormat.format(date);
				%>
				<input type="date" id="date" name="date" min="<%= date1 %>" class="form-control">
			</th>
			<th>Time</th>
			<th>
				<select name="time" class="custom-select">
					<option value="">Choose from Following</option>
					<option value="10AM - 11AM">10AM - 11AM</option>
					<option value="11AM - 12PM">11AM - 12PM</option>
					<option value="1PM - 2PM">1PM - 2PM</option>
					<option value="2PM - 3PM">2PM - 3PM</option>
					<option value="3PM - 4PM">3PM - 4PM</option>
					<option value="4PM - 5PM">4PM - 5PM</option>
				</select>
			</th>
		</tr>
		<tr>
			<td colspan=4 style="text-align: center;">
			<input type="submit" class="btn btn-success btn-block" name="action" value="Send Acknowledgement">&nbsp;&nbsp;
			
		</tr>
	</table>
	<%
						}
			catch(Exception ex){
					%>
					
						<div class="card">
							<div class="card-body">
								<h2>Sorry no doctors found for your treatment!!!</h2>
							</div>
						</div>
					
					<%
			}
		}
		}
	%>
	
</form>
</div>
</div>
<%
	}else{
		response.sendRedirect("invalidLoginMessage.jsp");
	}
%>
</body>
</html>