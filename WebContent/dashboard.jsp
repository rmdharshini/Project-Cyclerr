<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title> Cyclerr | India </title>
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
  <link rel="stylesheet" href="css/historyCard.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/dashboard.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/navDropdown.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/sidebar.css" />
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
        <ul class="nav navbar-nav navbar-right">
          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button" onclick="location.href='Timer.jsp';">MY
                  RIDES</button></c:when>
              <c:otherwise><button type="button" data-js="open" onclick="location.href='logout';"
                  disabled="disabled" style="display:none">LOGOUT</c:otherwise>
            </c:choose>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- SIDEBAR -->
  <div class="sidenav">
    <a href="#main" onclick="switcher2()">Profile</a>
    <a href="#main2" onclick="switcher()">History</a>
  </div>

  <!-- ACCOUNT-DETAILS DASHBOARD -->
  <div class="main" id="acc">
    <div>
      <h1
        style="padding-left: 20px; color: black; text-align: left; margin-left: 100px; margin-top: 40px;font-size: 32px;">
        Cyclerr Dashboard</h1>
    </div>
    <div class="sec1-hide">
      <div style="display: flex;left: -110px;">
        <div class="dash-content well">
          <div class="dashcontent-sec1">
            <div class="sec1-name" style="margin-bottom: 20px;">
              <h3>NAME</h3>
              <h1>${name}</h1>
            </div>
            <div class="sec1-email">
              <h3>EMAIL ID</h3>
              <h1>${emailid}</h1>
            </div>
          </div>
          <div class="dashcontent-sec2">
            <div class="sec2-userid" style="margin-bottom: 20px;">
              <h3>USER ID</h3>
              <h1>${userid}</h1>
            </div>
            <div class="sec2-mobileno">
              <h3>MOBILE NUMBER</h3>
              <h1>(91) ${mobile}</h1>
            </div>
          </div>
        </div>
        <div class="dash-content well" style="padding-right: 20px">
          <div class="dashcontent-sec1">
            <div class=" sec1-rideno">
              <h3>TOTAL RIDES</h3>
              <h1 style="font-size: 50px;">${rides}</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- USER HISTORY TABLE -->
  <div class="main2" id="hc" style=" display: none;">
    <div>
      <h1
        style="padding-left: 20px; color: black; text-align: left; margin-left: 100px; margin-top: 40px; font-size: 32px; margin-bottom: 25px">
        Ride History</h1>
    </div>
    <div class="sec1-hide scroll-setting">
      <div class="history-card">
        <div class="historyDate">
          <h3>DATE</h3>
          <h1>${date0}</h1>
        </div>
        <div class="historyCycleID">
          <h3>BICYLE ID</h3>
          <h1>${cycle0}</h1>
        </div>
        <div class="historyStart">
          <h3>START POINT</h3>
          <h1>${start0}</h1>
        </div>
        <div class="historyEnd">
          <h3>END POINT</h3>
          <h1>${end0}</h1>
        </div>
        <div class="historyStartTime">
          <h3>START TIME</h3>
          <h1>${tstart0 }</h1>
        </div>
        <div class="historyEndTime">
          <h3>END TIME</h3>
          <h1>${tend0 }</h1>
        </div>
        <div class="historyPrice">
          <h3>TOTAL</h3>
          <h1>${price0}</h1>
        </div>
      </div>
      <div class="history-card">
        <div class="historyDate">
          <h3>DATE</h3>
          <h1>${date1}</h1>
        </div>
        <div class="historyCycleID">
          <h3>BICYLE ID</h3>
          <h1>${cycle1}</h1>
        </div>
        <div class="historyStart">
          <h3>START POINT</h3>
          <h1>${start1}</h1>
        </div>
        <div class="historyEnd">
          <h3>END POINT</h3>
          <h1>${end1}</h1>
        </div>
        <div class="historyStartTime">
          <h3>START TIME</h3>
          <h1>${tstart1 }</h1>
        </div>
        <div class="historyEndTime">
          <h3>END TIME</h3>
          <h1>${tend1 }</h1>
        </div>
        <div class="historyPrice">
          <h3>TOTAL</h3>
          <h1>${price1}</h1>
        </div>
      </div>
      <div class="history-card">
        <div class="historyDate">
          <h3>DATE</h3>
          <h1>${date2}</h1>
        </div>
        <div class="historyCycleID">
          <h3>BICYLE ID</h3>
          <h1>${cycle2}</h1>
        </div>
        <div class="historyStart">
          <h3>START POINT</h3>
          <h1>${start2}</h1>
        </div>
        <div class="historyEnd">
          <h3>END POINT</h3>
          <h1>${end2}</h1>
        </div>
        <div class="historyStartTime">
          <h3>START TIME</h3>
          <h1>${tstart2 }</h1>
        </div>
        <div class="historyEndTime">
          <h3>END TIME</h3>
          <h1>${tend2 }</h1>
        </div>
        <div class="historyPrice">
          <h3>TOTAL</h3>
          <h1>${price2}</h1>
        </div>
      </div>
      <div class="history-card">
        <div class="historyDate">
          <h3>DATE</h3>
          <h1>${date3}</h1>
        </div>
        <div class="historyCycleID">
          <h3>BICYLE ID</h3>
          <h1>${cycle3}</h1>
        </div>
        <div class="historyStart">
          <h3>START POINT</h3>
          <h1>${start3}</h1>
        </div>
        <div class="historyEnd">
          <h3>END POINT</h3>
          <h1>${end3}</h1>
        </div>
        <div class="historyStartTime">
          <h3>START TIME</h3>
          <h1>${tstart3 }</h1>
        </div>
        <div class="historyEndTime">
          <h3>END TIME</h3>
          <h1>${tend3 }</h1>
        </div>
        <div class="historyPrice">
          <h3>TOTAL</h3>
          <h1>${price3}</h1>
        </div>
      </div>
      <div class="history-card">
        <div class="historyDate">
          <h3>DATE</h3>
          <h1>${date4}</h1>
        </div>
        <div class="historyCycleID">
          <h3>BICYLE ID</h3>
          <h1>${cycle4}</h1>
        </div>
        <div class="historyStart">
          <h3>START POINT</h3>
          <h1>${start4}</h1>
        </div>
        <div class="historyEnd">
          <h3>END POINT</h3>
          <h1>${end4}</h1>
        </div>
        <div class="historyStartTime">
          <h3>START TIME</h3>
          <h1>${tstart4 }</h1>
        </div>
        <div class="historyEndTime">
          <h3>END TIME</h3>
          <h1>${tend4 }</h1>
        </div>
        <div class="historyPrice">
          <h3>TOTAL</h3>
          <h1>${price4}</h1>
        </div>
      </div>
    </div>
  </div>

  <!--===============================================================================================-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--===============================================================================================-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/script.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/dashboard.js"></script>
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