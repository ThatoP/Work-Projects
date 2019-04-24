/**
 * This code is property of Willow Woods (Pty) Ltd
 * @author Thato Puoetsile
 * @qualification: Software Development and Engineering Management
 */

package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String uname = "";
	public static String pass = "";
       
    public controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//Step 1: get the parameters that the user input
		uname = request.getParameter("uname");
		pass = request.getParameter("pwd");
				
		//Step 2: compare the given parameters with what you have in the database
		if(DBConnection.checkLogin(uname, pass)) 
		{
			//setting up a session before going to the form page
			HttpSession session = request.getSession();
			session.setAttribute("user", DBConnection.user);
			//redirecting to the form page.
			response.sendRedirect("mailProForm.jsp");
		}else {
			out.println("<p style ='color: red; text-align: centre; font-size: 18px;'>Oops!! Username or password incorrect. Please try again. </p>");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}

}
