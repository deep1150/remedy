<%@include file="clearCache.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<link rel="icon" type="image/ico" href="images/plane.ico">
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
.error {
  color: red;
  padding: 5px;
  border: 1px dotted red;
}
.signout{
	float: right;
	padding: 10px
}
.myButton{
	width: 49%;
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
		<h1>&diams; Change Password &diams;</h1>
	</div>
	<div class="container">
	<form name="ChangePasswordForm" id="ChangePasswordForm" action="Processor">
	<table class="table table-bordered table-dark tab1" >
        <tr>
            <th>Name</th>
            <th><input type="text" name="name" value="<%=session.getAttribute("uname")%>" required class="form-control" readonly/></th>
        </tr>
        <tr>
         	<th>Old Password<span class="red-text">*</span></th>
         	<th>
          		<input name="OldPassword" type="password" placeholder="Old Password" id="oldpwd" required class="form-control">
         	</th>
        </tr>
        <tr>
          	<th>New Password<span class="red-text">*</span></th>
          	<th>
         		<input name="newpassword" type="password" placeholder="New Password" id="newpwd" required class="form-control">
          	</th>
        </tr>
        <tr>
          	<th>Confirm Password<span class="red-text">*</span></th>
          	<th>
           		<input name="conpassword" type="password" placeholder="Confirm Password" id="conpwd" required class="form-control">
          	</th>
        </tr>
        <tr>
			<th colspan="2">
				<label class="red-text">*Required fields</label>
			</th>
		</tr>
        <tr>
           	<th colspan=2 align="center"><input type="submit" name="action" class="btn btn-success myButton" value="Change Password">&nbsp;&nbsp;
           	<input type="reset" class="btn btn-danger myButton" value="Reset"/></th>
        </tr>
</table>
</form>
</div>
<%
	}else{
		response.sendRedirect("invalidLoginMessage.jsp");
	}
%>
</body>
<script type="text/javascript">
$( document ).ready( function () {
	$( "#ChangePasswordForm" ).validate( {
		rules: {
			OldPassword: "required",
			newpassword: "required",
			conpassword: {
				required: true,
				equalTo: "#newpwd",
			},
		},
		messages: {
			OldPassword: "Please enter your correct old password",
			newpassword: "Please enter a new password",
			conpassword: {
				required: "Please enter the same password as above",
				equalTo: "Please enter the same password as above",
			},
		},
		errorPlacement: function(error, element) 
        {
        	error.insertAfter( element );
        }
	} );

} );
</script>
</html>
