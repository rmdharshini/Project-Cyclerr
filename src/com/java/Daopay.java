package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.util.resources.CalendarData;

/**
 * Servlet implementation class Daopay
 */
@WebServlet("/Daopay")
public class Daopay extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Random rand=new Random();
		    int ran=rand.nextInt(10000);
		RequestDispatcher rd=request.getRequestDispatcher("paymentSucessful.jsp");
		
	try{
		Connection c = null;
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
		PreparedStatement ps=c.prepareStatement("UPDATE cycle_details SET STATUS = (?), PIN= (?) WHERE CYCLE_ID = (?) ");
		
		ps.setInt(1, 1);
		ps.setString(2, String.valueOf(ran));
		String cycleid=String.valueOf(session.getAttribute("cycleid"));
		ps.setString(3, cycleid);
		int a=ps.executeUpdate();
		PreparedStatement ps1=c.prepareStatement(" insert into overall (User_Id, Cycle_Id, Date, Destination, Initial_Duration,Total_Duration,Ride_cost,start_point)"+ " values (?, ?, ?, ?, ?,?,?,?);");
		String userid=String.valueOf(session.getAttribute("userid"));
		String des=String.valueOf(session.getAttribute("destination"));
		Calendar calendar = Calendar.getInstance();
	      java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());
	      String time1=String.valueOf(session.getAttribute("hour"));
	     Time time=Time.valueOf(time1);
	     int  cost=40*(Integer.parseInt(time1.substring(1,2)));
		ps1.setString(1, userid);
		ps1.setString(2, cycleid);
		ps1.setDate(3, startDate);
		ps1.setString(4, des);
		ps1.setTime(5, time);
		ps1.setTime(6, time);
		ps1.setInt(7, cost);
		ps1.setString(8, String.valueOf(session.getAttribute("station_name")));
		ps1.execute();
		
		PreparedStatement ps4=c.prepareStatement("Select * from station_details where Station_name=(?);");
		ps4.setString(1, String.valueOf(session.getAttribute("station")));
		ResultSet rs1=ps4.executeQuery();int avl = 0;
		while(rs1.next())
				avl=rs1.getInt(4);
		avl--;
		
		PreparedStatement ps3=c.prepareStatement("UPDATE station_details SET avl_cycles = (?) WHERE Station_name = (?) ");
		ps3.setInt(1, avl);
		ps3.setString(2, String.valueOf(session.getAttribute("station")));
		ps3.executeUpdate();
		
		
		int count=0;
		PreparedStatement ps2=c.prepareStatement(" select * from overall where user_id=? AND Ride_status=?");
		ps2.setString(1, userid);
		ps2.setInt(2, 1);
		ResultSet rs=ps2.executeQuery();
		while(rs.next())
		{
			count++;
		}
		if(count==1)
		{
			
			session.setAttribute("dest1", des);
			session.setAttribute("Ini1", time1);
			request.setAttribute("cycleid1", cycleid);
			request.setAttribute("pin1",ran);
			session.setAttribute("cycleid1", cycleid);
			session.setAttribute("pin1",ran);
			
			String str[]=time1.split(":");
			int duration=3600*Integer.parseInt(str[0]);
			session.setAttribute("timer1", duration);
		}
		else if(count==2)
		{
			session.setAttribute("dest2", des);
			session.setAttribute("Ini2", time1);
			request.setAttribute("cycleid2", cycleid);
			request.setAttribute("pin2",ran);
			session.setAttribute("cycleid2", cycleid);
			session.setAttribute("pin2",ran);
			
			String str[]=time1.split(":");
			int duration=3600*Integer.parseInt(str[0]);
			session.setAttribute("timer2", duration);
		}
		
		request.setAttribute("count", count);
		session.setAttribute("count", count);
		
		session.setAttribute("pid", "CY"+(ran+1235));
		
		
		rd.forward(request, response);
		
	}catch(Exception e)
	{
	
	System.out.print(e);
	}

}
}