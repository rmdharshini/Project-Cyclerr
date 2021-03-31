<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <!--===============================================================================================-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/style.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/durationCard.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/specificCycle.css">
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
              <c:when test="${not empty emailid}"><button type="button" onclick="location.href='Timer.jsp';">MY
                  RIDES</button></c:when>
              <c:otherwise><button type="button" data-js="open" onclick="location.href='logout';"
                  disabled="disabled" style="display:none">LOGOUT</c:otherwise>
            </c:choose>
          </li>
          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button" data-js="open" disabled="disabled"
                  style="display:none">LOGIN</button></c:when>
              <c:otherwise><button type="button" data-js="open" onclick="location.href='login.html';">LOGIN
              </c:otherwise>
            </c:choose>
          </li>
          <li>
            <c:choose>
              <c:when test="${not empty emailid}"><button type="button" data-js="open" disabled="disabled"
                  style="display:none">SIGN UP</button></c:when>
              <c:otherwise><button type="button" data-js="open" onclick="location.href='Signup.html';">SIGN UP
              </c:otherwise>
            </c:choose>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- CYCLE-DETAILS -->
  <div class="cycle-container-holder">
    <div class="cycle-container">
      <!-- SECTION - 1 -->
      <div class="cycle-inner-sec1">
        <div class="cycle-inner-part-1">
          <div class="bicycle-div">
            <div class="bicycle-wrapper">
              <h4 class="bicycle-label">Bicycle ID</h4>
              <h1 class="bicycle-id-holder">${cid}</h1>
            </div>
          </div>
        </div>
        <!-- SECTION - 2 -->
        <div class="cycle-inner-part-2">
          <div class="details-holder">
            <div class="loc-inner">
              <h4 class="current-loc-label">Current Station</h4>
              <h1 class="current-loc-holder">
                ${sn}
              </h1>
            </div>
          </div>
        </div>
        <!-- SECTION - 3 -->
        <div class="cycle-inner-part-3">
          <div class="time-ride-holder">
            <div class="ride-inner">
              <h4 class="ride-label">Total Rides</h4>
              <h1 class="ride-holder count">${rides}</h1>
            </div>
            <div class="time-inner">
              <h4 class="time-label">Total Time Pedaled</h4>
              <h1 class="time-holder"><span class="count">60</span>hrs</h1>
            </div>
          </div>
        </div>
      </div>

      <!-- DESTINATION AND PRICE -->
      <form name="cycle" id="card" action="demp">
        <div class="cycle-inner-sec2">
          <div class="card-holder">
            <h4 class="card-label">Select Duration<span class="alert-style" id="errorTime" style="margin-left: 5px; font-weight: normal"></span> </h4>
            <!-- PRICE CARD 1 -->
            <div class="price-table">
              <div class="price-card">
                <h3 class="price-card-header"></h3>
                <div class="price">1<span>hr</span></div>
                <p class="priceli"><strong>Rs. 40</strong></p>
                <label for="1" class="order-btn" style="position: relative">
                  <input type="radio" id="1" name="hour" value="01:00:00" onclick="changeColour('0')" />
                  SELECT
                </label>
              </div>
              <!-- PRICE CARD 2 -->
              <div class="price-card">
                <h3 class="price-card-header"></h3>
                <div class="price">2<span>hrs</span></div>
                <p class="priceli"><strong>Rs. 80</strong></p>
                <label for="2" class="order-btn" style="position: relative">
                  <input type="radio" id="2" name="hour" value="02:00:00" onclick="changeColour('1')" />
                  SELECT
                </label>
              </div>
              <!-- PRICE CARD 3 -->
              <div class="price-card">
                <h3 class="price-card-header"></h3>
                <div class="price">3<span>hrs</span></div>
                <p class="priceli"><strong>Rs. 120</strong></p>
                <label for="3" class="order-btn" style="position: relative">
                  <input type="radio" id="3" name="hour" value="03:00:00" onclick="changeColour('2')" />
                  SELECT
                </label>
              </div>
              <!-- PRICE CARD 4 -->
              <div class="price-card">
                <h3 class="price-card-header"></h3>
                <div class="price">4<span>hrs</span></div>
                <p class="priceli"><strong>Rs. 160</strong></p>
                <label for="4" class="order-btn" style="position: relative">
                  <input type="radio" id="4" name="hour" value="04:00:00" onclick="changeColour('3')" />
                  SELECT
                </label>
              </div>
              <!-- PRICE CARD 5 -->
              <div class="price-card">
                <h3 class="price-card-header"></h3>
                <div class="price">5<span>hrs</span></div>
                <p class="priceli"><strong>Rs. 200</strong></p>
                <label for="5" class="order-btn" style="position: relative">
                  <input type="radio" id="5" name="hour" value="05:00:00" onclick="changeColour('4')" />
                  SELECT
                </label>
              </div>
            </div>

            <div class="button-holder">
              <div class="destination-div">
                <h4 class="destination-label">Destination</h4>
                <div>
                  <input class="inputdesi" name="destination" id="destination" type="text" data-ms-editor="true"
                    style="display: inline-block;font-size: 17px;">
                  <span class="alert-style" id="errorDestination" style="margin-left: 5px"> </span>
                </div>
              </div>
              <!-- PAYMENT BUTTON -->
              <input type="submit" class="submit-desi" value="Pay and Proceed">
            </div>
          </div>
        </div>
      </form>
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
    <script src="Javascript/script.js" type="text/javascript"></script>
    <!--===============================================================================================-->
    <script src="Javascript/priceCard.js"></script>
    <!--===============================================================================================-->
    <script src="Javascript/destinationValidation.js"></script>
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