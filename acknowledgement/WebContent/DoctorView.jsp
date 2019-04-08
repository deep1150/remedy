<%@include file="clearCache.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.service.*, com.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor View</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<style>
.red-text{
	color: red;
}
.header{
	background-color: lightblue;
}
.div-right{
	float:right;
	padding: 10px;
}
</style>
</head>
<body>
<%
	if(session.getAttribute("uname")!=null){
	TicketCreateservice tcs = new TicketCreateservice();
	try{
		int id = Integer.parseInt(request.getParameter("mail"));
		UserDetails ud = tcs.getUserDetailList(id);
%>
	<div class="card">
    	<div class="card-body" id="mainContent">
      		<h2><%= ud.getName() %></h2>
      		<h4><%= ud.getEmail() %></h4>
    	</div>
    </div>
	<br>
	<div class="container">
		<form id="userForm" action="Processor" target="_parent">
			<table class="table table-bordered table-dark tab1">
				<tr>
					<th>Ticket No.<span class="red-text"></span></th>
					<th><input type="text" id="ticketno" class="form-control label-text" name="ticketno" value="<%= ud.getTicketno() %>" disabled autofocus></th>
				</tr>
				<tr>
					<th>Name<span class="red-text"></span></th>
					<th><input type="text" id="name" class="form-control label-text" name="name" value="<%= ud.getName() %>" disabled></th>
				</tr>
				<tr>
					<th>Gender<span class="red-text"></span></th>
					<th>
						<input type="text" id="gender" class="form-control label-text" name="gender" value="<%= ud.getGender() %>" disabled>
					</th>
				</tr>
				<tr>
					<th>Age<span class="red-text"></span></th>
					<th><input type="text" id="age" class="form-control label-text" name="age" value="<%= ud.getAge() %>" disabled></th>
				</tr>
				<tr>
					<th>Allergies<span class="red-text"></span></th>
					<th>
						<input type="text" id="allergies" class="form-control label-text" name="allergy" value="<%= ud.getAllergy() %>" disabled>
					</th>
				</tr>
				<tr>
					<th>Blood Group<span class="red-text"></span></th>
					<th>
						<input type="text" id="blood" class="form-control label-text" name="bloodgroup" value="<%= ud.getBloodgroup() %>" disabled>
					</th>
				</tr>
				<tr>
					<th>Appointment Treatment type<span class="red-text"></span></th>
					<th>
						<input type="text" id="treatment" class="form-control label-text" name="treatment" value="<%= ud.getTreatment() %>" disabled>
					</th>
				</tr>
				<tr>
					<th>Email<span class="red-text"></span></th>
					<th><input type="text" id="email" class="form-control label-text" name="email" value="<%= ud.getEmail() %>" disabled></th>
				</tr>
				<tr>
					<th>Contact<span class="red-text"></span></th>
					<th>
						<input type="text" id="contact" class="form-control label-text" name="contact" value="<%= ud.getContact() %>" disabled>
					</th>
				</tr>
				<tr>
					<th>Description</th>
					<th>
						<textarea class="form-control" placeholder="Description" name="description" style="resize: none;" rows="5" disabled><%= ud.getDescription() %></textarea>
					</th>
				</tr>
			
				<tr>
					<th colspan="2">
						<input type="submit" value="Connect" name="action" class="btn btn-success btn-block">
						<%
							session.setAttribute("user", ud);
						%>
					</th>
				</tr>
			</table>
		</form>
	</div>
	<br>
    <div align="center">
		<p>Posted by: Hege Refsnes</p>
  		<p>Contact information: <a href="mailto:someone@example.com">
  			someone@example.com</a>.</p>
	</div>
<%
	}catch(Exception ex){
		response.sendRedirect("invalidLoginMessage.jsp");
		System.out.println("Error : " + ex.getMessage());
	}
	}else{
		response.sendRedirect("invalidLoginMessage.jsp");
	}
%>
</body>
</html>