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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
  <!--===============================================================================================-->
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/style.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/paymentSucessful.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/tick.css" />
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
          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button" onclick="location.href='Timer.jsp';">MY
                  RIDES</button></c:when>
              <c:otherwise><button type="button" data-js="open" onclick="location.href='logout';"
                  disabled="disabled" style="display:none">LOGOUT</c:otherwise>
            </c:choose>
          </li>
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

  <!-- PAYMENT SUCCESSFUL CONTAINER -->
  <div class="pay-container">
    <div class="paySucesstick">
      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
        y="0px" viewBox="0 0 1600 1240" enable-background="new 0 0 1600 1240" xml:space="preserve">
        <path
          d="m 1671,970 q 0,-40 -28,-68 L 919,178 783,42 Q 755,14 715,14 675,14 647,42 L 511,178 149,540 q -28,28 -28,68 0,40 28,68 l 136,136 q 28,28 68,28 40,0 68,-28 l 294,-295 656,657 q 28,28 68,28 40,0 68,-28 l 136,-136 q 28,-28 28,-68 z"
          fill="rgba(0,0,0,0)" class="path" stroke-width="10" stroke-miterLimit="10" />
      </svg>
    </div>
    <div class="pay-content">
      <h1>Payment Sucessful!</h1>
      <h4>Payment ID: <span id="pay-id">${pid}</span></h4>
      <h4>Happy cycling for next <span id="pay-hour">${hour1} </span><span id="pay-hour-text">hour</span></h4>
    </div>

    <!-- PAYMENT BUTTON -->
    <div class="pay-button">
      <c:choose>
        <c:when test="${count>=2}">
          <button class="submit add-another" value="Proceed" onclick="location.href='Station_page.jsp';"
            style="display:none;"><i class="fa fa-plus fa-sm"></i> Book Another Bicycle</button>
        </c:when>
        <c:otherwise><button class="submit add-another" value="Proceed"
            onclick="location.href='Station_page.jsp';"><i class="fa fa-plus fa-sm"></i> Book Another
            Bicycle</button></c:otherwise>
      </c:choose>
      <button class="submit" value="Proceed" onclick="location.href='Timer.jsp';">Ride Now</button>
    </div>
  </div>
  <!--===============================================================================================-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--===============================================================================================-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.min.js"
    integrity="sha512-d8F1J2kyiRowBB/8/pAWsqUl0wSEOkG5KATkVV4slfblq9VRQ6MyDZVxWl2tWd+mPhuCbpTB4M7uU/x9FlgQ9Q=="
    crossorigin="anonymous"></script>
  <!--===============================================================================================-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"
    integrity="sha512-ZKNVEa7gi0Dz4Rq9jXcySgcPiK+5f01CqW+ZoKLLKr9VMXuCsw3RjWiv8ZpIOa0hxO79np7Ec8DDWALM0bDOaQ=="
    crossorigin="anonymous"></script>
  <!--===============================================================================================-->
  <script src="Javascript/script.js"></script>
  <!--===============================================================================================-->
  <!-- HOUR INDICATOR -->
  <script>
    if (document.getElementById("pay-hour").innerText === "1 ") {
      document.getElementById("pay-hour-text").innerText = "hour";
    }
    else {
      document.getElementById("pay-hour-text").innerText = "hours";
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