<%@page import="com.service.TicketCreateservice"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Detail</title>
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
.sm-text{
	font-size: 17px;
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
			<a href="UserHome.jsp" class="btn btn-primary">Home</a>
		</div>
		<h1>&diams; Book Appointment &diams;</h1>
	</div>
	<br>
	<div class="container">
	<div class="ticket-no">
	<%
		TicketCreateservice tcs = new TicketCreateservice();
		int ticketNo = tcs.getTicketNum();
		session.setAttribute("ticketNo", ticketNo);
	%>
		<h1>Ticket No : <%= ticketNo %></h1>
		<span class="red-text sm-text"><i>Please keep a note of your ticket number while raising a query/issue.</i></span>
	</div>
		<form id="userForm" action="Processor">
			<table class="table table-bordered table-dark tab1">
				<tr>
					<th>Name<span class="red-text">*</span></th>
					<th><input type="text" id="name" name="Name" placeholder="Name" class="form-control" required autofocus></th>
				</tr>
				<tr>
					<th>Gender<span class="red-text">*</span></th>
					<th>
						<fieldset class="radio-control">
						<div class="custom-control custom-radio custom-control-inline">
   							<input type="radio" class="custom-control-input" id="Male" name="gender" value="Male">
   	 						<label class="custom-control-label" for="Male">Male</label>
  						</div>
  						<div class="custom-control custom-radio custom-control-inline">
						    <input type="radio" class="custom-control-input" id="Female" name="gender" value="Female">
						    <label class="custom-control-label" for="Female">Female</label>
  						</div>
  						<div class="custom-control custom-radio custom-control-inline">
						    <input type="radio" class="custom-control-input" id="Other" name="gender" value="Other">
						    <label class="custom-control-label" for="Other">Other</label>
  						</div><br>
  						</fieldset>
					</th>
				</tr>
				<tr>
					<th>Age<span class="red-text">*</span></th>
					<th><input type="text" id="age" placeholder="Age" class="form-control" name="age" required></th>
				</tr>
				<tr>
					<th>Allergies<span class="red-text">*</span></th>
					<th>
						<!-- <div class="custom-control custom-switch custom-control-inline">
							<input type="checkbox" class="custom-control-input other" id="allergy" name="allergy">
							<label class="custom-control-label" for="allergy">Do you have any allergies???</label>
						</div>
						<br><br>
						<fieldset class="allergy_topics" id="allergy_topics"> -->
							<select name="alergy" title="Please select something" class="custom-select" required>
								<option value="">Choose From Following</option>
		                        <option value="Penicillin">Penicillin</option>
		                        <option value="Sulfa Drugs">Sulfa Drugs</option>
		                        <option value="Aspirin">Aspirin</option>
		                        <option value="Codeine">Codeine</option>
		                        <option value="Local Anesthetics">Local Anesthetics</option>
		                        <option value="Others">Others (Please mention your allergies in description)</option> 
	                        </select>
                       <!--  </fieldset> -->
					</th>
				</tr>
				<tr>
					<th>Blood Group<span class="red-text">*</span></th>
					<th>
						<select name="bloodgroup" title="Please select something" class="custom-select" required>
							<option value="">Choose From Following</option>
	                        <option value="A+">A+</option>
	                        <option value="A-">A-</option>
	                        <option value="B+">B+</option>
	                        <option value="B-">B-</option>
	                        <option value="AB+">AB+</option>
	                        <option value="AB-">AB-</option>
	                        <option value="O+">O+</option>
	                        <option value="O-">O-</option>
                        </select>
					</th>
				</tr>
				<tr>
					<th>Appointment Treatment type<span class="red-text">*</span></th>
					<th>
					<fieldset class="radio-control">
						<div class="custom-control custom-radio custom-control-inline">
   							<input type="radio" class="custom-control-input" id="treatment1" name="treatment" value="Cardiovascular">
   	 						<label class="custom-control-label" for="treatment1">Cardiovascular Treatment</label>
  						</div><br>
  						<div class="custom-control custom-radio custom-control-inline">
   							<input type="radio" class="custom-control-input" id="treatment2" name="treatment" value="Neurological">
   	 						<label class="custom-control-label" for="treatment2">Neurological Treatment</label>
  						</div><br>
  						<div class="custom-control custom-radio custom-control-inline">
   							<input type="radio" class="custom-control-input" id="treatment3" name="treatment" value="Respiratory">
   	 						<label class="custom-control-label" for="treatment3">Respiratory Treatment</label>
  						</div><br>
  						<div class="custom-control custom-radio custom-control-inline">
   							<input type="radio" class="custom-control-input" id="treatment4" name="treatment" value="Cosmetic">
   	 						<label class="custom-control-label" for="treatment4">Cosmetic Treatment</label>
  						</div><br>
  						<div class="custom-control custom-radio custom-control-inline">
   							<input type="radio" class="custom-control-input" id="treatment5" name="treatment" value="Eye">
   	 						<label class="custom-control-label" for="treatment5">Eye Treatment</label>
  						</div><br>
  						</fieldset>
					</th>
				</tr>
				<tr>
					<th>Email<span class="red-text">*</span></th>
					<th><input type="email" id="email" placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" name="email" required></th>
				</tr>
				<tr>
					<th>Contact<span class="red-text">*</span></th>
					<th>
						<input type="text" id="contact" placeholder="Contact No." maxlength="10" name="contact" class="form-control" required>
					</th>
				</tr>
				<tr>
					<th>Description</th>
					<th>
						<textarea class="form-control" placeholder="Description" name="description" style="resize: none;" rows="5"></textarea>
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<label class="red-text">*Required fields</label>
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="Submit" name="action" class="btn btn-success btn-block">
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
</body>
<script type="text/javascript">
		/* $.validator.setDefaults( {
			submitHandler: function () {
				alert( "submitted!" );
			}
		} ); */
		
		/* $("#userForm").on("submit", function(event) {
		    event.preventDefault();
		}); */
		
		/* $(function () {
		    $('fieldset.allergy_topics').hide();
		    $('input[name="allergy"]').click(function () {
		        if (this.checked) {
		            $('fieldset.allergy_topics').show();
		        } else {
		            $('fieldset.allergy_topics').hide();
		        }
		    });
		}); */

		$( document ).ready( function () {
			
			$( "#userForm" ).validate( {
				rules: {
					Name: "required",
					age: "required",
					gender: "required",
					treatment: "required",
					email: {
						required: true,
						email: true
					},
					contact: {
						required: true,
						maxlength: 10,
						minlength: 10,
						number: true
					},
				},
				messages: {
					Name: "Please enter your Name",
					age: "Please enter your Age",
					gender: "Please select a Gender",
					treatment: "Please select a treatment type",
					contact: {
						required: "Please enter your Contact number",
						maxlength: "Contact number should be 10 digit long",
						minlength: "Contact number should be 10 digit long",
						number: "Contact sholud contain numbers only"
					},
					email: "Please enter a valid email address",
				},
				errorPlacement: function(error, element) 
		        {
		            if ( element.is(":radio") ) 
		            {
		                error.appendTo( element.parents('.radio-control') );
		            }
		            else 
		            { // This is the default behavior 
		                error.insertAfter( element );
		            }
		         }
			} );
		
		} );
	</script>
</html>