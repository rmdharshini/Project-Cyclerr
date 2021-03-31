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

/**
 * Servlet implementation class Daopinverify
 */
@WebServlet("/Daopinverify")
public class Daopinverify extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
		HttpSession session =request.getSession();
	String email=String.valueOf(session.getAttribute("emailid"));String pin=null;int cid;
	try{
		Connection c = null;
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
		
		PreparedStatement ps=c.prepareStatement("SELECT * from sign_up where Email_Id=?");
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			pin=String.valueOf(rs.getInt(2));
		}String value=request.getParameter("pin1")+request.getParameter("pin2")+request.getParameter("pin3")+request.getParameter("pin4")+request.getParameter("pin5");
		System.out.println(value);
		if(value.equals(pin))
		{
			try{
				PreparedStatement ps2=c.prepareStatement("SELECT * FROM customer_details ORDER BY User_Id DESC LIMIT 1");
			ResultSet r=ps2.executeQuery();
			
			if(r.next())
			{
				 cid=r.getInt(2);
			}
			else{
				cid=10000;
			}
				
			PreparedStatement ps1=c.prepareStatement("insert into customer_details (name, user_Id,phonenumber,Emailid,password,active)" + " values (?,?, ?, ?, ?,?);");
			
			ps1.setString(1,(String.valueOf(session.getAttribute("name"))));
			ps1.setInt(2,cid+1);
			ps1.setString(3,String.valueOf(session.getAttribute("mobile")));
			ps1.setString(4,String.valueOf(session.getAttribute("emailid")));
			ps1.setString(5, String.valueOf(session.getAttribute("password")));
			ps1.setInt(6,0);
			ps1.executeUpdate();
			session.invalidate();
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
			RequestDispatcher rd=request.getRequestDispatcher("login.html");
			rd.forward(request,response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("signupVerify.jsp");
			rd.forward(request,response);
		}
			
	
	}
	catch(Exception e)
	{
		
	}
	
	
	}

}
