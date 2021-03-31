package com.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Daopasson1
 */
@WebServlet("/Daopasson1")
public class Daopasson1 extends HttpServlet {
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try{
		HttpSession session =request.getSession();
	session.setAttribute("passoncycleid", String.valueOf(session.getAttribute("cycleid1")));
	RequestDispatcher rd=request.getRequestDispatcher("passOn.html");
	rd.forward(request, response);
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	}
}
