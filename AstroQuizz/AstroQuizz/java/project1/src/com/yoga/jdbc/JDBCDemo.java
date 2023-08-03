package com.yoga.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCDemo {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub

		//Load Driver
		Class.forName("com.mysql.jdbc.Driver");
		// Create Connection
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yogadb","root","Dysapup1");
		//Create Statement
		Statement smt = con.createStatement();
		//exceute the Statement
		smt.executeUpdate("create table employee(ename varchar(256),eid int)");
		//Close connection
		con.close();
		
	}

}
