<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>
	<form method="post" action="confAcc">
		<h2>Account Confirmation</h2>
		<input type="email" name="email" placeholder="Email Address" required>
		<input type="submit" value="Submit">
		<p class="signup">Remember Your Password ? <a href="login.jsp">Sign In.</a>
		<p class="signup">Don't have an account ? <a href="signup.jsp">Sign Up.</a>
	</form>

</body>
</html>