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

@WebServlet("/Daostation")
public class Daostation extends HttpServlet {
	
	public void doGet (HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
	{

		HttpSession session=req.getSession();
		String city=(String) req.getParameter("test");
		city=city.toUpperCase();
		req.setAttribute("city1", city);
	
		
		ArrayList<String> sn=new ArrayList<>();
		ArrayList<String> si=new ArrayList<>();
		ArrayList<String> ad=new ArrayList<>();
		ArrayList<Integer> avl=new ArrayList<>();
		ArrayList<String> map=new ArrayList<>();
		ArrayList<Integer> pin=new ArrayList<>();


		try{
			Connection c = null;
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
			PreparedStatement ps=c.prepareStatement("SELECT * from station_details where City=?");
			ps.setString(1,city);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				sn.add(rs.getString(2));
				si.add(rs.getString(1));
				ad.add(rs.getString(5));
				avl.add(rs.getInt(4));
				map.add(rs.getString(7));
				pin.add(rs.getInt(6));
				
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		for(int i=0;i<sn.size();i++)
		{
			String s1="sn"+String.valueOf(i);
			String s2="si"+String.valueOf(i);
			String s3="ad"+String.valueOf(i);
			String s4="avl"+String.valueOf(i);
			String s5="map"+String.valueOf(i);
			String s6="pin"+String.valueOf(i);

			req.setAttribute(s1,sn.get(i));
			req.setAttribute(s2,si.get(i));
			req.setAttribute(s3,ad.get(i));
			req.setAttribute(s4,avl.get(i));
			req.setAttribute(s5,map.get(i));
			req.setAttribute(s6,pin.get(i));

		}
		
		RequestDispatcher rd=req.getRequestDispatcher("station.jsp");
		rd.forward(req, res);
		

	}


	
}
