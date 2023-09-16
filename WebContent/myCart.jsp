<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
	img {
		padding-top: 5px;
	}
	
	table, th {
		margin: 15px;
		text-align: center;
		padding-bottom: 5px;
	}
	
	.border {
		border-top: 1px solid #afafb6;
		border-left: 1px solid #afafb6;
		border-bottom: 1px solid #afafb6;
	}
	
	.border1 {
		border-top: 1px solid #afafb6;
		border-right: 1px solid #afafb6;
		border-bottom: 1px solid #afafb6;
	}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg)){
%>
	<script>alert('There is only one Quantity! So click on remove!');</script>
<%}%>

<%
if("removed".equals(msg)){	
%>
	<script>alert('Removed');</script>
<%}%>

<table>
<thead>
	<%
		int total=0;
		int sno=0;
		try {
			Database conProvider = new Database();
			Connection con = conProvider.getData();
			Statement st = con.createStatement();
			ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+session.getAttribute("email")+"' and address is NULL");
			while(rs1.next()) {
				total = rs1.getInt(1);
			}
	%>
		<thead style="border-bottom: 1px solid #afafb6;">
          <tr>
          	<th scope="col" width="20px">No</th>
          	<th scope="col"  width="40%">Product Image</th>
            <th scope="col">Product Name</th>
            <th scope="col">Price</th> 
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
		
	<%
		ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+session.getAttribute("email")+"' and cart.address is NULL");
		while(rs.next()) {
	%>
		<tr>
			<%sno=sno+1; %>
			<td><%out.println(sno); %></td>
			<td><img src="<%=rs.getString(6) %>" width="40%"></td>
	        <td><%=rs.getString(2) %></td>
	        <td><i class="fa fa-usd"><%=rs.getString(4) %></i></td>
	        <td><a href="incDecQuantitySystem.jsp?id=<%=rs.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(9) %> <a href="incDecQuantitySystem.jsp?id=<%=rs.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
	        <td><i class="fa fa-usd"><%=rs.getString(11) %></i></td>
	        <td><a href="removeFromCart.jsp?id=<%=rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
        </tr>
	<%  }	
	} catch(Exception e) {e.printStackTrace();} 
	%>
	</tbody>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th class="border">Total: </th>
			<th class="border1" scope="col"><i class="fa fa-usd"><%out.println(total);%></i></th>
			<%if(total>0){ %><th scope="col"><button style="border: none;"><a href="addressPaymentForOrder.jsp">Order</a></button></th><%} %>
		</tr>
</table>

</body>
</html>