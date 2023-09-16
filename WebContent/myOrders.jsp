<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Orders</title>
</head>
<style>
	img {
		padding-top: 5px;
	}
	
	table, th {
		margin: 15px;
		text-align: center;
	}
	
	legend {
		margin: 10px;
	}
	
	fieldset {
		padding: 0px;
	}
</style>
<body>
<fieldset>
        <%
        	int sno=0;
        	String id="";
        	try {
        		Database conProvider =new Database();
        		Connection con=conProvider.getData();
        		Statement st=con.createStatement();
        %>
<table>
        <thead>
          <tr>
            <th scope="col" width="5px">No</th>
            <th scope="col" width="40%">Product Image</th>
            <th scope="col">Product Name</th>
            <th scope="col" width="5%">Price</th> 
            <th scope="col" width="8%">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Order Date</th>
            <th scope="col">Expected Delivery Date</th>
            <th scope="col">Payment Method</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>
        
        <%
        ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+session.getAttribute("email")+"' and cart.orderDate is not NULL;");
		while(rs.next()) {
			sno=sno+1;
			
        %>
        	
        	<tr>
        		<td><%out.println(sno); %></td>
        		<td><img src="<%=rs.getString(21) %>" width="40%"></td>
        		<td><%=rs.getString(17) %></td>
            	<td><i class="fa fa-usd"><%=rs.getString(19) %></i></td>
            	<td><%=rs.getString(3) %></td>
            	<td><i class="fa fa-usd"><%=rs.getString(5) %></i></td>
            	<td><%=rs.getString(11) %></td>
              	<td><%=rs.getString(12) %></td>
              	<td><%=rs.getString(13) %></td>
               	<td><%=rs.getString(15) %></td>
        	</tr>
        	
        <%		} %>
        <% 	} catch(Exception e) {e.printStackTrace();} %>
        </tbody>
        </table>
        	
</fieldset>
</body>
</html>