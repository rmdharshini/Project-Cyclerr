<%@page import="java.util.Collections" %>
<%@page import="java.util.Collection" %>
<%@page import="java.util.Set" %>
<%@page import="java.util.HashSet" %>
<%@page import="java.util.List" %>
<%@ page import="java.awt.*" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.LinkedHashSet" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.* " %>
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
  <!--===============================================================================================-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--===============================================================================================-->
  <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
  <!--===============================================================================================-->
  <link rel="preconnect" href="https://fonts.gstatic.com"/>
  <!--===============================================================================================-->
  <link  rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato&display=swap" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/home.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/homeContent.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/autocomplete.min.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/navDropdown.css" />
  <!--===============================================================================================-->
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <!-- NAV-BAR -->
  <nav class="navbar navbar-default navbar-fixed-top" style="position: sticky">
    <div class="container">
      <div class="navbar-header">
        <img src="Images/logo/headerLogo.png" alt="Logo" style="width: 160px; margin-top: 4px">
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
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
        <ul class="nav navbar-nav navbar-right">
          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button" data-js="open"
                  disabled="disabled" style="display:none">LOGIN</button></c:when>
              <c:otherwise><button type="button" data-js="open"
                  onclick="location.href='login.html';">LOGIN</c:otherwise>
            </c:choose>
          </li>

          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button" data-js="open"
                  disabled="disabled" style="display:none">SIGN UP</button></c:when>
              <c:otherwise><button type="button" data-js="open"
                  onclick="location.href='Signup.html';">SIGN UP</c:otherwise>
            </c:choose>
          </li>

          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button"
                  onclick="location.href='Timer.jsp';">MY RIDES</button></c:when>
              <c:otherwise><button type="button" data-js="open"
                  onclick="location.href='logout';" disabled="disabled"
                  style="display:none">LOGOUT</c:otherwise>
            </c:choose>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- SEARCH CONTAINER -->
  <div class="jumbotron text-center" style="padding-top: 40px;position: relative;">
    <h2 class="find-heading"
      style="text-transform: none;font-size: 42px;padding-bottom: 0px;">Find a Bicycle Station
    </h2>
    <div id="search-form" class="div-align"></div>
    <div class="bg-image"></div>
  </div>

  <!-- PASS ON SECTION -->
  <div id="about" class="row">
    <div class="intro-passon" class="container-fluid">
      <div class="inner-passon-1">
        <h1 class="bar"></h1>
        <h1 class="heading-passon">Introducing Cyclerr Pass On</h1>
        <h4>
          This allows user to switch cycles, to another user and end their
          ride.
        </h4>
      </div>
      <div class="inner-passon-2 inner-style">
        <h1>1</h1>
        <h3>Find user who is accepting a pass on cycle</h3>
      </div>
      <div class="inner-passon-3 inner-style">
        <h1>2</h1>
        <h3>Get user details and allot the cycle to the next user</h3>
      </div>
      <div class="inner-passon-4 inner-style">
        <h1>3</h1>
        <h3>Get hand-in payment</h3>
      </div>
    </div>
  </div>

  <!-- BENEFIT SECTION -->
  <div class="container-fluid slideanim">
    <div class="row">
      <div class="sec2-holder">
        <div class="sec2-image"></div>
        <div class="sec2-content">
          <h1 style="font-size: 32px;">Moving towards a eco-friendly environment</h1>
          <h4>
            Helps in reducing pollution and contributes a healthier way of a
            lifestyle. Introduces a new liking towards cycle, which might
            bring a greater change in the future too.
          </h4>
        </div>
      </div>
    </div>
  </div>

  <!-- HOW TO SECTION -->
  <div id="howto" class="container-fluid text-center">
    <div class="img-howto"></div>
    <h1 class="sec2-heading">How to use Cyclerr</h1>
    <ul id="timeline">
      <li class="work">
        <!-- STEP-1 -->
        <input class="radio" id="work1" name="works" type="radio" checked />
        <div class="relative">
          <label for="work1">Your location / Choose your station</label>
          <span class="circle" style="animation-delay: 0s"></span>
        </div>
        <div class="content">
          <h4>
            Enter your current location and choose your nearest cyclerr
            station
          </h4>
        </div>
      </li>
      <li class="work">
        <!-- STEP-2 -->
        <input class="radio" id="work2" name="works" type="radio" checked />
        <div class="relative">
          <label for="work2">Pick a cycle</label>
          <span class="circle" style="animation-delay: 1s"></span>
        </div>
        <div class="content">
          <h4>With the given options of cycle, pick your suitable one</h4>
        </div>
      </li>
      <li class="work">
        <!-- STEP-3 -->
        <input class="radio" id="work3" name="works" type="radio" checked />
        <div class="relative">
          <label for="work3">Select your needed duration</label>
          <span class="circle" style="animation-delay: 2s"></span>
        </div>
        <div class="content">
          <h4>
            Select your wanting occupancy time in which there is a possibility
            to extend the time, while in your specific journey
          </h4>
        </div>
      </li>
      <li class="work">
        <!-- STEP-4 -->
        <input class="radio" id="work4" name="works" type="radio" />
        <div class="relative">
          <label for="work4">Enter destination point</label>
          <span class="circle" style="animation-delay: 3s"></span>
        </div>
        <div class="content">
          <h4>Select your destination point where you will end your ride</h4>
        </div>
      </li>
      <li class="work">
        <!-- STEP-5 -->
        <input class="radio" id="work5" name="works" type="radio" />
        <div class="relative">
          <label for="work5">Payment</label>
          <span class="circle" style="animation-delay: 4s"></span>
        </div>
        <div class="content">
          <h4>
            To finish up the process and to get your cycle in hand, a payment
            must be done at last
          </h4>
        </div>
      </li>
    </ul>
  </div>

  <!-- DELIVER SECTION -->
  <div id="deliver" class="container-fluid text-center bg-grey"
    style="padding: 70px 60px 50px">
    <h1 class="heading-deliver">We Promise to Deliver</h1>
    <div class="row text-center">
      <div class="col-sm-3">
        <!-- PROMISE-1 -->
        <div class="thumbnail slideanim" style="height: 250px;">
          <i class="fa fa-headphones fa-3x"></i>
          <h3>SUPREME CUSTOMER SERVICE</h3>
        </div>
      </div>
      <div class="col-sm-3">
        <!-- PROMISE-2 -->
        <div class="thumbnail slideanim" style="height: 250px;">
          <i class="fas fa-biking fa-3x"></i>
          <h3>QUALITY BICYCLES</h3>
        </div>
      </div>
      <div class="col-sm-3">
        <!-- PROMISE-3 -->
        <div class="thumbnail slideanim" style="height: 250px;">
          <i class="fa fa-rupee-sign fa-3x"></i>
          <h3>AFFORDABLE PRICE</h3>
        </div>
      </div>
      <div class="col-sm-3">
        <!-- PROMISE-4 -->
        <div class="thumbnail slideanim" style="height: 250px;">
          <i class="fas fa-heart fa-3x"></i>
          <h3>FLEXIBILTY</h3>
        </div>
      </div>
    </div>
  </div>

  <!-- REVIEW SECTION -->
  <div id="review" class="container-fluid text-center"
    style="margin-bottom: 0px;padding-top: 0px;">
    <h1 class="heading-review">What our customers say</h1>
    <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <!-- REVIEW-1 -->
          <h4>
            "Finding out cyclerr made my travel within a local area more easy
            and at the same time I enjoyed the breeze and feel of
            cycling"<br /><span>Sandhya</span>
          </h4>
        </div>
        <div class="item">
          <!-- REVIEW-2 -->
          <h4>
            "As a person new in town, I was able to discover the local areas
            very easily and main the reason behind it was cyclerr"<br /><span>Anand</span>
          </h4>
        </div>
        <div class="item">
          <!-- REVIEW-3 -->
          <h4>
            "Cyclerr was an easy to go platform in which I can rely on
            anytime, it is the best service providing platform"<br /><span>Gatherine</span>
          </h4>
        </div>
      </div>
      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
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
  <script src="Javascript/script.js"  type="text/javascript"></script>
  <!--===============================================================================================-->
  <script src="Javascript/searchbar.js"  type="text/javascript"></script>
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