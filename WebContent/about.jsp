<%@include file="header.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<title>About</title>
<style>
.team-section{
  text-align: center;
}
.inner-width{
  max-width: 1200px;
  margin: auto;
  padding: 40px;
  color: #333;
  overflow: hidden;
}
.team-section h1{
  font-size: 20px;
  text-transform: uppercase;
  display: inline-block;
  border-bottom: 4px solid;
  padding-bottom: 10px;
}
.pe{
  float: left;
  width: calc(100% / 3);
  overflow: hidden;
  padding: 40px 0;
  transition: 0.4s;
}
.pe:hover{
  background: #ddd;
}
.pe img{
  width: 220px;
  height: 220px;
}
.p-name{
  margin: 16px 0;
  text-transform: uppercase;
}
.p-des{
  font-style: italic;
  color: #3498db;
}
.p-sm{
  margin-top: 12px;
}
.p-sm a{
  margin: 0 4px;
  display: inline-block;
  width: 30px;
  height: 30px;
  transition: 0.4s;
}
.p-sm a:hover{
  transform: scale(1.3);
}
.p-sm a i{
  color: #333;
  line-height: 30px;
}
@media screen and (max-width:600px) {
  .pe{
    width: 100%;
  }
}



</style>
</head>
<body>
<h2 style="margin: 10px; text-align: center;"><strong>Welcome to SNEAKERS!</strong></h2>

<p style="margin: 10px; text-align: center;">Starting as a small business in 2021, we have big dreams. Our passion for Sneakers and Socks, means that we provide our customers with nothing but the highest quality of products, that are guaranteed to meet their needs and keep them satisfied!</p>

<p style="margin: 10px; text-align: center;">With a motivated team, we strive to be the creative minds that bring a smile to your face. That's why we're always looking for innovative new ways to get the best to you.</p>

  <div class="team-section">
    <div class="inner-width">
      <h1>Meet Our Team</h1>
      <div class="pers">


        <div class="pe">
          <img src="images/ceo.jpg" alt="">
          <div class="p-name">John Doe</div>
          <div class="p-des">CEO & Founder</div>
          <div class="p-sm">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
          </div>
        </div>

        <div class="pe">
          <img src="images/art.jpg" alt="">
          <div class="p-name">Rose Mclver</div>
          <div class="p-des">Art Director</div>
          <div class="p-sm">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
          </div>
        </div>

        <div class="pe">
          <img src="images/designer.jpg" alt="">
          <div class="p-name">Jane Eyre</div>
          <div class="p-des">Designer</div>
          <div class="p-sm">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
          </div>
        </div>

      </div>

    </div>
  </div>

</body>
</html>