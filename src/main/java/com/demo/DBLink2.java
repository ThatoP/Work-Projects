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
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DBLink2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String[] sqldata = new String[12];
	// variables for connecting to the database
	public PreparedStatement stmt = null;
	static Statement myStmt = null;
	public ResultSet res = null;
       
    public DBLink2() {
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
		
		String[] data = new String[2];
		data[0] = request.getParameter("ref");
		data[1] = request.getParameter("file");
		
		String act = request.getParameter("action");
		
		if(act.equals("search")) {
			DBConnection.createConnection();
			try {
				// Prepare the statement
				stmt = DBConnection.con.prepareStatement("SELECT * FROM rmunit.inmail WHERE id=? AND RefNum=?");
				
				// Set parameters
				stmt.setString(1, data[0]);
				stmt.setString(2, data[1]);
				
				// Execute SQL query
				res = stmt.executeQuery();
				
				//Passing the results to the display
				if (res.first()) {
					res.beforeFirst(); //moving the pointer back to the start of the row of results
					while (res.next()) {
						
						sqldata[0] = res.getString("id");
						sqldata[1] = res.getString("DateOnLetter");
						sqldata[2] = res.getString("OriginDept");
						sqldata[3] = res.getString("Subject");
						sqldata[4] = res.getString("DateRec");
						sqldata[5] = res.getString("ActionOfficer");
						sqldata[6] = res.getString("RefNum");
						sqldata[7] = res.getString("Folio");
						sqldata[8] = res.getString("DateMarked");
						sqldata[9] = res.getString("Days");
						sqldata[10] = res.getString("ActDate");
						sqldata[11] = res.getString("DaysToAct");
						
						response.sendRedirect("update.jsp");
//						for(int i=0; i<12; i++) {
//							System.out.println(sqldata[i]);
//						}
//						System.out.println("");
					}
					
				}else {
					for(int i=0; i<12; i++) {
						sqldata[i] = null;
					}
					response.sendRedirect("error.jsp");
				}
				stmt.close();
			}
			catch (SQLException ex) {
				Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
				response.sendRedirect("error.jsp");
			}
		}else if(act.equals("db")) {
			response.sendRedirect("database.jsp");
		}else if(act.equals("home")) {
			response.sendRedirect("mailProForm.jsp");
		}
	}

}
