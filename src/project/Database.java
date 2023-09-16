package project;

import java.sql.*;

public class Database {
	private String dbHost = "localhost";
	private String dbPort = "3306";
	private String dbUserName = "root";
	private String dbPassword = "root";
	private String dbName = "ecommercefinal";

	public Connection getData() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName + "",
					dbUserName, dbPassword);
			return connect;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
