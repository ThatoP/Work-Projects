package com.demo;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
		HttpSession session = request.getSession();
		
		String[] data = new String[13];
		data[0] = request.getParameter("ref");
		data[1] = request.getParameter("letterDate");
		data[2] = request.getParameter("origin");
		data[3] = request.getParameter("sub");
		data[4] = request.getParameter("dateRec");
		data[5] = request.getParameter("officer");
		data[6] = request.getParameter("fileFolio");
		data[7] = request.getParameter("markDate");
		data[8] = request.getParameter("mDays");
		data[9] = request.getParameter("actDate");
		data[10] = request.getParameter("actDays");
		data[11] = (String) session.getAttribute("user");
		
		String act = request.getParameter("action");
		
		if(act.equals("update")) {
			Date date = new Date();
			DateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			data[12] = d.format(date);
			
			try {
				// Get Connection
				myStmt = DBConnection.con.createStatement();
				
				//Prepare statement
				String dbop = "UPDATE rmunit.inmail SET FileFolio = '"+data[6]+"',DateMarked = '"+data[7]+"',Days = '"+data[8]+"', ActDate = '"+data[9]+"', "
						+ "DaysToAct = '"+data[10]+"', RegBy = '"+session.getAttribute("user")+"', Timestamp_ = '"+data[12]+"'WHERE RefNumber = '"+data[0]+"'";
				
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
			if (DBConnection.user.equals("Seneo Letang")) 
			{
				try {
					//creating the statement
					myStmt = DBConnection.con.createStatement();
					
					//Setting the parameters
					String dbop = "DELETE FROM rmunit.inmail WHERE Refnumber='"+data[0].trim()+"'";
					
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
	}
}
