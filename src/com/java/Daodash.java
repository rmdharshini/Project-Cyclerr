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

/**
 * Servlet implementation class Daodash
 */
@WebServlet("/Daodash")
public class Daodash extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=request.getSession();
	String userid=String.valueOf(session.getAttribute("userid"));
	
	ArrayList<String> date=new ArrayList<>();
	ArrayList<String> cycle=new ArrayList<>();
	ArrayList<String> start=new ArrayList<>();
	ArrayList<String> end=new ArrayList<>();
	ArrayList<String> tstart=new ArrayList<>();
	ArrayList<String> tend=new ArrayList<>();
	ArrayList<Integer> price=new ArrayList<>();
	
	try{
		Connection c = null;
	    Class.forName("com.mysql.jdbc.Driver");
	    c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
	    PreparedStatement ps=c.prepareStatement("SELECT * from customer_details where user_id=? ");	
	    ps.setString(1, userid);
	    ResultSet rs=ps.executeQuery();
	    while(rs.next())
	    {
	    	request.setAttribute("name", rs.getString(1));
	    	request.setAttribute("mobile", rs.getString(3));
	    	request.setAttribute("emailid", rs.getString(4));
	    	request.setAttribute("rides", rs.getInt(7));
	    }request.setAttribute("userid",userid);
	    
	    PreparedStatement ps1=c.prepareStatement("SELECT * from overall where User_id=? AND Ride_status=?");
		ps1.setString(1,userid);
		ps1.setInt(2, 0);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next())
		{
			date.add(rs1.getDate(3).toString());
			cycle.add(rs1.getString(2));
			start.add(rs1.getString(13));
			end.add(rs1.getString(12));
			tstart.add(rs1.getTime(4).toString());
			tend.add(rs1.getTime(7).toString());
			price.add(rs1.getInt(10));
			
		}System.out.println(end.size());
		for(int i=0;i<end.size();i++)
		{
			String s1="date"+String.valueOf(i);
			String s2="cycle"+String.valueOf(i);
			String s3="start"+String.valueOf(i);
			String s4="end"+String.valueOf(i);
			String s5="tstart"+String.valueOf(i);
			String s6="tend"+String.valueOf(i);
			String s7="price"+String.valueOf(i);

			request.setAttribute(s1,date.get(i));
			request.setAttribute(s2,cycle.get(i));
			request.setAttribute(s3,start.get(i));
			request.setAttribute(s4,end.get(i));
			request.setAttribute(s5,tstart.get(i));
			request.setAttribute(s6,tend.get(i));
			request.setAttribute(s7,price.get(i));

		}
		RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
		rd.forward(request, response);
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	
	}

}
