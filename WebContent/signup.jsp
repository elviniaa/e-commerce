<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up Form</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
</head>
<body>
	<form action="signupSystem.jsp" method="post" onsubmit="return checkForm(event);">
		<h2>Sign Up</h2>
		<input type="text" name="name" placeholder="Full Name" required>
		<input type="email" name="email" placeholder="Email Address" required>
		<input type="number" name="mobileNumber" placeholder="Mobile Number" required>
		<input type="password" name="password" id="pass" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,13}$" oninvalid="setCustomValidity('Password must contain at least: \n- One  digit  \n- One uppercase and lowercase letter \n- 8 to 13 characters \n- One special character (!@#$%^&*_=+-)')" oninput="setCustomValidity('')" placeholder="Create Password" required>
		<input type="password" name="confpassword" id="confPass" placeholder="Confirm Password" required>
		<select name="securityQuestion" required>
			<option value="What street did you live on in third grade?">What street did you live on in third grade?</option>
			<option value="In what city or town was your first job?">In what city or town was your first job?</option>
			<option value="What was your childhood nickname?">What was your childhood nickname?</option>
			<option value="In what city does your nearest sibling live?">In what city does your nearest sibling live?</option>
			<option value="What is the name of a college you applied to but didn't attend?">What is the name of a college you applied to but didn't attend?</option>
		</select>
		<input type="text" name="answer" placeholder="Your Answer" required>
		<input type="submit" value="Sign Up">
	</form>
	<p>Already have an account ? <a href="login.jsp">Sign In.</a></p>
	
	<script type="text/javascript">
		function checkForm() {
			var check = true;
			if($("#pass").val() !== $("#confPass").val()) {
				alert("Passwords didn't match!");
			} else
				check = false;
			
			if(check != false)
				event.preventDefault();
		}
		
		<%String msg=request.getParameter("msg");
		if("valid".equals(msg)) {%>
			alert("Successfully Registered!");
			window.location.href='login.jsp';
		<%} else if("invalid".equals(msg)) {%>
			alert("Something Went Wrong! Try Again!");
		<%}%>
	</script>
</body>
</html>