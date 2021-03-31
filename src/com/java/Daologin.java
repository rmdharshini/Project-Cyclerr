package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverAction;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.mail.iap.Response;
@WebServlet("/Daologin")
public class Daologin extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		HttpSession session=req.getSession();
		PrintWriter out=res.getWriter();
		String emailid=req.getParameter("emailid");
		String password=req.getParameter("pass");
		try{
			Connection c = null;
		    Class.forName("com.mysql.jdbc.Driver");
		    c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
		    PreparedStatement ps=c.prepareStatement("SELECT * from customer_details where emailid=? AND password=?");	
		    ps.setString(1, emailid);
		    ps.setString(2, password);
		    
		    ResultSet rs=ps.executeQuery();
		    if(rs.next())
		    {
		    	session.setAttribute("emailid", emailid);
		    	session.setAttribute("userid",rs.getString(2));
		    	
		    	
		    	
		    	
		    	
		    	int count=0;
		    	PreparedStatement ps2=c.prepareStatement(" select * from overall where user_id=(?) AND Ride_status=(?)");
				ps2.setString(1, String.valueOf(session.getAttribute("userid")));
				ps2.setInt(2, 1);
				ResultSet rs1=ps2.executeQuery();
				while(rs1.next())
				{
					count++;
				}
				
				session.setAttribute("count", count);
				req.setAttribute("count", count);
				
				if(count==1)
				{
					PreparedStatement ps6=c.prepareStatement(" select * from overall where user_id=(?) AND Ride_status=(?)");
					ps6.setString(1, String.valueOf(session.getAttribute("userid")));
					ps6.setInt(2, 1);
					ResultSet rs6=ps6.executeQuery();
					String des="";
					String time1="";
					String cycleid="";
					while(rs6.next())
					{
						 des=rs6.getString(12);
						 time1=rs6.getTime(5).toString();
						 cycleid=rs6.getString(2);
					}
						
						
						
						String t="";
						PreparedStatement ps7=c.prepareStatement("select * from overall where cycle_id=(?) AND Ride_status=(?)");
						ps7.setString(1, cycleid);
						ps7.setInt(2, 1);
						ResultSet rs7=ps7.executeQuery();
						if(rs7.next())
								t=rs7.getTime(7).toString();
						
						
						SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");  
					      Format f = new SimpleDateFormat("hh:mm:ss");
					      String strResult = f.format(new Date());
					      
					      SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
					      timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

					      Date date1 = timeFormat.parse(t);
					      Date date2 = timeFormat.parse(strResult);
					      
					      
					      long sum = date1.getTime() - date2.getTime();
					      String date3 = timeFormat.format(new Date(sum));
					      
					      
					      int total=(Integer.parseInt(date3.substring(0,2))*3600)+(Integer.parseInt(date3.substring(3,5))*60)+(Integer.parseInt(date3.substring(6,8)));
					      
					      
					      
					      
					      String ran="";
					      
					      PreparedStatement ps8=c.prepareStatement("Select * from cycle_details Where Cycle_id=(?) and Status=(?)");
					      ps8.setString(1, cycleid);
					      ps8.setInt(2, 1);
					      ResultSet rs8=ps8.executeQuery();
					      if(rs8.next())
					    	  	ran=rs8.getString(5);
					      
					      session.setAttribute("dest1", des);
							session.setAttribute("Ini1", time1);
							
							session.setAttribute("cycleid1", cycleid);
							session.setAttribute("pin1",ran);
							
							
							session.setAttribute("timer1",total);
							
							
							
							if(session.getAttribute("checkpayment")=="true")
					    	{	
								RequestDispatcher rd=req.getRequestDispatcher("payment.jsp");
					    		rd.forward(req, res);
					    	}
					    	else{
					    		res.sendRedirect("home.jsp");
					    	}
							
							
				}
				
				
				
				if(count >=2)
				{
					PreparedStatement ps3=c.prepareStatement(" select * from overall where user_id=(?) AND Ride_status=(?)");
					ps3.setString(1, String.valueOf(session.getAttribute("userid")));
					ps3.setInt(2, 1);
					ResultSet rs2=ps3.executeQuery();int count1=0;
					while(rs2.next())
					{
						count1++;
						String des=rs2.getString(12);
						String time1=rs2.getTime(5).toString();
						String cycleid=rs2.getString(2);
						
						
						
						String t="";
						PreparedStatement ps4=c.prepareStatement("select * from overall where cycle_id=(?) AND Ride_status=(?)");
						ps4.setString(1, cycleid);
						ps4.setInt(2, 1);
						ResultSet rs3=ps4.executeQuery();
						if(rs3.next())
								t=rs3.getTime(7).toString();
						
						
						SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");  
					      Format f = new SimpleDateFormat("hh:mm:ss");
					      String strResult = f.format(new Date());
					      
					      SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
					      timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

					      Date date1 = timeFormat.parse(t);
					      Date date2 = timeFormat.parse(strResult);
					      
					      
					      long sum = date1.getTime() - date2.getTime();
					      String date3 = timeFormat.format(new Date(sum));
					      
					      
					      int total=(Integer.parseInt(date3.substring(0,2))*3600)+(Integer.parseInt(date3.substring(3,5))*60)+(Integer.parseInt(date3.substring(6,8)));
					      
					      
					      
					      
					      String ran="";
					      
					      PreparedStatement ps5=c.prepareStatement("Select * from cycle_details Where Cycle_id=(?) and Status=(?)");
					      ps5.setString(1, cycleid);
					      ps5.setInt(2, 1);
					      ResultSet rs4=ps5.executeQuery();
					      if(rs4.next())
					    	  	ran=rs4.getString(5);
					    	  	
					      
					if(count1==1)
					{
						
						session.setAttribute("dest1", des);
						session.setAttribute("Ini1", time1);
						
						session.setAttribute("cycleid1", cycleid);
						session.setAttribute("pin1",ran);
						
						
						session.setAttribute("timer1",total);
					}
					else if(count1==2)
					{
						session.setAttribute("dest2", des);
						session.setAttribute("Ini2", time1);
						
						session.setAttribute("cycleid2", cycleid);
						session.setAttribute("pin2",ran);
						
						
						session.setAttribute("timer2", total);
					}
					}
					
					session.setAttribute("count", count);
					RequestDispatcher rd1=req.getRequestDispatcher("timer.jsp");
					rd1.forward(req,res);
				}
				
				
				
				else if(session.getAttribute("checkpayment")=="true")
		    	{	
					RequestDispatcher rd=req.getRequestDispatcher("payment.jsp");
		    		rd.forward(req, res);
		    	}
		    	else{
		    		res.sendRedirect("home.jsp");
		    	}
		    }
		    else
		    {
		    	res.sendRedirect("login.html");
		    }
		}
		catch(Exception e)
		{
			System.out.println();
		}
		
		
	}


}
