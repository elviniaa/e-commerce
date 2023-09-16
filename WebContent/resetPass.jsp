<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type = "text/javascript" src = "js/jquery-3.4.1.js"></script>
<script type = "text/javascript">
	function checkForm() {
		var check = true;
		if($("#pass").val() !== $("#confPass").val()) {
			alert("Passwords didn't match!");
		} else
			check = false;
		
		if(check != false)
			event.preventDefault();
	}
</script>
<title>Reset Password</title>
</head>
<body>
	<form name="validate" method="post" action="reset" onsubmit="return checkForm(event);">
		<h2>Reset Password</h2>
		<input type="password" name="password" id="pass" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,13}$" 
		oninvalid="setCustomValidity('New Password must contain at least: \n- One  digit  \n- One uppercase and lowercase letter \n- 8 to 13 characters \n- One special character (!@#$%^&*_=+-)')" oninput="setCustomValidity('')" placeholder="Reset Password" required>
		<input type="password" id="confPass" name="confpassword" placeholder="Confirm New Password" required>
		<input type="submit" value="Submit">
	</form>
	<p><a href="login.jsp">Login</a></p>
</body>
</html>