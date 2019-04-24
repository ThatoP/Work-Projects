/**
 * This code is property of Willow Woods (Pty) Ltd
 * @author Thato Puoetsile
 * @qualification: Software Development and Engineering Management
 */

package com.demo;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

public class DBLink extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public static String[] sqldata = new String[12];
	// variables for connecting to the database
	public PreparedStatement stmt = null;
	static Statement myStmt = null;
	public ResultSet res = null;
	public static String filename = null;
       
    public DBLink() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("user");
		
		if(name != null) {
			String[] data = new String[13];
			data[0] = request.getParameter("letterDate");
			data[1] = request.getParameter("origin");
			data[2] = request.getParameter("sub");
			data[3] = request.getParameter("dateRec");
			data[4] = request.getParameter("officer");
			data[5] = request.getParameter("file");
			data[6] = request.getParameter("folio");
			data[7] = request.getParameter("markDate");
			data[8] = request.getParameter("mDays");
			data[9] = request.getParameter("actDate");
			data[10] = request.getParameter("actDays");
			data[11] = (String) session.getAttribute("user");
					
			String act = request.getParameter("action");
			
			if(act.equals("save")) {
				Date date = new Date();
				DateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				data[12] = d.format(date);
				
				//DBConnection.saveRecord(data);
				DBConnection.createConnection(); 
				try {
					myStmt = DBConnection.con.createStatement();
					
					//INSERT INTO RMUNIT VALUES ('DateOnLetter','OrigDept','Subject','DateRec','ActionOfficer','DateMarked','Days');
					String dbop = "INSERT INTO rmunit.inmail VALUES (NULL,'" + data[0] + "', '" + data[1] + "', '" + data[2] + "', '"
							+ data[3] + "', '"+ data[4] +"', '" + data[5] + "', '" + data[6] + "','"+ data[7] +"', '"+ data[8] +"', '"+ data[9] +"',"
									+ "'"+data[10]+"','"+session.getAttribute("user")+"','"+data[12]+"')";
					//Executing the statement
					myStmt.executeUpdate(dbop);

					response.sendRedirect("success.jsp");
					myStmt.close();
				}
				catch (SQLException ex) {
					Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
					response.sendRedirect("error.jsp");
				}
			}
			else if(act.equals("search")){
				filename = data[5];
				response.sendRedirect("search.jsp");
			}
			else if(act.equals("db")) {
				response.sendRedirect("database.jsp");
			}
		}else {
			out.println("<p style ='color: red; text-align: centre; font-size: 18px;'> Error: Your session has timed out. Please log in. </p>");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
	}
}
