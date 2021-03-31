package com.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Daosignupuser
 */
@WebServlet("/Daosignupuser")
public class Daosignupuser extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String emailid=request.getParameter("email");
	
	HttpSession session=request.getSession();
	session.setAttribute("name", request.getParameter("username"));
	session.setAttribute("mobile",request.getParameter("mobile"));
	session.setAttribute("password",request.getParameter("pass"));
	try{
		Connection c = null;
	    Class.forName("com.mysql.jdbc.Driver");
	    c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
	    PreparedStatement ps=c.prepareStatement("SELECT * from customer_details where emailid=?");	
	    ps.setString(1, emailid);
	    
	    
	    ResultSet rs=ps.executeQuery();
	    if(rs.next())
	    {	    	
	    		response.sendRedirect("login.html");
	    	
	    }else
	    {
	    	request.setAttribute("emailid",emailid);
	    	RequestDispatcher rd=request.getRequestDispatcher("EmailSendingServlet");
	    	rd.forward(request, response);
	    }
	}
	catch(Exception e)
	{}
	
	}

}
