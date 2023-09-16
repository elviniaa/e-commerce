<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add or Change Address</title>
<style>
	fieldset {
		margin-bottom: 10px;
		border: 1px solid rgba(0, 0, 0, .2);

	}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
	<script>alert('Address Successfully Updated !');</script>
<%}%>

<%
if("invalid".equals(msg)){	
%>
	<script>alert('Some thing Went Wrong! Try Again!');</script>
<%}%>

<%
try{
	Database conProvider =new Database();
	Connection con=conProvider.getData();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where name='"+name+"'");
	while(rs.next()){
%>
	<form action="addChangeAddressSystem.jsp" method="post">
	<fieldset>
		<legend>Enter Address</legend>
		<input style="width:98%;" class="input-style" type="text" name="address" value="<%=rs.getString(7)%>" placeholder="Enter Address" required>
	</fieldset>
	
	<fieldset>
		<legend>Enter City</legend>
		<input style="width:98%;" class="input-style" type="text" name="address" value="<%=rs.getString(8)%>" placeholder="Enter City" required>
	</fieldset>

	<fieldset>
		<legend>Enter State</legend>
		<input style="width:98%;" class="input-style" type="text" name="address" value="<%=rs.getString(9)%>" placeholder="Enter State" required>
	</fieldset>
	
	<fieldset>
		<legend>Enter Country</legend>
		<input style="width:98%;" class="input-style" type="text" name="address" value="<%=rs.getString(10)%>" placeholder="Enter Country" required>
	</fieldset>

	 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
	</form>
<%}
} catch(Exception e){System.out.println(e);}%>
</body>
</html>