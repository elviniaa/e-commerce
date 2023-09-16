<%@page errorPage="error.jsp"%>
<%@page import="project.Database" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<style>
.logo {
	margin:10px;
	padding: 15px;
	display: inline-flex;
	color: #828bc2;
}

.right {
	float: right;
	padding: 15px;
	color: #828bc2;
	display: block;
}

.logout {
	display: inline-flex;
	margin-left: 40px;
	padding: 1px;
}

.fa-share-square {
	padding: 2px;
}

a {
	color: #828bc2;	
	text-decoration: none;
}

.search {
	margin-left: 1020px;
	margin-top: -30px;
	position: absolute;
}

a:hover {
	color: #110;
	text-decoration: none;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #828bc2;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a, .dropdown-btn {
	padding: 8px;
	text-decoration: none;
	font-size: 15px;
	color: #fff;
	display: block;
	border: none;
  	background: none;
  	width:100%;
  	cursor: pointer;
  	outline: none;
	transition: 0.3s;
}

.sidenav a:hover, .dropdown-btn:hover {
	color: #110;
}

.dropdown-container {
  display: none;
  padding-left: 8px;
}

.fa-caret-down {
  display: inline-flex;
}

.sidenav .closebtn {
	position: relative;
	font-size: 30px;
	margin-left: 150px;
	bottom: 30px;
}

.container {
	color: #828bc2;
	margin: 10px;
	padding: 5px;
}
.rightNav {
	float: right;
}

.topnav {
  background-color: #828bc2;
  overflow: hidden;
  margin: 5px;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #fff;
  color: #110;
}

.topnav a.active {
  background-color: white;
  color: #110;
}

img {
  margin-left: auto;
  margin-right: auto;
}

#main {
	transition: margin-left .5s;
	padding: 150px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>

</head>
<body>
	<div class="logo">
	<h1><img alt="logo" src="images/logo.jpg" style="width: 15%;">
	<span>Sneakers Store</span></h1>
	</div>
	
	<div class="right">
		<%String name = session.getAttribute("name").toString();%>
		<span style="color: #110;">Hi,<a href="changeDetails.jsp"> <strong><%out.println(name);%></strong></a></span>

		<div class="logout"><a href="logout.jsp">Logout<i class='fas fa-share-square'></i></a></div>
	</div>
		
		<div class="search">
			<form action="searchHome.jsp" method="post">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<button class="dropdown-btn"><a href="sneakers.jsp">Sneakers</a><span class="fa fa-caret-down"></span></button> 
		  <div class="dropdown-container">
		    <a href="sneakersMen.jsp">Men's</a>
		    <a href="sneakersWomen.jsp">Women's</a>
		  </div>
		<button class="dropdown-btn"><a href="socks.jsp">Socks</a><span class="fa fa-caret-down"></span></button>
		  <div class="dropdown-container">
		    <a href="socksMen.jsp">Men's</a>
		    <a href="socksWomen.jsp">Women's</a>
		    <a href="socksKid.jsp">Kids</a>
		  </div>
	</div>
	
	<div class="topnav" id="myTopnav">
		<a><span style="font-size: 20px; cursor: pointer" onclick="openNav()">&#9776;</span></a>
		<a href="home.jsp" class="nav-item">Home</a> 
		<a href="products.jsp">Products</a>
		<a href="messageUs.jsp" class="nav-item">Contact</a> 
		<a href="about.jsp" class="nav-item">About</a> 
		<div class="rightNav">
			<a href="myCart.jsp" class="nav-item">Cart</a> 
			<a href="myOrders.jsp" class="nav-item">Orders</a>
		</div>
	</div>
	
		<script>
			function openNav() {
				document.getElementById("mySidenav").style.width = "200px";
				document.getElementById("main").style.marginLeft = "200px";
			}

			function closeNav() {
				document.getElementById("mySidenav").style.width = "0";
				document.getElementById("main").style.marginLeft = "0";
			}
			
			var dropdown = document.getElementsByClassName("dropdown-btn");
			var i;

			for (i = 0; i < dropdown.length; i++) {
			  dropdown[i].addEventListener("click", function() {
				  this.classList.toggle("active");
				  var dropdownContent = this.nextElementSibling;
				  if (dropdownContent.style.display === "block") {
				  	dropdownContent.style.display = "none";
				  } else {
				  	dropdownContent.style.display = "block";
				  }
			  });
			}

		</script>
</body>
</html>
