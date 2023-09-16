<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Profile</title>
<style>
	p {
		margin: 15px;
	}
</style>
</head>
<body>
<%
try {
		Database conProvider =new Database();
		Connection con=conProvider.getData();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where name='"+name+"'");
		while(rs.next()){
			if(rs.getString(7) == "") {
%>
				<p>Name: <%=rs.getString(1) %></p>
				<p>Email: <%=rs.getString(2) %></p>
				<p>Mobile Number: <%=rs.getString(3) %></p>
				<p>Security Question: <%=rs.getString(4) %></p>
			<%} else {%>
				<p>Name: <%=rs.getString(1) %></p>
				<p>Email: <%=rs.getString(2) %></p>
				<p>Mobile Number: <%=rs.getString(3) %></p>
				<p>Security Question: <%=rs.getString(4) %></p>
				<p>Address: <%=rs.getString(7) %></p>
				<p>City: <%=rs.getString(8) %></p>
				<p>State: <%=rs.getString(9) %></p>
				<p>Country: <%=rs.getString(10) %></p>		
<%		}
	}
} catch(Exception e){System.out.println(e);}
%>
</body>
</html>