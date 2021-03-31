<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="css/specificStation.css">
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

    <!-- AVAILABILITY CONTAINER-->
    <div class="specific-station">
      <div class="specific-station-label">
        <div class="specific-inner-sec1">
          <div class="content-section">
            <h1 class="station-heading-id">${sid}</h1>
            <h1 class="station-name">${station}</h1>
            <h2>${city1}</h2>
          </div>
          <div class="image-sec"></div>
        </div>
        <div class="container-2">
          <div class="specific-inner-container-sec2">
            <!-- ROW - 1 -->
            <div class="row-1">
              <!-- 0 -->
              <c:choose>
                <c:when test="${not empty cid0}">
                  <div class="btn2 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
                </c:when>
                <c:otherwise>
                  <div class="btn2 btn-style btn-basic"
                    style="pointer-events:none; background-color: rgba(204,204,204,0.5);"> <i
                      class="fa fa-bicycle fa-5x color-i-disabled"></i>
                </c:otherwise>
              </c:choose>

              <c:choose>
                <c:when test="${not empty cid0}">
                  <div class="cycle-id-basic cycle-id" style="background-color:white; ">
                </c:when>
                <c:otherwise>
                  <div class="cycle-id-basic cycle-id" style="background-color: #666666; height: 40px;">
                </c:otherwise>
              </c:choose>
              <c:choose>
                <c:when test="${not empty cid0}">
                  <h3 class="cycle-id-label">
                    <form action="Daocycle"><input type="submit" name="cid" value="${cid0 }"></form>
                </c:when>
                <c:otherwise>
                  <h3 class="cycle-id-label">
                    <form><input type="submit" value="${cid0 }"
                        style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px">
                    </form>
                </c:otherwise>
              </c:choose>
              </h3>
            </div>
          </div>
          <!-- 1 -->
          <c:choose>
            <c:when test="${not empty cid1}">
              <div class="btn2 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
            </c:when>
            <c:otherwise>
              <div class="btn2 btn-style btn-basic"
                style="pointer-events:none; background-color: rgba(204,204,204,0.5);"> <i
                  class="fa fa-bicycle fa-5x color-i-disabled"></i>
            </c:otherwise>
          </c:choose>
          <c:choose>
            <c:when test="${not empty cid1}">
              <div class="cycle-id-basic cycle-id" style="background-color:white; ">
            </c:when>
            <c:otherwise>
              <div class="cycle-id-basic cycle-id" style="background-color: #666666; height: 40px;">
            </c:otherwise>
          </c:choose>
          <c:choose>
            <c:when test="${not empty cid1}">
              <h3 class="cycle-id-label">
                <form action="Daocycle"><input type="submit" name="cid" value="${cid1 }"></form>
            </c:when>
            <c:otherwise>
              <h3 class="cycle-id-label">
                <form><input type="submit" value="${cid1 }"
                    style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px">
                </form>
            </c:otherwise>
          </c:choose>
          </h3>
        </div>
      </div>
      <!-- 2 -->
      <c:choose>
        <c:when test="${not empty cid2}">
          <div class="btn3 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
        </c:when>
        <c:otherwise>
          <div class="btn3 btn-style btn-basic"
            style="pointer-events:none; background-color: rgba(204,204,204,0.5);"> <i
              class="fa fa-bicycle fa-5x color-i-disabled"></i>
        </c:otherwise>
      </c:choose>
      <c:choose>
        <c:when test="${not empty cid2}">
          <div class="cycle-id-basic cycle-id" style="background-color:white; ">
        </c:when>
        <c:otherwise>
          <div class="cycle-id-basic cycle-id" style="background-color: #666666;height: 40px;">
        </c:otherwise>
      </c:choose>
      <c:choose>
        <c:when test="${not empty cid2}">
          <h3 class="cycle-id-label">
            <form action="Daocycle"><input type="submit" name="cid" value="${cid2 }"></form>
        </c:when>
        <c:otherwise>
          <h3 class="cycle-id-label">
            <form><input type="submit" value="${cid2 }"
                style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px"></form>
        </c:otherwise>
      </c:choose>
      </h3>
    </div>
    </div>
    <!-- 3 -->
    <c:choose>
      <c:when test="${not empty cid3}">
        <div class="btn4 btn-style btn-basic btn-hover"><i class="fa fa-bicycle fa-5x color-i"></i>
      </c:when>
      <c:otherwise>
        <div class="btn4 btn-style btn-basic" style="pointer-events:none; background-color: rgba(204,204,204,0.5);">
          <i class="fa fa-bicycle fa-5x color-i-disabled"></i>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid3}">
        <div class="cycle-id-basic cycle-id" style="background-color:white; ">
      </c:when>
      <c:otherwise>
        <div class="cycle-id-basic cycle-id" style="background-color: #666666;height: 40px;">
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid3}">
        <h3 class="cycle-id-label">
          <form action="Daocycle"><input type="submit" name="cid" value="${cid3 }"
              style="color:white; background-color:#0078C8;border-style:none; width:205px; height: 40px"></form>
      </c:when>
      <c:otherwise>
        <h3 class="cycle-id-label">
          <form><input type="submit" value="${cid3 }"
              style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px"></form>
      </c:otherwise>
    </c:choose>
    </h3>
    </div>
    </div>
    <!-- 4 -->
    <c:choose>
      <c:when test="${not empty cid4}">
        <div class="btn5 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
      </c:when>
      <c:otherwise>
        <div class="btn5 btn-style btn-basic" style="pointer-events:none;background-color:rgba(204,204,204,0.5);;">
          <i class="fa fa-bicycle fa-5x color-i-disabled"></i>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid4}">
        <div class="cycle-id-basic cycle-id" style="background-color:white; ">
      </c:when>
      <c:otherwise>
        <div class="cycle-id-basic cycle-id" style="background-color: #666666;height: 40px;">
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid4}">
        <h3 class="cycle-id-label">
          <form action="Daocycle"><input type="submit" name="cid" value="${cid4 }"
              style="color:white; background-color:#0078C8;border-style:none; width:205px; height: 40px"></form>
      </c:when>
      <c:otherwise>
        <h3 class="cycle-id-label">
          <form><input type="submit" value="${cid4 }"
              style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px"></form>
      </c:otherwise>
    </c:choose>
    </h3>
    </div>
    </div>
    </div>

    <!-- ROW-2 -->
    <div class="row-2">
      <!-- 5 -->
      <c:choose>
        <c:when test="${not empty cid5}">
          <div class="btn6 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
        </c:when>
        <c:otherwise>
          <div class="btn6 btn-style btn-basic"
            style="pointer-events:none;background-color: rgba(204,204,204,0.5);"> <i
              class="fa fa-bicycle fa-5x color-i-disabled"></i>
        </c:otherwise>
      </c:choose>
      <c:choose>
        <c:when test="${not empty cid5}">
          <div class="cycle-id-basic cycle-id" style="background-color:white; ">
        </c:when>
        <c:otherwise>
          <div class="cycle-id-basic cycle-id" style="background-color: #666666;height: 40px;">
        </c:otherwise>
      </c:choose>
      <c:choose>
        <c:when test="${not empty cid5}">
          <h3 class="cycle-id-label">
            <form action="Daocycle"><input type="submit" name="cid" value="${cid5}"
                style="color:white; background-color:#0078C8;border-style:none; width:205px; height: 40px"></form>
        </c:when>
        <c:otherwise>
          <h3 class="cycle-id-label">
            <form><input type="submit" value="${cid5 }"
                style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px"></form>
        </c:otherwise>
      </c:choose>
      </h3>
    </div>
    </div>
    <!-- 6 -->
    <c:choose>
      <c:when test="${not empty cid6}">
        <div class="btn7 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
      </c:when>
      <c:otherwise>
        <div class="btn7 btn-style btn-basic" style="pointer-events:none;background-color: rgba(204,204,204,0.5);">
          <i class="fa fa-bicycle fa-5x color-i-disabled"></i>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid6}">
        <div class="cycle-id-basic cycle-id" style="background-color:white; ">
      </c:when>
      <c:otherwise>
        <div class="cycle-id-basic cycle-id" style="background-color: #666666;height: 40px;">
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid6}">
        <h3 class="cycle-id-label">
          <form action="Daocycle"><input type="submit" name="cid" value="${cid6}"
              style="color:white; background-color:#0078C8;border-style:none; width:205px; height: 40px"></form>
      </c:when>
      <c:otherwise>
        <h3 class="cycle-id-label">
          <form><input type="submit" value="${cid6 }"
              style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px"></form>
      </c:otherwise>
    </c:choose>
    </h3>
    </div>
    </div>
    <!-- 7 -->
    <c:choose>
      <c:when test="${not empty cid7}">
        <div class="btn8 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
      </c:when>
      <c:otherwise>
        <div class="btn8 btn-style btn-basic" style="pointer-events:none;background-color: rgba(204,204,204,0.5);">
          <i class="fa fa-bicycle fa-5x color-i-disabled"></i>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid7}">
        <div class="cycle-id-basic cycle-id" style="background-color:white; ">
      </c:when>
      <c:otherwise>
        <div class="cycle-id-basic cycle-id" style="background-color: #666666;height: 40px;">
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid7}">
        <h3 class="cycle-id-label">
          <form action="Daocycle"><input type="submit" name="cid" value="${cid7 }"
              style="color:white; background-color:#0078C8;border-style:none; width:205px; height: 40px"></form>
      </c:when>
      <c:otherwise>
        <h3 class="cycle-id-label">
          <form><input type="submit" value="${cid7 }"
              style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px"></form>
      </c:otherwise>
    </c:choose>
    </h3>
    </div>
    </div>
    <!-- 8 -->
    <c:choose>
      <c:when test="${not empty cid8}">
        <div class="btn9 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
      </c:when>
      <c:otherwise>
        <div class="btn9 btn-style btn-basic" style="pointer-events:none;background-color: rgba(204,204,204,0.5);">
          <i class="fa fa-bicycle fa-5x color-i-disabled"></i>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid8}">
        <div class="cycle-id-basic cycle-id" style="background-color:white; ">
      </c:when>
      <c:otherwise>
        <div class="cycle-id-basic cycle-id" style="background-color: #666666;height: 40px;">
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid8}">
        <h3 class="cycle-id-label">
          <form action="Daocycle"><input type="submit" name="cid" value="${cid8 }"
              style="color:white; background-color:#0078C8;border-style:none; width:205px; height: 40px"></form>
      </c:when>
      <c:otherwise>
        <h3 class="cycle-id-label">
          <form><input type="submit" value="${cid8 }"
              style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px"></form>
      </c:otherwise>
    </c:choose>
    </h3>
    </div>
    </div>
    <!-- 9 -->
    <c:choose>
      <c:when test="${not empty cid9}">
        <div class="btn10 btn-style btn-basic btn-hover"> <i class="fa fa-bicycle fa-5x color-i"></i>
      </c:when>
      <c:otherwise>
        <div class="btn10 btn-style btn-basic" style="pointer-events:none;background-color: rgba(204,204,204,0.5);">
          <i class="fa fa-bicycle fa-5x color-i-disabled"></i>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid9}">
        <div class="cycle-id-basic cycle-id" style="background-color:white; ">
      </c:when>
      <c:otherwise>
        <div class="cycle-id-basic cycle-id" style="background-color: #666666;height: 40px;">
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${not empty cid9}">
        <h3 class="cycle-id-label">
          <form action="Daocycle"><input type="submit" name="cid" value="${cid9 }"
              style="color:white; background-color:#0078C8;border-style:none; width:205px; height: 40px"></form>
      </c:when>
      <c:otherwise>
        <h3 class="cycle-id-label">
          <form><input type="submit" value="${cid9 }"
              style="color:white; background-color:#666666;border-style:none; width:185px; height: 30px"></form>
      </c:otherwise>
    </c:choose>
    </h3>
    </div>
    </div>
    </div>
    </div>
    <!-- SECTION - 3 -->
    <div class="specific-inner-container-sec3">
      <div class="not-selected"></div>
      <h2 class="content">N/A</h2>
      <div class="selected"></div>
      <h2 class="content">Selected</h2>
      <div class="booked"></div>
      <h2 class="content">Booked</h2>
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