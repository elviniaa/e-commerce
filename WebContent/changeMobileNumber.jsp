<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Mobile Number</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
	<script>alert('Your Mobile Number successfully changed!');</script>
<%}%>

<%
if("wrong".equals(msg)){	
%>
	<script>alert('Your Password is wrong!');</script>
<%}%>

<form action="changeMobileNumberSystem.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="number" name="mobileNumber" placeholder="New Mobile Number" required>

<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter Password" required>
<br><br>
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
</html>