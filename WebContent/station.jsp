<%@page import="com.java.Daostation" %>
<%@page import="java.util.NavigableMap" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Collections" %>
<%@page import="java.util.Collection" %>
<%@page import="java.util.Set" %>
<%@page import="java.util.HashSet" %>
<%@page import="java.util.List" %>
<%@ page import="java.awt.*" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.LinkedHashSet" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Cyclerr | India</title>
  <link rel="icon" href="Images/logo/titleLogo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <!--===============================================================================================-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/autocomplete.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/style.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/stationCard.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="css/stationHeader.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/navDropdown.css">
  <!--===============================================================================================-->
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <!-- NAV-BAR -->
  <nav class="navbar navbar-default navbar-fixed-top" style="position: sticky">
    <div class="container">
      <div class="navbar-header">
        <a href="home.jsp">
          <img src="Images/logo/headerLogo.png" alt="Logo" style="width: 160px; margin-top: 4px">
        </a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right">
          <c:choose>
            <c:when test="${not empty emailid}">
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
            </c:when>
          </c:choose>
          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button"
                  onclick="location.href='Timer.jsp';">MY RIDES</button></c:when>
              <c:otherwise><button type="button" data-js="open"
                  onclick="location.href='logout';" disabled="disabled"
                  style="display:none">LOGOUT</c:otherwise>
            </c:choose>
          </li>
          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button"
                  data-js="open" disabled="disabled"
                  style="display:none">LOGIN</button></c:when>
              <c:otherwise><button type="button" data-js="open"
                  onclick="location.href='login.html';">LOGIN</c:otherwise>
            </c:choose>
          </li>
          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button"
                  data-js="open" disabled="disabled" style="display:none">SIGN
                  UP</button></c:when>
              <c:otherwise><button type="button" data-js="open"
                  onclick="location.href='Signup.html';">SIGN UP</c:otherwise>
            </c:choose>
          </li>
        </ul>
      </div>
    </div>
  </nav>
 
  <!-- SEARCH BAR CONTAINER -->
  <div class="jumbotron text-center" style="padding: 45px 25px;padding-bottom: 60px;">
    <h2 class="find-heading" style="text-transform: none;font-size: 42px;padding-bottom: 0px">Find a Bicycle Station</h2>
    <div id="search-form" class="div-align"></div>
  </div>
  </div>

  <!--  STATION HEADER -->
  <div class="station-name change-color" id="nav">
    <h2 name="City" id="heading-nav" class="heading-color"> ${city1}, <span
        id="state" class="statename"> Tamil Nadu</span><span id="current"></span>
    </h2>
    <a href="#" class="change" id="changebtn"
      onclick="topFunction();myFunction();">Change</a>
  </div>

  <!-- CARD CONTAINER -->
  <!-- 1 -->
  <div class="scroll-container">
    <c:choose>
      <c:when test="${not empty sn0}">
        <div class="label div0">
      </c:when>
      <c:otherwise>
        <div class="label div0" style="display: none;">
      </c:otherwise>
    </c:choose>
    <div>
      <h1 class="card-heading">
        <form action="Daostat" method="get"><input type="submit" value="${sn0}"
            name="station_name" style="background-color:white ;border-style:none; ">
      </h1>
    </div>
    <div class="card-sec1 card-display">
      <h3 class="first-line">${ad0}</h3>
      <h3 class="second-line"></h3>
      <h3 class="third-line">${city1} <span class="pincode">${pin0}</span></h3>
      <a href="${map0}" target="_blank">
        <!--MAP  LINK -->
        <div class="map-details">
          <h4 class="map-link"><img src="Images/stationPage/locationPin.svg"
              alt="location-pin"> Show on map</h4>
        </div>
      </a>
    </div>
    <div class="card-sec2 card-display">
      <h4 class="station-id-label">Station ID</h4>
      <h1 class="station-id station-style">${si0}</h1>
      <h4 class="avl-id-label">Available Bicycles</h4>
      <h1 class="avl-id avl-style"><span style="color: #f4511e;"
          class="avl-style-span">${avl0}</span></h1>
    </div>
  </div>
  </div>
  </form>
  <!-- 2 -->
  <div class="scroll-container">
    <c:choose>
      <c:when test="${not empty sn1}">
        <div class="label div1">
      </c:when>
      <c:otherwise>
        <div class="label div1" style="display: none;">
      </c:otherwise>
    </c:choose>
    <div>
      <h1 class="card-heading">
        <form action="Daostat" method="get"><input type="submit" value="${sn1}"
            name="station_name" style="background-color:white ;border-style:none; ">
      </h1>
    </div>
    <div class="card-sec1 card-display">
      <h3 class="first-line">${ad1}</h3>
      <h3 class="second-line"></h3>
      <h3 class="third-line">${city1} <span>${pin1}</span></h3>
      <a href="${map1}" target="_blank">
        <div class="map-details">
          <h4 class="map-link"><img src="Images/stationPage/locationPin.svg"
              alt="location-pin"> Show on map</h4>
        </div>
      </a>
    </div>
    <div class="card-sec2 card-display">
      <h4 class="station-id-label">Station ID</h4>
      <h1 class="station-id station-style">${si1}</h1>
      <h4 class="avl-id-label">Available Bicycles</h4>
      <h1 class="avl-id avl-style"><span style="color: #f4511e;"
          class="avl-style-span">${avl1}</span></h1>
    </div>
  </div>
  </a>
  </div>
  <!-- 3 -->
  <div class="scroll-container">
    <c:choose>
      <c:when test="${not empty sn2}">
        <div class="label div2">
      </c:when>
      <c:otherwise>
        <div class="label div2" style="display: none;">
      </c:otherwise>
    </c:choose>
    <div>
      <h1 class="card-heading">
        <form action="Daostat" method="get"><input type="submit" value="${sn2}"
            name="station_name" style="background-color:white ;border-style:none; ">
      </h1>
    </div>
    <div class="card-sec1 card-display">
      <h3 class="first-line">${ad2}</h3>
      <h3 class="second-line"></h3>
      <h3 class="third-line">${city1} <span>${pin2}</span></h3>
      <a href="${map2}" target="_blank">
        <div class="map-details">
          <h4 class="map-link"><img src="Images/stationPage/locationPin.svg"
              alt="location-pin"> Show on map</h4>
        </div>
      </a>
    </div>
    <div class="card-sec2 card-display">
      <h4 class="station-id-label">Station ID</h4>
      <h1 class="station-id station-style">${si2}</h1>
      <h4 class="avl-id-label">Available Bicycles</h4>
      <h1 class="avl-id avl-style"><span style="color: #f4511e;"
          class="avl-style-span">${avl2}</span></h1>
    </div>
  </div>
  </a>
  </div>
  <!-- 4 -->
  <div class="scroll-container">
    <c:choose>
      <c:when test="${not empty sn3}">
        <div class="label div3">
      </c:when>
      <c:otherwise>
        <div class="label div3" style="display: none;">
      </c:otherwise>
    </c:choose>
    <div>
      <h1 class="card-heading">
        <form action="Daostat" method="get"><input type="submit" value="${sn3}"
            name="station_name" style="background-color:white ;border-style:none; ">
      </h1>
    </div>
    <div class="card-sec1 card-display">
      <h3 class="first-line">${ad3}</h3>
      <h3 class="second-line"></h3>
      <h3 class="third-line">${city1} <span>${pin3}</span></h3>
      <a href="${map3}" target="_blank">
        <div class="map-details">
          <h4 class="map-link"><img src="Images/stationPage/locationPin.svg"
              alt="location-pin"> Show on map</h4>
        </div>
      </a>
    </div>
    <div class="card-sec2 card-display">
      <h4 class="station-id-label">Station ID</h4>
      <h1 class="station-id station-style">${si3}</h1>
      <h4 class="avl-id-label">Available Bicycles</h4>
      <h1 class="avl-id avl-style"><span style="color: #f4511e;"
          class="avl-style-span">${avl3}</span></h1>
    </div>
  </div>
  </a>
  </div>
  <!-- 5 -->
  <div class="scroll-container">
    <c:choose>
      <c:when test="${not empty sn4}">
        <div class="label div4">
      </c:when>
      <c:otherwise>
        <div class="label div4" style="display: none;">
      </c:otherwise>
    </c:choose>
    <div>
      <h1 class="card-heading">
        <form action="Daostat" method="get"><input type="submit" value="${sn4}"
            name="station_name" style="background-color:white ;border-style:none; ">
      </h1>
    </div>
    <div class="card-sec1 card-display">
      <h3 class="first-line">${ad4}</h3>
      <h3 class="second-line"></h3>
      <h3 class="third-line">${city1} <span>${pin4}</span></h3>
      <a href="${map4}" target="_blank">
        <div class="map-details">
          <h4 class="map-link"><img src="Images/stationPage/locationPin.svg"
              alt="location-pin"> Show on map</h4>
        </div>
      </a>
    </div>
    <div class="card-sec2 card-display">
      <h4 class="station-id-label">Station ID</h4>
      <h1 class="station-id station-style">${si4}</h1>
      <h4 class="avl-id-label">Available Bicycles</h4>
      <h1 class="avl-id avl-style"><span style="color: #f4511e;"
          class="avl-style-span">${avl4}</span></h1>  
    </div>
  </div>
  </a>
  </div>
  <!--===============================================================================================-->
  <!-- DATABASE FETCH - SEARCH BAR CITIES -->
  <%
  String arr[] = new String[100];	int k=0;
  try{
    
    Connection c = null;
      Class.forName("com.mysql.jdbc.Driver");
      c = DriverManager.getConnection("jdbc:mysql://localhost/cycle","sanjay","RPSvib60738");
      PreparedStatement ps=c.prepareStatement("SELECT * from station_details");	
     
     
      ResultSet rs=ps.executeQuery();int i=0;
      while(rs.next())
      {
        arr[i++]=rs.getString(3);k++;
        
      }
  }
  catch(Exception e)
  {
    System.out.print(e);
  } 
  for(int s=0;s<arr.length-1;s++)
  {
      for(int m=s + 1;m<arr.length;m++)
      {
  
                  if(arr[s] != null && arr[s].equals(arr[m]))
                  {
                    // array = ArrayUtils.removeElement(array, array[s]); --m;??
                    arr[m] = ""; // Mark for deletion later on
                  }
      } 
  }
  for(int i=0,j=k;i<k;i++,j++)
  {
    if(arr[i]!="")
    {
      String sa=arr[i];
      arr[j]=sa.substring(0,1).toUpperCase() + sa.substring(1);
    }
  }
  
  
  StringBuffer sb = new StringBuffer();
  sb.append("[");
  for(int i=0; i<arr.length; i++){
      sb.append("\"").append(arr[i]).append("\"");
      if(i+1 < arr.length){
          sb.append(",");
      }
  }
  sb.append("]");
  String s=sb.toString();
  %>
  <!--===============================================================================================-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--===============================================================================================-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/searchbar.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/script.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/station.js"></script>
  <!--===============================================================================================-->
  <script> 
    var proposals = <%= s %>;
    $(document).ready(function () {
      $('#search-form').autocomplete({
        hints: proposals,
        width: 700,
        height: '70.9%',
        onSubmit: function (text) {
          $('#message').html('Selected: <b>' + text + '</b>');
        }
      });
    });
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