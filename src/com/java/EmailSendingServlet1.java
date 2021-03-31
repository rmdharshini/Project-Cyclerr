package com.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.Authenticator;;

@SuppressWarnings("serial")
@WebServlet("/EmailSendingServlet1")
public class EmailSendingServlet1 extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
    	
    	HttpSession session=request.getSession();
    	
    	int cost=(int)session.getAttribute("cost");
        String recipient = (String) session.getAttribute("emailid");
        String cycleid=String.valueOf(session.getAttribute("cycle"));
 
        String resultMessage = "";
 
        try {
        	
 		    String content="Your Ride cost for the cycle "+cycleid+" is Rs "+ cost+".Have a nice day";
 		    String subject="RIDE SUMMARY";
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent successfully";
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/timer.jsp").forward(
                    request, response);
            session.setAttribute("emailid", recipient);
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
            System.out.println(resultMessage);
        } 
    }
}