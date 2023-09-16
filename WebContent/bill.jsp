<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<html>
<head>
<title>Bill</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
	.strong {
		font-weight: bolder;
		color: #1f1f1f;
	}
</style>
</head>
<body>
<% 
String email=session.getAttribute("email").toString();
String name=session.getAttribute("name").toString();
try{
	int total=0;
	int sno=0;
	Database conProvider =new Database();
	Connection con=conProvider.getData();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs.next()) {
		total=rs.getInt(1);
	}
	ResultSet rs2=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs2.next()) {
		

%>
<fieldset>
<legend><b>Shopping Bill</b></legend>
<table>
	<tr>
		<td class="strong">ID</td>
		<td class="strong">:</td>
		<td><%=session.getAttribute("ID")%></td>
	</tr>
	<tr>
		<td class="strong">Name</td>
		<td class="strong">:</td>
		<td><%out.println(name);%></td>
	</tr>
	<tr>
		<td class="strong">Email</td>
		<td class="strong">:</td>
		<td><%out.println(email); %></td>
	</tr>
	<tr>
		<td class="strong">Mobile Number</td>
		<td class="strong">:</td>
		<td><%=rs2.getString(20) %></td>
	</tr>
	<tr>
		<td class="strong">Payment Method</td>
		<td class="strong">:</td>
		<td><%=rs2.getString(23) %></td>
	</tr>
	<tr>
		<td class="strong">Order Date</td>
		<td class="strong">:</td>
		<td><%=rs2.getString(21) %></td>
	</tr>
	<tr>
		<td class="strong">Expected Delivery</td>
		<td class="strong">:</td>
		<td><%=rs2.getString(22) %></td>
	</tr>
	<tr>
		<td class="strong">Address</td>
		<td class="strong">:</td>
		<td><%=rs2.getString(16) %></td>
	</tr>
	<tr>
		<td class="strong">City</td>
		<td class="strong">:</td>
		<td><%=rs2.getString(17) %></td>
	</tr>
	<tr>
		<td class="strong">State</td>
		<td class="strong">:</td>
		<td><%=rs2.getString(18) %></td>
	</tr>
	<tr>
		<td class="strong">Country</td>
		<td class="strong">:</td>
		<td><%=rs2.getString(19) %></td>
	</tr>
</table>
</fieldset>
<%break;}%>

<br>
<table style="text-align: center;">
  <tr>
	<th>No</th>
    <th width="50%">Product Name</th>
    <th>Price</th>
    <th width="10%">Quantity</th>
    <th width="20%">Sub Total</th>
  </tr>
  
  <%
  ResultSet rs1=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs1.next()){
	  sno=sno+1;
  %>
  
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(17) %></td>
    <td><i class="fa fa-usd"><%=rs1.getString(19) %></i></td>
    <td><%=rs1.getString(3) %></td>
    <td><i class="fa fa-usd"><%=rs1.getString(5) %></i></td>
  </tr>
  <tr>
<%} %>
</table>

<h3><mark>Total: <i class="fa fa-usd"><%out.println(total); %></i></mark></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>

<%} catch(Exception e){System.out.println(e);}%>
</body>
</html>