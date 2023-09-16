<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In Form</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<script type = "text/javascript" src = "js/jquery-3.4.1.js"></script>
<script type = "text/javascript">
	$(document).ready(function() {
		$("#togglePassword").click(function() {
			const type = $("#pass").attr("type") === "password" ? "text" : "password";
			$("#pass").attr("type", type);
			this.classList.toggle('fa-eye-slash');
		});
	});
</script>
</head>
<body>
	<form action="loginSystem.jsp" method="post">
		<h2>Sign In</h2>
		<input type="email" name="email" placeholder="Email Address" required>
		<input type="password" id="pass" name="password" placeholder="Password" required>
		<i class="fa fa-fw fa-eye field_icon toggle-password" id="togglePassword"></i>
		<input type="submit" value="Login">
	</form>
	<p>Don't have an account ? <a href="signup.jsp" style="text-decoration: none;">Sign Up.</a></p>
	<p><a href="forgotPassword.jsp" style="text-decoration: none;">Forgot Password?</a></p>
	
	<%String msg=request.getParameter("msg");
	if("notexist".equals(msg)) {%>
		<script>alert("Incorrect Email or Password")</script>
	<%}%>
	
	<%if("invalid".equals(msg)) {%>
		<script>alert("Something Went Wrong! Try Again!")</script>
	<%}%>
</body>
</html>