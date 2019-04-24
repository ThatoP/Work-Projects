/**
 * This code is property of Willow Woods (Pty) Ltd
 * @author Thato Puoetsile
 * @qualification: Software Development and Engineering Management
 */

package com.demo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

public class DBEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// variables for connecting to the database
	public static PreparedStatement stmt = null;
	static Statement myStmt = null;
	public static ResultSet res = null;
       
    public DBEdit() {
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
		String ogFileName = DBLink2.sqldata[6];
		if(name != null) {
			String[] data = new String[14];
			data[0] = request.getParameter("ref");
			data[1] = request.getParameter("letterDate");
			data[2] = request.getParameter("origin");
			data[3] = request.getParameter("sub");
			data[4] = request.getParameter("dateRec");
			data[5] = request.getParameter("officer");
			data[6] = request.getParameter("file");
			data[7] = request.getParameter("folio");
			data[8] = request.getParameter("markDate");
			data[9] = request.getParameter("mDays");
			data[10] = request.getParameter("actDate");
			data[11] = request.getParameter("actDays");
			data[12] = (String) session.getAttribute("user");
			
			String act = request.getParameter("action");
			
			if(act.equals("update")) {
				Date date = new Date();
				DateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				data[13] = d.format(date);
				
				try {
					// Get Connection
					myStmt = DBConnection.con.createStatement();
					
					//Prepare statement
					String dbop = "UPDATE rmunit.inmail SET ActionOfficer = '"+data[5]+"', RefNum = '"+data[6]+"', Folio = '"+data[7]+"',DateMarked = '"+data[8]+"',Days = '"+data[9]+"', ActDate = '"+data[10]+"', "
							+ "DaysToAct = '"+data[11]+"', RegBy = '"+session.getAttribute("user")+"', Timestamp_ = '"+data[13]+"'WHERE RefNum = '"+ogFileName+"' AND id = '"+data[0]+"'";
					
					//Execute SQL query
					myStmt.executeUpdate(dbop);
					
					response.sendRedirect("success.jsp");
					myStmt.close();
				}
				catch(SQLException ex) {
					Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
					response.sendRedirect("error.jsp");
				}
			}
			else if (act.equals("delete")) 
			{
				if (session.getAttribute("user").equals("Seneo Letang") || session.getAttribute("user").equals("Administrator")) 
				{
					try {
						//creating the statement
						myStmt = DBConnection.con.createStatement();
						
						//Setting the parameters
						String dbop = "DELETE FROM rmunit.inmail WHERE id='"+data[0].trim()+"'";
						
						//Executing the statement
						myStmt.execute(dbop);
						myStmt.close();
						response.sendRedirect("success.jsp");
						
					}catch (SQLException ex) {
						Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
						response.sendRedirect("error.jsp");
					}

				}
				else
				{
					response.sendRedirect("error.jsp");
				}
			}
			else if(act.equals("home")) 
			{
				response.sendRedirect("mailProForm.jsp");
			}
			else if(act.equals("db")) 
			{
				response.sendRedirect("database.jsp");
			}
		}else {
			out.println("<p style ='color: red; text-align: centre; font-size: 18px;'> Error: Your session has timed out. Please log in. </p>");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
	}
}
