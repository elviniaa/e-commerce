package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.Database;

@WebServlet("/confAcc")
public class confAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");

		String query = "select * from users where email= '" + email + "';";
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		try {
			Database data = new Database();
			Connection con = data.getData();
			Statement sql = con.createStatement();
			ResultSet rs = sql.executeQuery(query);

			if (rs.next()) {
				session.setAttribute("email", email);
				session.setAttribute("question", rs.getString(4));
				session.setAttribute("answer", rs.getString(5));
				response.sendRedirect("security.jsp");
			} else {
				out.print(
						"<script language='JavaScript'>alert('Your email is wrong, please try again!');window.location.href=document.referrer</script>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
