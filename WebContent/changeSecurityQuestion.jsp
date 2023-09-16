<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
	<script>alert('Your security Question successfully changed!');</script>
<%}%>

<%
if("wrong".equals(msg)){	
%>
	<script>alert('Your Password is wrong!');</script>
<%}%>

<form action="changeSecurityQuestionSystem.jsp" method="post">
<h3>Select Your New Security Question</h3>
<select name="securityQuestion" required>
	<option value="What street did you live on in third grade?">What street did you live on in third grade?</option>
	<option value="In what city or town was your first job?">In what city or town was your first job?</option>
	<option value="What was your childhood nickname?">What was your childhood nickname?</option>
	<option value="In what city does your nearest sibling live?">In what city does your nearest sibling live?</option>
	<option value="What is the name of a college you applied to but didn't attend?">What is the name of a college you applied to but didn't attend?</option>
</select>
<h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Enter Your New Answer" required>

<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter Password(For Security)" required>
<br><br>
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>

</body>
</html>