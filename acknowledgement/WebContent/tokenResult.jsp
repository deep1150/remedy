<%@page import="com.bean.Status"%>
<%@page import="com.service.TicketCreateservice"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<%
		String color="";
		if(session.getAttribute("status")!=null){
			Status st = (Status) session.getAttribute("status");
			
			if(st.getStatus().equals("Approved")){
				color="bg-success";
			}
			else{
				color="bg-danger";
			}
	%>
		<div align="center" id="resultDiv">
		<h2>Status</h2>
			<table class="table table-bordered tab2">
				<tr><th>ID</th><th><%= st.getId() %></th></tr>
				<tr><th>Name</th><th><%= st.getName() %></th></tr>
				<tr><th>Email</th><th><%= st.getEmail() %></th></tr>
				<tr><th>Status</th><th class="<%= color %>"><%= st.getStatus() %></th></tr>
			</table>
		</div>
	<%
		}
		else{
	%>
		<div align='center'>
			<h2>Sorry no records found.</h2>
		</div>
	<% 
		}
		session.setAttribute("status", null);
	%>
	</div>
</body>
</html>