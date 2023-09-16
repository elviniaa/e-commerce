<%@page import="project.Database"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.container {
	width: 85%;
	margin: auto;
	padding: 20px
}

.container .content {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.container .content .left-side {
	width: 25%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: relative;
}

.content .left-side::before {
	content: '';
	position: absolute;
	height: 70%;
	width: 2px;
	right: -15px;
	top: 50%;
	transform: translateY(-50%);
	background: #afafb6;
}

.content .left-side .details {
	margin: 8px;
	text-align: center;
}

.content .left-side .details i {
	font-size: 30px;
	color: #828bc2;
}

.content .left-side .details .topic {
	font-size: 18px;
	font-weight: 500;
}

.content .left-side .details .text-one, .content .left-side .details .text-two {
	font-size: 14px;
	color: #afafb6;
}

.container .content .right-side {
	width: 75%;
	margin-left: 55px;
}

.content .right-side .topic-text {
	font-size: 23px;
	font-weight: 600;
	color: #828bc2;
	text-align: center;
}

.right-side .input-box {
	height: 50px;
	width: 100%;
	margin: 12px 0;
}

.right-side .input-box input, .right-side .input-box textarea {
	height: 100%;
	width: 100%;
	border: none;
	outline: none;
	font-size: 16px;
	background: #F0F1F8;
	border-radius: 6px;
	padding: 0 15px;
	resize: none;
}

.right-side .message-box {
	min-height: 110px;
}

.right-side .input-box textarea {
	padding-top: 6px;
}

.right-side .button {
	display: inline-block;
	margin-top: 12px;
}

.right-side .button input[type="submit"] {
	color: #fff;
	font-size: 18px;
	outline: none;
	border: none;
	padding: 8px 16px;
	border-radius: 6px;
	background: #828bc2;
	cursor: pointer;
	transition: all 0.3s ease;
	margin-left: 545%;
}

.button input[type="submit"]:hover {
	background: #5029bc;
}

@media ( max-width : 950px) {
	.container {
		width: 90%;
		padding: 30px 40px 40px 35px;
	}
	.container .content .right-side {
		width: 75%;
		margin-left: 55px;
	}
}

@media ( max-width : 820px) {
	.container {
		margin: 40px 0;
		height: 100%;
	}
	.container .content {
		flex-direction: column-reverse;
	}
	.container .content .left-side {
		width: 100%;
		flex-direction: row;
		margin-top: 40px;
		justify-content: center;
		flex-wrap: wrap;
	}
	.container .content .left-side::before {
		display: none;
	}
	.container .content .right-side {
		width: 100%;
		margin-left: 0;
	}
}
</style>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
	<script>alert('Message Successfully Sent! Our team will contact you soon!');</script>
<%}%>

<%
if("invalid".equals(msg)){	
%>
	<script>alert('Something went wrong! Try again@');</script>
<%}%>

	<div class="container">
		<div class="content">
			<div class="left-side">
				<div class="address details">
					<i class="fas fa-map-marker-alt"></i>
					<div class="topic">Address</div>
					<div class="text-one">8599 NW 6th Street, Miami - Florida, USA</div>
				</div>
				<div class="phone details">
					<i class="fas fa-phone-alt"></i>
					<div class="topic">Phone</div>
					<div class="text-one">1800 234 4454</div>
					<div class="text-two">1800 234 4455</div>
				</div>
				<div class="email details">
					<i class="fas fa-envelope"></i>
					<div class="topic">Email</div>
					<div class="text-one">sneakerstore@mail.com</div>
					<div class="text-two">comfortsocks@mail.com</div>
				</div>
			</div>
			<div class="right-side">
				<div class="topic-text">Send us a message</div>
				<form action="messageUsSystem.jsp" method="post">
					<div class="input-box">
						<input type="text" name="subject" placeholder="Subject" required>
					</div>
					<div class="input-box message-box">
						<textarea name="body" placeholder="Enter Your Message" required></textarea>
					</div>
					<div class="button">
						<input type="submit" value="Send Now">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
