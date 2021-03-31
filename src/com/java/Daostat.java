package com.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Daostat")
public class Daostat extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=request.getSession();
		
	String station=request.getParameter("station_name");
	request.setAttribute("station", station);
	session.setAttribute("station_name",station);
	ArrayList<String> cid=new ArrayList<>();

	
	try{
		Connection c = null;
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
		PreparedStatement ps=c.prepareStatement("SELECT * from cycle_details where station_name=? AND Status=?");
		ps.setString(1,station);
		ps.setInt(2, 0);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			cid.add(rs.getString(1));
		}
		PreparedStatement ps1=c.prepareStatement("SELECT * from station_details where station_name=?");
		ps1.setString(1,station);
		ResultSet rs1=ps1.executeQuery();String station_id = null;
		String city = null;
		if(rs1.next())
		{	 station_id=rs1.getString(1);
			city=rs1.getString(3);
		}
		city=city.toUpperCase();
		request.setAttribute("city1", city);
		request.setAttribute("sid", station_id);
		session.setAttribute("station", station);
	}
	catch(Exception e)
	{}
	for(int i=0;i<cid.size();i++)
	{
		String s="cid"+String.valueOf(i);
		request.setAttribute(s, cid.get(i));
	}
	
	RequestDispatcher rd=request.getRequestDispatcher("specificStation.jsp");
	rd.forward(request, response);
}
}