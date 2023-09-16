<%@page import="project.Database"%>
<%@page import="java.sql.*"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	try {
		boolean flag = false;
		Database data = new Database();
		Connection con = data.getData();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(
				"select * from users where email='" + email + "' and password='" + password + "'");
		while (rs.next()) {
			flag = true;
			session.setAttribute("email", email);
			session.setAttribute("name", rs.getString(1));
			response.sendRedirect("home.jsp");
		}

		if (flag == false)
			response.sendRedirect("login.jsp?msg=notexist");
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
%>