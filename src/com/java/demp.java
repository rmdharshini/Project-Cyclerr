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


@WebServlet("/demp")
public class demp extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("checkpayment","true");
		
		String hour=request.getParameter("hour");
		
		String des=request.getParameter("destination");
		session.setAttribute("hour", hour);
		session.setAttribute("destination", des);
		int  hour1=Integer.parseInt(hour.substring(1,2));
		
		session.setAttribute("hour1", hour1);
		int cost=hour1*40;
		session.setAttribute("cost", cost);
		if(session.getAttribute("emailid")==null)
		{
			RequestDispatcher rd=request.getRequestDispatcher("login.html");
			rd.forward(request,response);
		}
		else{
			int count=0;
			try{
				
				Connection c = null;
			    Class.forName("com.mysql.jdbc.Driver");
			    c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
			
			PreparedStatement ps2=c.prepareStatement(" select * from overall where user_id=? AND Ride_status=?");
			ps2.setString(1, (String) session.getAttribute("userid"));
			ps2.setInt(2, 1);
			ResultSet rs1=ps2.executeQuery();
			while(rs1.next())
			{
				count++;
			}session.setAttribute("count", count);
			}catch(Exception e)
			{
				
			}
			if(count >=2)
			{
				RequestDispatcher rd1=request.getRequestDispatcher("timer.jsp");
				rd1.forward(request,response);
			}
			else
			{
				RequestDispatcher rd1=request.getRequestDispatcher("payment.jsp");
				rd1.forward(request,response);
			}
			
		}
		
			
			
		
	}

	
}
