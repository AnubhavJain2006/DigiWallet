package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String URLNAME = "jdbc:sqlserver://localhost:1433;databaseName=DigiWallet";
//	private static final String CLASSURL = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "root";
	private static Connection con = null;
//	//connecting to remote db
//	private static final String URLNAME = "jdbc:mysql://192.168.0.104:3306/test";
//	private static final String CLASSURL = "com.mysql.cj.jdbc.Driver";
//	private static final String USERNAME = "mihir";
//	private static final String PASSWORD = "root";

//	Initializing connection to database
////	public static Connection con;
////	public static Statement stmt;
////	static {
////		try {
////			con = DriverManager.getConnection(URLNAME, USERNAME, PASSWORD);
////			try {
////				stmt = con.createStatement();
////			} catch (SQLException e) {
////				System.out.println("Error while getting static statement to application");
////			}
////			System.out.println("Database is connected to application");
////		} catch (SQLException e) {
////			System.out.println("Connection to database fail with application");
////			System.exit(0);
////		}
////	}
//
//	public static Connection getStaticConnection() {
//		return con;
//	}

	public static Connection getConnection() {

		try {
//			Load and Register the driver
//			Class.forName(CLASSURL);

//			Get Connection Object
			if (con == null) {
				con = DriverManager.getConnection(URLNAME, USERNAME, PASSWORD);
			}
		} catch (SQLException e) {
			System.out.println("Error in connection in getConnection()");
		}
		return con;
	}

	public static void main(String[] args) {
		DatabaseConnection db = new DatabaseConnection();
		Connection con = db.getConnection();
		if (con != null) {
			System.out.println("Connected to Database");
		} else {
			System.out.println("Failed to connect Database");
		}
	}
}
