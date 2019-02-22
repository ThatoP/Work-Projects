package com.demo;

import java.awt.Font;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.*;
import javax.swing.*;
import javax.swing.table.TableModel;
import net.proteanit.sql.DbUtils;


public class DBConnection {
	
	public static Connection con = null;
	public static PreparedStatement stmt = null;
	static Statement myStmt = null;
	public static ResultSet res = null;
	public static String user = "";
		
	public static void createConnection() {
		try{
			//Get a connection to the database
			Class.forName("com.mysql.cj.jdbc.Driver");
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmunit?useSSL=false&zeroDateTimeBehavior=CONVERT_TO_NULL",
					//"root","RMUnit");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmunit","root","");
		}
		catch (ClassNotFoundException ex){
			Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE,null,ex);
		}
		catch (SQLException ex) {
			Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE,null,ex);
		}
	}
	
	public static boolean checkLogin(String uname, String pword) {
		createConnection();
		boolean isOk = false;
		String pass = "";
		
		try {
			//Prepare statement
			stmt = con.prepareStatement("SELECT * FROM rmunit.users WHERE UserName='"+uname.toLowerCase().trim()+"'");
			
			//Execute SQL query
			res = stmt.executeQuery();
			
			//Using the result set
			int c = 0;
			while(res.next()) {
				pass = res.getString("Password");
				user = res.getString("FullName");
				c++;
			}
			
			if(c==1) {
				if(pass.equals(pword)) {
					isOk = true;	
				}
			} else if(c>1) {
				isOk = false;
			}else {
				isOk = false;
			}
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return isOk;
	}
}
