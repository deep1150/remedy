package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DBUtil {

	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		ResourceBundle rs = ResourceBundle.getBundle("db");
		String driver = rs.getString("db.driver");
		String url = rs.getString("db.url");
		String uname = rs.getString("db.uname");
		String pwd = rs.getString("db.pwd");
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, uname, pwd);
		return con;
	}
}
