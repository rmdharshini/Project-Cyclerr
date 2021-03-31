package com.java;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.glass.ui.Pixels.Format;


@WebServlet("/Daoextend1")
public class Daoextend1 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session=request.getSession();
		try{
      	  Connection c = null;
  		    Class.forName("com.mysql.jdbc.Driver");
  		    c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
  		   	PreparedStatement ps=c.prepareStatement("Select * from overall WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
  		    String cycleid=String.valueOf(session.getAttribute("cycleid2"));
  		   	
  		   	ps.setString(1,cycleid);
  		   	ps.setInt(2, 1);
  		   	ResultSet rs=ps.executeQuery();
  		   	Time t;String rendtime="";
  		   	while(rs.next())
  		   	{
  		   		rendtime=rs.getTime(7).toString();
  		   	}
  		   	
  		   	int first=Integer.parseInt(rendtime.substring(0, 2));
  		   	if(first==12)
  		   	{
  		   		rendtime="01"+rendtime.substring(2);
  		   	}
  		   	else
  		   	{
  		   		first++;
  		   		rendtime=(String.valueOf(first))+rendtime.substring(2);
  		   	}
  		   	
  		    @SuppressWarnings("unused")
			SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");  
		      java.text.Format f = new SimpleDateFormat("hh:mm:ss");
		      String strResult = f.format(new Date());
		      
		    SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");
		      timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
		      
		    Date date1 = timeFormat.parse(rendtime);
		      Date date2 = timeFormat.parse(strResult);
		     
		      
		      long sum = date1.getTime() - date2.getTime();
		      String date3 = timeFormat.format(new Date(sum));
		      
		      
				int total=(Integer.parseInt(date3.substring(0,2))*3600)+(Integer.parseInt(date3.substring(3,5))*60)+(Integer.parseInt(date3.substring(6,8)));
				session.setAttribute("timer2",total);
				
  	  PreparedStatement ps1=c.prepareStatement("UPDATE overall SET  RIDE_END_TIME= (?) WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");	
  	  ps1.setTime(1,Time.valueOf(rendtime));
		   	ps1.setString(2, cycleid);
		   	ps1.setInt(3, 1);
		   	ps1.executeUpdate();
		   	String timer=String.valueOf(session.getAttribute("timer2"));
		   	
			session.setAttribute("disable", 1);
			RequestDispatcher rd=request.getRequestDispatcher("timer.jsp");
			rd.forward(request, response);
  	  }
  	  catch(Exception e)
  	  {
  		  System.out.print(e);
  	  }
  	  
	}

}
