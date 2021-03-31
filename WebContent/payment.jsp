<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Cyclerr | India </title>
  <link rel="icon" href="Images/logo/titleLogo.png">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
  <!--===============================================================================================-->
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/style.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="css/payment.css" />
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
              <c:otherwise><button type="button" data-js="open" onclick="location.href='logout';" disabled="disabled"
                  style="display:none">LOGOUT</c:otherwise>
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
  <!-- PAYMENT CONTAINER -->
  <div class="payment-main-container-holder">
    <div class="payment-container" style=" margin-bottom: 50px">

      <!-- SECTION-1 -->
      <div class="sec1-checkout">
        <h1 class="checkout-heading-label">Booking Details</h1>
        <hr />
        <div class="div-holder">
          <div class="checkout-content-label checkout-label-style">
            <h4 class="checkout-style-h4">Bicycle ID</h4>
            <h1 class="checkout-style-h1-orange">${cycleid}</h1>
          </div>
          <div class="checkout-start-label checkout-label-style">
            <h4 class="checkout-style-h4">Start Station</h4>
            <h1 class="checkout-style-h1">${station}</h1>
          </div>
          <div class="checkout-end-label checkout-label-style">
            <h4 class="checkout-style-h4">End Station</h4>
            <h1 class="checkout-style-h1">${destination}</h1>
          </div>
          <div class="checkout-time-label checkout-label-style">
            <h4 class="checkout-style-h4">Duration</h4>
            <h1 class="checkout-style-h1"><span id="num">${hour1}</span> <span id="nump">hours</span></h1>
          </div>
          <div class="checkout-price-label checkout-label-style">
            <h4 class="checkout-style-h4">Price</h4>
            <h1 class="checkout-style-h1"><span>Rs.</span>${cost}</h1>
          </div>
        </div>
        <hr />
      </div>

      <!-- SECTION-2 -->
      <div class="sec2-payment-method">
        <div class="payment-heading">
          <h1>Select a Payment Method</h1>
        </div>
        <div class="payment-option">
          <div class="check1" id="check1">
            <input type="radio" name="pay" class="payment-option-ip" id="creditDebit" value="pay"
              onclick="showDiv();" />

            <label for="creditDebit">Credit or Debit Card</label>
            <div class="card-logo">
              <img src="Images/paymentPage/card.PNG" alt="card" height="45px" style="padding-left: 20px" />
            </div>
            <div class="card" id="card1" style="display: none">
              <div class="card-inner-sec">
                <span class="card-label"> Name On Card </span>
                <div class="card-input">
                  <input type="text" id="name_on_card" />
                </div>
              </div>
              <div class="card-inner-sec">
                <span class="card-label"> Card Number </span>
                <div class="card-input">
                  <input type="text" maxlength="19" id="card-number"
                    onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                </div>
              </div>
              <div class="card-inner-sec">
                <span class="card-label"> Expiry Date</span>
                <div class="card-input">
                  <select id="month">
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                  </select>
                  <select id="year">
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                    <option value="2031">2031</option>
                    <option value="2032">2032</option>
                    <option value="2033">2033</option>
                    <option value="2034">2034</option>
                    <option value="2035">2035</option>
                    <option value="2036">2036</option>
                    <option value="2037">2037</option>
                    <option value="2038">2038</option>
                    <option value="2039">2039</option>
                    <option value="2040">2040</option>
                    <option value="2041">2041</option>
                  </select>
                </div>
              </div>
              <div class="card-inner-sec">
                <span class="card-label"> CVV </span>
                <div class="card-input">
                  <div class="cvv">
                    <span class="btn-show-pass">
                      <i class="fa fa-eye"></i>
                    </span>
                    <input type="password" id="cvv" maxlength="3"
                      onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                    <img src="Images/paymentPage/cvv.png" alt="cvv" />
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="check2" id="check2">
            <input type="radio" name="pay" class="payment-option-ip" id="upi" value="pay" onclick="showDiv();" />
            <label for="upi" style="margin-bottom: 0;">UPI Apps</label>
            <div class="card" id="card2" style="display: none">
              <div class="card-inner-sec">
                <span class="card-label"> ENTER YOUR UPI ID </span>
                <div class="card-input">
                  <input type="text" id="upi1" placeholder="Ex: MobileNumber@upi" style="width: 330px" />
                </div>
              </div>
            </div>
          </div>
          <h1 id="error"></h1>
        </div>
      </div>
      <!-- PAY BUTTON -->
      <form action="Daopay" onsubmit="return validate1()">
        <input type="submit" class="submit-desi" value="Pay">
      </form>
    </div>
  </div>
  <!--===============================================================================================-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--===============================================================================================-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.min.js" integrity="sha512-d8F1J2kyiRowBB/8/pAWsqUl0wSEOkG5KATkVV4slfblq9VRQ6MyDZVxWl2tWd+mPhuCbpTB4M7uU/x9FlgQ9Q==" crossorigin="anonymous"></script>
  <!--===============================================================================================-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js" integrity="sha512-ZKNVEa7gi0Dz4Rq9jXcySgcPiK+5f01CqW+ZoKLLKr9VMXuCsw3RjWiv8ZpIOa0hxO79np7Ec8DDWALM0bDOaQ==" crossorigin="anonymous"></script>
  <!--===============================================================================================-->
  <script src="Javascript/script.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/payment.js"></script>
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