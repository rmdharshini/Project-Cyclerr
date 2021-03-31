package com.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.Authenticator;;

@SuppressWarnings("serial")
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
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
        String recipient = (String) request.getAttribute("emailid");
        
 
        String resultMessage = "";
 
        try {
        	 Connection c = null;
 		    Class.forName("com.mysql.jdbc.Driver");
 		    c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
 		    PreparedStatement ps=c.prepareStatement("INSERT INTO sign_up (Email_Id,Random_Number) VALUES (?,?);");	
 		    ps.setString(1, recipient);
 		    Random rand=new Random();
 		    int ran= ThreadLocalRandom.current().nextInt(10000,90000);
 		   
 		    ps.setInt(2,ran);
 		    boolean a=ps.execute();
 		    String content="YOUR ACCOUNT ACTIVATION PIN:"+ran;
 		    String subject="ACCOUNT ACTIVATION";
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent successfully";
            HttpSession session =request.getSession();
            session.setAttribute("emailid", recipient);
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/signupVerify.jsp").forward(
                    request, response);
        }
    }
}