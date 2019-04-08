<%@include file="clearCache.jsp" %>
	<%
		HttpSession sn = request.getSession(false);
		sn.setAttribute("uname", null);
		sn.removeAttribute("uname");
		session.setAttribute("uname", null);
		session.invalidate();
		Thread.sleep(2000);
		response.sendRedirect("office.jsp");
	%>