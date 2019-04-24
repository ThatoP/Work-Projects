/**
 * This code is property of Willow Woods (Pty) Ltd
 * @author Thato Puoetsile
 * @qualification: Software Development and Engineering Management
 */
package com.demo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public logoutController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		//getting response from radio button
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("user");
		String ans = request.getParameter("decision");
		
		//using it to either log user out or to keep them logged in
		if (!(name == null)) {
			if(ans.equalsIgnoreCase("yes")) {
				session.removeAttribute("user");
				session.invalidate();
				response.sendRedirect("index.jsp");
			}else {
				response.sendRedirect("mailProForm.jsp");
			}
		}else {
			response.sendRedirect("index.jsp");
		}
	}

}
