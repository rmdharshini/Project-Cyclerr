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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Daoend1")
public class Daoend1 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		String cycleid=String.valueOf(session.getAttribute("cycleid2"));
		String userid=String.valueOf(session.getAttribute("userid"));int cost = 0,extend_cost,rides=0;
		try{
			
			
			 Connection c = null;
	  		    Class.forName("com.mysql.jdbc.Driver");
	  		    c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
	  		   	PreparedStatement ps=c.prepareStatement("Select * from overall WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
	  		   	ps.setString(1, cycleid);
	  		   	ps.setInt(2, 1);
	  		   	ResultSet rs=ps.executeQuery();
	  		   	while(rs.next())
	  		   	{
	  		   		cost=rs.getInt(10);
	  		   		extend_cost=rs.getInt(11);
	  		   	}
	  		   	
	  		  SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");  
		      Format f = new SimpleDateFormat("hh:mm:ss");
		      String strResult = f.format(new Date());
		      Time end_time=Time.valueOf(strResult);
	  		   	
	  		   	PreparedStatement ps1=c.prepareStatement("UPDATE overall SET Ride_status=(?) , End_time=(?) WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
	  		   	ps1.setInt(1, 0);
	  		   	ps1.setTime(2, end_time);
	  		   	ps1.setString(3, cycleid);
	  		   	ps1.setInt(4, 1);
	  		   	ps1.executeUpdate();
	  		   	
	  		  PreparedStatement ps2=c.prepareStatement("Select * from cycle_details WHERE CYCLE_ID = (?)");
	  		  ps2.setString(1, cycleid);
	  		  ResultSet rs1=ps2.executeQuery();
	  		  if(rs1.next())
	  		  {
	  			  rides=rs1.getInt(3);
	  		  }
	  		  
	  		  
	  		  PreparedStatement ps3=c.prepareStatement("UPDATE cycle_details SET Station_name=(?), No_of_rides=(?), Status=(?) , Pin=(?) WHERE CYCLE_ID = (?)");
	  		  ps3.setString(1, String.valueOf(session.getAttribute("dest2")));
	  		  ps3.setInt(2,rides+1);
	  		  ps3.setInt(3, 0);
	  		  ps3.setString(4, "abc");
	  		  ps3.setString(5, cycleid);
	  		  ps3.executeUpdate();
	  		  
	  		  int count=(int)session.getAttribute("count");
	  		  count--;
	  		  session.setAttribute("count",count);
	  		  
	  		  
	  		  
	  		PreparedStatement ps5=c.prepareStatement("Select * from station_details where Station_name=(?);");
			ps5.setString(1, String.valueOf(session.getAttribute("dest2")));
			ResultSet rs2=ps5.executeQuery();int des_avl = 0;
			while(rs2.next())
					des_avl=rs2.getInt(4);
			des_avl++;
			
			PreparedStatement ps6=c.prepareStatement("UPDATE station_details SET avl_cycles = (?) WHERE Station_name = (?) ");
			ps6.setInt(1, des_avl);
			ps6.setString(2, String.valueOf(session.getAttribute("dest2")));
			ps6.executeUpdate();
			
			
			
			session.setAttribute("cost", cost);
			session.setAttribute("cycle", cycleid);
			
			
			RequestDispatcher rd=request.getRequestDispatcher("EmailSendingServlet1");
	  		rd.forward(request, response);
	  		  
	
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}
}
