<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Security Check</title>
<script type="text/javascript">
	var answer1 = prompt('<%=session.getAttribute("question")%>');
	if(answer1 != "" && answer1 == '<%=session.getAttribute("answer")%>') {
		alert('Account Verified!');
		window.location.href = 'resetPass.jsp';
	} else {
		alert('Your answer is wrong! Please try again!');
		window.location.href = 'forgotPassword.jsp';
	}
		
</script>
</head>
<body>

</body>
</html>