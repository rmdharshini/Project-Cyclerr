// LOGIN VALIDATION SCRIPT
$(function () {
  $("#emailAlert").hide();
  $("#passAlert").hide();

  var error_email = false;
  var error_password = false;

  $("#email").keyup(function () {
    check_email();
  });
  $("#password").keyup(function () {
    check_password();
  });

  function check_email() {
    var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    var email = $("#email").val();
    if (pattern.test(email) && email !== "") {
      $("#emailAlert").hide();
    } else if (email === "") {
      $("#emailAlert").html("This field is required");
      $("#emailAlert").show();
      error_email = true;
    } else {
      $("#emailAlert").html("Valid email is required");
      $("#emailAlert").show();
      error_email = true;
    }
  }

  function check_password() {
    var passPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
    var password = $("#password").val();
    if (passPattern.test(password) && password !== "") {
      $("#passAlert").hide();
    } else if (password === "") {
      $("#passAlert").html("This field is required");
      $("#passAlert").show();
      error_password = true;
    } else {
      $("#passAlert").html(
        "Valid password is required <br> [ Password should be 8 character long and should contain uppercase, lowercase, number and special character ]"
      );
      $("#passAlert").show();
      error_password = true;
    }
  }

  $("#login").submit(function () {
    error_email = false;
    error_password = false;

    check_email();
    check_password();

    if (error_email === false && error_password === false) {
      return true;
    } else {
      return false;
    }
  });
});
