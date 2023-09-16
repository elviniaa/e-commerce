<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="dsfsdv.png" type="image/png" sizes="20x20">
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
	a {
		text-decoration: none;
		padding: 20px;
	}
	
	a:hover {
		color: #110;
	}
</style>
</head>
    <!--Header-->
    <br>
    <div>
            <center><h2>Profile <i class="fa fa-edit"></i></h2></center>
            <%String name=session.getAttribute("name").toString(); %>
            <h2><a href="home.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
            <a href="changeDetails.jsp">View Profile <i class='fas fa-user-alt'></i></a>
            <a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>
            <a href="addChangeAddress.jsp">Add or change Address <i class='fas fa-map-marker-alt'></i></a>
            <a href="changeSecurityQuestion.jsp">Change Security Question <i class="fa fa-repeat"></i></a>
            <a href="changeMobileNumber.jsp">Change Mobile Number <i class='fas fa-phone'></i></a>
          </div>
           <br>