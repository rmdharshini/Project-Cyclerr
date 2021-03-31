package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Daocycle")
public class Daocycle extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String id=request.getParameter("cid");
	HttpSession  session=request.getSession();
	session.setAttribute("cycleid", id);
	request.setAttribute("cid", id);
	try{
		Connection c = null;
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
		PreparedStatement ps=c.prepareStatement("SELECT * from cycle_details where Cycle_Id=?");
		ps.setString(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
		request.setAttribute("sn", rs.getString(2).toUpperCase());
		request.setAttribute("rides",rs.getInt(3));
		
		}
	}catch(Exception e)
	{}
	
	RequestDispatcher rd=request.getRequestDispatcher("specificCycle.jsp");
	rd.forward(request, response);

	}
}
