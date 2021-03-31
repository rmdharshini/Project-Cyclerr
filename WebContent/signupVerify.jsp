<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <title>Cyclerr | India</title>
  <link rel="icon" href="Images/logo/titleLogo.png">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <!--===============================================================================================--> 
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
  <!--===============================================================================================-->
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <!--===============================================================================================-->
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="css/util.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="css/loginSignup.css" />
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="css/otp.css" />
  <!--===============================================================================================-->
</head>

<body>
  <!-- NAV-BAR -->
  <nav class="navbar navbar-default navbar-fixed-top" style="position: sticky">
    <div class="container">
      <div class="navbar-header">
        <a href="home.jsp">
          <img src="Images/logo/headerLogo.png" alt="Logo" style="width: 160px; margin-top: 4px">
        </a>
      </div>
    </div>
  </nav>

  <div class="limiter">
    <div class="container-login100">
      <div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" style="height: 500px; overflow: hidden">
        <!-- OTP FORM -->
        <form class="login100-form validate-form flex-sb flex-w" action="Daopinverify" method="get">
          <span class="login100-form-title p-b-32">
            Cyclerr Verification
          </span>
          <span class="txt1 p-b-0" style="margin: 0 auto">
            Enter the verification code sent your mail
          </span>

          <!-- NUMBER FIELD -->
          <div class="otpCont flex spaceBetween">
            <input class="otSc" type="text" maxlength="1" name="pin1" />
            <input class="otSc" type="text" maxlength="1" name="pin2" />
            <input class="otSc" type="text" maxlength="1" name="pin3" />
            <input class="otSc" type="text" maxlength="1" name="pin4" />
            <input class="otSc" type="text" maxlength="1" name="pin5" />
          </div>
          <span class="focus-input100"></span>

          <!-- VERIFY BUTTTON -->
          <div data-js="opens" class="container-login100-form-btn" style="justify-content: center; margin-top: 10px">
            <button class="login100-form-btn next" style="margin-bottom: 10px; letter-spacing: 2px">
              Verify
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!--===============================================================================================-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--===============================================================================================-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="Javascript/otp.js" type="text/javascript"></script>
  <!--===============================================================================================--> 
  <script src="Javascript/script.js" type="text/javascript"></script>
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