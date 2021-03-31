<%@page import="java.util.TimeZone" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.Format" %>
<%@page import="java.sql.Time" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.TimeZone" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Cyclerr | India</title>
  <link rel="icon" href="Images/logo/titleLogo.png">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
  <!--===============================================================================================-->
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/style.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/navDropdown.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/thankyou.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/thankyouStar.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/timer.css">
  <!--===============================================================================================-->
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <!-- NAV-BAR -->
  <nav class="navbar navbar-default navbar-fixed-top" style="position: sticky">
    <div class="container">
      <div class="navbar-header">
        <a href="home.jsp">
          <img src="Images/logo/headerLogo.png" alt="Logo"
            style="width: 160px; margin-top: 4px">
        </a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right">
          <div class="dropdown" style="float: right;">
            <button class="dropbtn" style="width: 200px">
              MY ACCOUNT
              <i class="fa fa-caret-down"></i>
            </button>
            <div class="triangle"></div>
            <div class="dropdown-content">
              <button onclick="location.href='Daodash';">DASHBOARD</button>
              <button onclick="location.href='logout';">LOGOUT</button>
            </div>
          </div>
        </ul>
      </div>
    </div>
  </nav>

  <!-- TIMER CONTAINER -->
  <div class="timer-container">
    <div class="inner-timer-container">
      <!-- CYCLE-1 TIMER CONTAINER -->
      <c:choose>
        <c:when test="${count>0}">
          <div class="timer-main-container" style="margin-top: 0px; ">
        </c:when>
        <c:otherwise>
          <div class="timer-main-container" style="display:none">
        </c:otherwise>
      </c:choose>

      <div class="cycle-no">
        <h3>BICYCLE - 1</h3>
      </div>

      <!-- CYCLE-ID SEC -->
      <div class="timer-bicycle-heading">
        <div class="heading-filter">
          <h4 class="heading-label">Bicycle ID</h4>
          <h1 class="heading-holder">${cycleid1}</h1>
        </div>
      </div>

      <!-- PIN SEC -->
      <div class="pin-bicycle-heading">
        <div class="heading-filter">
          <h4 class="pin-heading-label">Pin</h4>
          <h1 class="pin-heading-holder" id="pin1">****</h1>
        </div>
      </div>

      <!-- TIMER SEC -->
      <div class="timer-holder">
        <!-- TIMER INNER SEC -->
        <div class="timer timer1control timerStyle">
          <span class="hour">00</span>: <span class="minute">00</span>:
          <span class="second">10</span>
        </div>
        <!-- TIMER CONTROL BUTTON INNER SEC -->
        <div class="button-sec">
          <div style="display:flex; justify-content: stretch; align-items: center ">
            <form action="Daoextend" method="get">
              <input type="submit" data-js="extend" class="extdbtn" value="Extend Duration">
            </form>
            <input type="button" class="startbtn"
              onClick="validate();timer.reset(${timer1});timer.start(1000);this.disabled=true"
              value="Start">
          </div>

          <div style="display:flex;justify-content: stretch; align-items: center ">
            <form action="Daopasson1">
              <input type="submit" id="b" class="passonbtn" value="Pass on">
            </form>
            <form action="Daoend">
              <input type="submit" class="endbtn" onClick="timer.stop()" value="END">
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- CYCLE-2 TIMER CONTAINER -->
    <c:choose>
      <c:when test="${count>1}">
        <div class="timer-main-container">
      </c:when>
      <c:otherwise>
        <div class="timer-main-container" style="display:none">
      </c:otherwise>
    </c:choose>
    <div class="cycle-no">
      <h3>BICYCLE - 2</h3>
    </div>

    <!-- CYCLE-ID SEC -->
    <div class="timer-bicycle-heading">
      <div class="heading-filter">
        <h4 class="heading-label">Bicycle ID</h4>
        <h1 class="heading-holder">${cycleid2}</h1>
      </div>
    </div>

    <!-- PIN SEC -->
    <div class="pin-bicycle-heading">
      <div class="heading-filter">
        <h4 class="pin-heading-label">Pin</h4>
        <h1 class="pin-heading-holder" id="pin2">****</h1>
      </div>
    </div>

    <!-- TIMER SEC -->
    <div class="timer-holder">
      <!-- TIMER INNER SEC -->
      <div class="Timer1 timer-sec2 timerStyle">
        <span class="hour">00</span>: <span class="minute">00</span>:
        <span class="second">10</span>
      </div>
      <!-- TIMER CONTROL BUTTON INNER SEC -->
      <div class="button-sec">
        <div style="display: flex; justify-content: stretch; align-items: center ">
          <form action="Daoextend1" method="get">
            <input type="submit" class="extdbtn" value="Extend Duration">
            <div class="popup_extend">
              <div id="extend"></div>

            </div>
          </form>
          <input type="button" class="startbtn2"
            onClick=" validate1();Timer1.reset(${timer2});Timer1.start(1000); this.disabled=true"
            value="Start">
        </div>
        <div style="display: flex;justify-content: stretch; align-items: center ">
          <form action="Daopasson2">
            <input type="submit" id="b" class="passonbtn" value="Pass on">
          </form>
          <form action="Daoend1">
            <input type="submit" class="endbtn" onClick="Timer1.stop()" value="END">
          </form>
        </div>
      </div>
    </div>
  </div>

  <c:choose>
    <c:when test="${count==1}">
      <div style="height: 40px;width: 100%;background-color: transparent;"></div>
    </c:when>
  </c:choose>
  </div>

  <c:choose>
    <c:when test="${count>0}">
      <div class="note-sec">
        <p><i class="fa fa-exclamation-circle"
            style="padding: 5px; font-size: 18px; "></i>NOTE: On clicking <span
            style="color: WHITE"> "Extend Duration" </span>ride time will be extended by 1
          hour</p>
      </div>
    </c:when>
  </c:choose>

  <c:choose>
    <c:when test="${count==0}">
      <!-- THANK YOU CONTAINER -->
      <div class="thankyou-container">
        <div class="thankyou-content">
          <h1>Thank you for choosing Cyclerr</h1>
          <h4>Your feedback is important for us!</h4>
          <h4>Overall, how would you rate your experiance today? </h4>
        </div>
        <section class='rating-widget'>
          <div class='rating-stars text-center'>
            <ul id='stars'>
              <li class='star' title='Poor' data-value='1'>
                <i class='fa fa-star fa-fw'></i>
              </li>
              <li class='star' title='Fair' data-value='2'>
                <i class='fa fa-star fa-fw'></i>
              </li>
              <li class='star' title='Good' data-value='3'>
                <i class='fa fa-star fa-fw'></i>
              </li>
              <li class='star' title='Excellent' data-value='4'>
                <i class='fa fa-star fa-fw'></i>
              </li>
              <li class='star' title='WOW!!!' data-value='5'>
                <i class='fa fa-star fa-fw'></i>
              </li>
            </ul>
          </div>
        </section>
        <div class="pay-button" style="margin-top: 30px;">
          <button class="submit" onclick="location.href='Frontpage.jsp';">Submit</button>
        </div>
      </div>
    </c:when>
  </c:choose>
  <!--===============================================================================================-->
  <script src="Javascript/script.js"></script>
  <!--===============================================================================================-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--===============================================================================================-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.2.min.js"></script> 
  <!--===============================================================================================-->
  <script src="https://unpkg.com/cq-prolyfill@0.4.0/cq-prolyfill.min.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/timer_1.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/timer_2.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/thankyou.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript">
  // TIME CALCULATION
    function validate() {
      document.getElementById('pin1').innerHTML = "<%= session.getAttribute("pin1")%>";
  <%
        int y = 0;
      String cycleid = ""; String t = "";
      try {
        Connection c = null;
        Class.forName("com.mysql.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost/cycle", "sanjay", "RPSvib60738");
        PreparedStatement ps = c.prepareStatement("Select * from overall WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
        cycleid = String.valueOf(session.getAttribute("cycleid1"));
        ps.setString(1, cycleid);
        ps.setInt(2, 1);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
          t = rs.getTime(4).toString();
        }
      } catch (Exception e)
      {
        //System.out.println(e);
        y++;
      }

      if (y > 0) {
        try {

          Connection c = null;
          Class.forName("com.mysql.jdbc.Driver");
          c = DriverManager.getConnection("jdbc:mysql://localhost/cycle", "sanjay", "RPSvib60738");
          PreparedStatement ps = c.prepareStatement("UPDATE overall SET START_TIME = (?), RIDE_END_TIME= (?) WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
          Calendar cal = Calendar.getInstance();
          SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");
          Format f = new SimpleDateFormat("hh:mm:ss");
          String strResult = f.format(new Date());
          // System.out.println(strResult);

          String ini1 = String.valueOf(session.getAttribute("Ini1"));
          //System.out.println(ini1);

          SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
          timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

          Date date1 = timeFormat.parse(ini1);
          Date date2 = timeFormat.parse(strResult);

          long sum = date1.getTime() + date2.getTime();
          String date3 = timeFormat.format(new Date(sum));

          String cycleid1 = String.valueOf(session.getAttribute("cycleid1"));
          Time t1 = Time.valueOf(strResult);
          Time rendtime = Time.valueOf(date3);
          ps.setTime(1, t1);
          ps.setTime(2, rendtime);
          ps.setString(3, cycleid1);
          ps.setInt(4, 1);
          ps.executeUpdate();

          Date date4 = simpleformat.parse(date3);
          long sum2 = date4.getTime() - date2.getTime();
          String total_final = simpleformat.format(new Date(sum2));
          int total = (Integer.parseInt(total_final.substring(0, 2)) * 3600) + (Integer.parseInt(total_final.substring(3, 5)) * 60) + (Integer.parseInt(total_final.substring(6, 8)));
          session.setAttribute("timer1", total);
        }
        catch (Exception e)
        {
          System.out.print(e);
        }
      }
      else {
        try {
          Connection c = null; String time = "";
          Class.forName("com.mysql.jdbc.Driver");
          c = DriverManager.getConnection("jdbc:mysql://localhost/cycle", "sanjay", "RPSvib60738");
          PreparedStatement ps = c.prepareStatement("Select * from overall WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
          cycleid = String.valueOf(session.getAttribute("cycleid1"));
          ps.setString(1, cycleid);
          ps.setInt(2, 1);
          ResultSet rs = ps.executeQuery();
          while (rs.next()) {
            time = rs.getTime(7).toString();
          }

          SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");
          Format f = new SimpleDateFormat("hh:mm:ss");
          String strResult = f.format(new Date());

          SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
          timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

          Date date1 = timeFormat.parse(time);
          Date date2 = timeFormat.parse(strResult);

          long sum = date1.getTime() - date2.getTime();
          String date3 = timeFormat.format(new Date(sum));

          int total = (Integer.parseInt(date3.substring(0, 2)) * 3600) + (Integer.parseInt(date3.substring(3, 5)) * 60) + (Integer.parseInt(date3.substring(6, 8)));
          session.setAttribute("timer1", total);
        }
        catch (Exception e)
        {
          System.out.println(e);
        }
      }
  %>
  }
    function validate1() {
      document.getElementById('pin2').innerHTML = "<%= session.getAttribute("pin2")%>";
  <%
        int y1 = 0;
      String cycleid2 = ""; String t2 = "";
      try {
        Connection c = null;
        Class.forName("com.mysql.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost/cycle", "sanjay", "RPSvib60738");
        PreparedStatement ps = c.prepareStatement("Select * from overall WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
        cycleid2 = String.valueOf(session.getAttribute("cycleid2"));
        ps.setString(1, cycleid2);
        ps.setInt(2, 1);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
          t2 = rs.getTime(4).toString();
        }
      } catch (Exception e)
      {
        //System.out.println(e);
        y1++;
      }

      if (y1 > 0) {
        try {

          Connection c = null;
          Class.forName("com.mysql.jdbc.Driver");
          c = DriverManager.getConnection("jdbc:mysql://localhost/cycle", "sanjay", "RPSvib60738");
          PreparedStatement ps = c.prepareStatement("UPDATE overall SET START_TIME = (?), RIDE_END_TIME= (?) WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
          Calendar cal = Calendar.getInstance();
          SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");
          Format f = new SimpleDateFormat("hh:mm:ss");
          String strResult = f.format(new Date());


          String ini2 = String.valueOf(session.getAttribute("Ini2"));


          SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
          timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

          Date date1 = timeFormat.parse(ini2);
          Date date2 = timeFormat.parse(strResult);

          long sum = date1.getTime() + date2.getTime();
          String date3 = timeFormat.format(new Date(sum));


          String cycleid22 = String.valueOf(session.getAttribute("cycleid2"));
          Time t1 = Time.valueOf(strResult);
          Time rendtime = Time.valueOf(date3);
          ps.setTime(1, t1);
          ps.setTime(2, rendtime);
          ps.setString(3, cycleid22);
          ps.setInt(4, 1);
          ps.executeUpdate();


          Date date4 = timeFormat.parse(date3);
          long sum2 = date4.getTime() - date2.getTime();
          String total_final = timeFormat.format(new Date(sum2));
          int total = (Integer.parseInt(total_final.substring(0, 2)) * 3600) + (Integer.parseInt(total_final.substring(3, 5)) * 60) + (Integer.parseInt(total_final.substring(6, 8)));
          session.setAttribute("timer2", total);
        }
        catch (Exception e)
        {
          //  System.out.print(e);
        }
      }
      else {
        try {
          Connection c = null; String time = "";
          Class.forName("com.mysql.jdbc.Driver");
          c = DriverManager.getConnection("jdbc:mysql://localhost/cycle", "sanjay", "RPSvib60738");
          PreparedStatement ps = c.prepareStatement("Select * from overall WHERE CYCLE_ID = (?) AND RIDE_STATUS=(?)");
          cycleid = String.valueOf(session.getAttribute("cycleid2"));
          ps.setString(1, cycleid);
          ps.setInt(2, 1);
          ResultSet rs = ps.executeQuery();
          while (rs.next()) {
            time = rs.getTime(7).toString();
          }

          SimpleDateFormat simpleformat = new SimpleDateFormat(" hh:mm:s ");
          Format f = new SimpleDateFormat("hh:mm:ss");
          String strResult = f.format(new Date());

          SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
          timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

          Date date1 = timeFormat.parse(time);
          Date date2 = timeFormat.parse(strResult);

          long sum = date1.getTime() - date2.getTime();
          String date3 = timeFormat.format(new Date(sum));

          int total = (Integer.parseInt(date3.substring(0, 2)) * 3600) + (Integer.parseInt(date3.substring(3, 5)) * 60) + (Integer.parseInt(date3.substring(6, 8)));
          session.setAttribute("timer2", total);

        }
        catch (Exception e)
        {
          //System.out.println(e);
        }
      }
  %>
  }
  </script>
  <!--===============================================================================================-->
  <!-- FOOTER -->
  <div id="footer"></div>
  <script>
    $(function () {
      $("#footer").load("footer.html");
    });
  </script>
  <!--===============================================================================================-->
</body>

</html>