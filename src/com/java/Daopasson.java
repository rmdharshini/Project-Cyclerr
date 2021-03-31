package com.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Daopasson")
public class Daopasson extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid=request.getParameter("username");
		String destination=request.getParameter("destination");
		
		HttpSession session = request.getSession();
		String rendtime="";
		try{
			
			
		Connection c = null;
		    Class.forName("com.mysql.jdbc.Driver");
		    c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
		   	PreparedStatement ps=c.prepareStatement("Select * from overall WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
		   	ps.setString(1, String.valueOf(session.getAttribute("passoncycleid")));
		   	ps.setInt(2, 1);
		   	ResultSet rs=ps.executeQuery();
		   	while(rs.next())
		   	{
		   		
		   		rendtime=rs.getTime(7).toString();
		   	}
		   	System.out.println("x");
		   	SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");  
		      Format f = new SimpleDateFormat("hh:mm:ss");
		      String strResult = f.format(new Date());
		      Time starttime=Time.valueOf(strResult);
		      System.out.println("x");
		      SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		      timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
		      System.out.println("x");
		      Date date1 = timeFormat.parse(rendtime);
		      Date date2 = timeFormat.parse(strResult);
		      System.out.println("x");
		      long sum = date1.getTime() - date2.getTime();
		      String date3 = timeFormat.format(new Date(sum));
		      Time Duration=Time.valueOf(date3);
		      System.out.println("x");
		     	
	  		   	PreparedStatement ps2=c.prepareStatement("UPDATE overall SET Ride_status=(?) , End_time=(?) WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
	  		   	ps2.setInt(1, 0);
	  		   	ps2.setTime(2, starttime);
	  		   	ps2.setString(3, String.valueOf(session.getAttribute("passoncycleid")));
	  		   	ps2.setInt(4, 1);
	  		   	ps2.executeUpdate();
	  		   	
	  		   	PreparedStatement ps3=c.prepareStatement(" insert into overall (User_Id, Cycle_Id, Destination, Initial_Duration,Total_Duration,Ride_cost,Ride_End_Time,start_point)" + " values (?,?, ?, ?, ?, ? , ?, ?);");
	  		  ps3.setString(1, userid);
	  		  ps3.setString(2, String.valueOf(session.getAttribute("passoncycleid")));
	  		  
	  		  ps3.setString(3, destination);
	  		  ps3.setTime(4, Duration);
	  		  ps3.setTime(5, Duration);
	  		  ps3.setInt(6, 0);
	  		  ps3.setTime(7, Time.valueOf(rendtime));
	  		  ps3.setString(8, String.valueOf(session.getAttribute("station_name")));
	  		  ps3.execute();
	  		
	  		  
	  		  
	  		  int count=(int)session.getAttribute("count");
	  		
	  		  count--;
	  		  session.setAttribute("count",count);
	  		
	  		  if(String.valueOf(session.getAttribute("passoncycleid"))==String.valueOf(session.getAttribute("cycleid1")))
	  		  {
	  		  session.setAttribute("cycleid1", String.valueOf(session.getAttribute("cycleid2")));
	  		session.setAttribute("pin1", String.valueOf(session.getAttribute("pin2")));
	  		session.setAttribute("timer1", String.valueOf(session.getAttribute("timer2")));
	  		
	  		  }
	  		  else
	  		  {}
	  		RequestDispatcher rd=request.getRequestDispatcher("timer.jsp");
	  		rd.forward(request, response);
	  		  
	  		
		      
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
	
	}

}
