<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sneakers</title>
<style>
body {
  font-family: Arial;
}

h2 {
  font-size: 50px;
  word-break: break-all;
  text-align: center;
}

.main {
  max-width: 1000px;
  margin: 15px;
}

.row {
  margin: 10px -250px 10px -15px;
}

.row,
.row > .column {
  padding: 8px;
}

.column {
  float: left;
  width: calc(100% / 4);
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

.content {
  background-color: #f1f1f1;
  padding: 10px;
}

.show {
  display: block;
}

.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}

.cart {
	float: right;
	background-color: white;
	border: none;
}

p {
	text-transform: uppercase;
	padding-top: 5px;
	text-align: center;
} 
</style>
</head>
<body>
<h2>SNEAKERS</h2>
<hr>
<div class="main">
<div class="row">
	<%
		try {
			Database conProvider=new Database();
			Connection con=conProvider.getData();
			Statement st=con.createStatement();
			ResultSet rs;
			String que;
				
			for(int id=1; id<=8; id++) {
				que="select * from product where id="+id;
				rs = st.executeQuery(que);
				while(rs.next()) {
	%>
					<div class="column">
  						<div class="content">
							<img src="<%=rs.getString(6) %>" style="width:100%">
							<p><%=rs.getString(2) %></p>
			            	<p><i class="fa fa-usd" data-price="<%=rs.getString(4) %>"> <%=rs.getString(4) %></i>
			            	<span><button class="cart"><a href="addToCartSystem.jsp?id=<%=rs.getString(1) %>"><i class='fas fa-cart-plus'></i></a></button></span></p>
			            </div>
    				</div>
    <%
    			}
			}
		} catch(Exception e){ System.out.println(e);}
	%>
</div>
</div>
</body>
</html>