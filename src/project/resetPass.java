package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.Database;

@WebServlet("/reset")
public class resetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String email = session.getAttribute("email").toString();

		String pass = request.getParameter("password");
		String sql_pass = "update users set password = ? where (email = ?);";

		Connection con = null;
		PreparedStatement ps = null;

		try {
			Database data = new Database();
			con = data.getData();

			ps = con.prepareStatement(sql_pass);
			ps.setString(1, pass);
			ps.setString(2, email);
			ps.executeUpdate();
			ps.close();
			con.close();

			out.print("<script type='text/javascript'>alert('Saved!');window.location.href=document.referrer;</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
