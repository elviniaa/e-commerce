<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Products</title>
<style>
body {
  font-family: Arial;
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
  display: none; /* Hide all elements by default */
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

.select {
	float: right;
	margin-right: -200px;
}
</style>
</head>
<body>

<div class="main">

<div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> Show all</button>
  <button class="btn" onclick="filterSelection('Sneakers')"> Sneakers</button>
  <button class="btn" onclick="filterSelection('Socks')"> Socks</button>

<div class="row">
	<%
		try {
			Database conProvider=new Database();
			Connection con=conProvider.getData();
			Statement st=con.createStatement();
			ResultSet rs;
			String que;
				
			for(int id=1; id<=16; id++) {
				que="select * from product where id="+id;
				rs = st.executeQuery(que);
				while(rs.next()) {
	%>
					<div class="column <%=rs.getString(3)%>">
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
</div>
<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}

var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>

</body>
</html>
