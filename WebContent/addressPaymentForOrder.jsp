<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.UUID" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script>
if(window.history.forward(1)!=null)
	window.history.forward(1);

$(document).ready(function(){
	  $("select").change(function(){
		  if($("select").val() == "Cash on delivery(COD)") {
			  $(".ccNumb").attr("disabled", true);
			  $(".ccNumb").val("");
		  }
		  else
			$(".ccNumb").attr("disabled", false);
	  });
	  
	  $('.ccNumb').keypress(function() {
		  var foo = $(this).val().split("-").join(""); // remove hyphens
		  if (foo.length > 0) {
		    foo = foo.match(new RegExp('.{1,4}', 'g')).join("-");
		  }
		  $(this).val(foo);
		});
	});
	
</script>
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
	
	fieldset {
		margin-bottom: 10px;
	}
	
	.address {
		float: left;
		width: 51%;
		display: inline-flex;
	}
	
	.payment, .mobile, .submit {
		float: right;
		width: 43%;
	}
	
	.header {
		padding-right: 10px;
	}

</style>
</head>
<body>
<%String id=UUID.randomUUID().toString(); 
session.setAttribute("ID", id);%>
<h1 style="text-align: center;">ID: <%=id%></h1>
<table>
	<thead>
		<%
			int total=0;
			int sno=0;
			try {
				Database conProvider =new Database();
				Connection con=conProvider.getData();
				Statement st=con.createStatement();
				ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+session.getAttribute("email")+"' and address is NULL");
				while(rs1.next()){
					total=rs1.getInt(1);
				}
		%>
			<tr>
				<th scope="col" colspan="2" style="text-align: left; padding-bottom: 15px;"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
			</tr>
			
			<thead style="border-bottom: 1px solid #afafb6;">
          		<tr>
		          	<th scope="col" width="20px">No</th>
		          	<th scope="col"  width="40%">Product Image</th>
		            <th scope="col">Product Name</th>
		            <th scope="col">Price</th> 
		            <th scope="col">Quantity</th>
		            <th scope="col">Sub Total</th>
		    	</tr>
        	</thead>
        	<tbody>
        	
        <%
      		ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+session.getAttribute("email")+"' and cart.address is NULL");
     		while(rs.next()){
      	%>
        	<tr>
          		<%sno=sno+1; %>
           		<td><%out.println(sno); %></td>
           		<td><img src="<%=rs.getString(6) %>" width="40%"></td>
            	<td><%=rs.getString(2) %></td>
            	<td><i class="fa fa-usd"> <%=rs.getString(4) %></i></td>
            	<td> <%=rs.getString(9) %></td>
            	<td><i class="fa fa-usd"> <%=rs.getString(11) %></i></td>
            </tr>
        <%	}%>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th class="border">Total: </th>
			<th class="border1" scope="col"><i class="fa fa-usd"> <%out.println(total);%></i></th>
		</tr>
        
        
        <%
     	ResultSet rs2=st.executeQuery("select * from users where email='"+session.getAttribute("email")+"'");
     	while(rs2.next()){
     	%>
        	</tbody>
      </table>
      
<p style="color: red">*Fill form correctly!</p>      
<form action="addressPaymentForOrderSystem.jsp" method="post">
<fieldset class="address">
<legend>Billing Address</legend>
<table style="text-align: left;">
	<tr>
		<td class="header">Address</td>
		<td><input type="text" size="75%" name="address" value="<%=rs2.getString(7)%>" placeholder="Enter Address" required></td>
	</tr>
	
	<tr>
		<td class="header">City</td>
		<td><input type="text" size="75%" name="city" value="<%=rs2.getString(8)%>" placeholder="Enter City" required></td>
	</tr>
	<tr>
		<td class="header">State</td>
		<td><input type="text" size="75%" name="state" value="<%=rs2.getString(9)%>" placeholder="Enter State" required></td>
	</tr>
	<tr>
		<td class="header">Country</td>
		<td><input type="text" size="75%" name="country" value="<%=rs2.getString(10)%>" placeholder="Enter Country" required></td>
	</tr>
</table>
</fieldset>

<fieldset class="payment">
<legend>Payment Methods</legend>
 <select name="paymentMethod" id="payment">
 	<option value=". . ." disabled selected required>. . . </option>
 	<option value="Cash on delivery(COD)">Cash on delivery(COD)</option>
 	<option value="Online Payment">Online Payment</option>
 </select>
	<input class="ccNumb" maxlength="19" name="transactionId" placeholder="Enter Credit Card Number" onkeypress="return checkDigit(event)" disabled>
</fieldset>

<fieldset class="mobile">
<legend>Mobile Number</legend>
	<input type="text" name="mobileNumber" maxlength="15" value="<%=rs2.getString(3)%>" placeholder="Enter Mobile Number" required>
</fieldset>

<div class="submit">
	<button class="button" type="submit">Bill <i class='far fa-arrow-alt-circle-right'></i></button>
</div>
</form>
<%	}   
} catch(Exception e) {System.out.println(e);}%>

</body>
</html>