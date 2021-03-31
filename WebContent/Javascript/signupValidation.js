// SIGN UP VALIDATION SCRIPT
$(function () {
  $("#name_error").hide();
  $("#num_error").hide();
  $("#email_error").hide();
  $("#pass_error").hide();
  $("#rpass_error").hide();

  var error_name = false;
  var error_num = false;
  var error_email = false;
  var error_pass = false;
  var error_rpass = false;

  $("#fullname").keyup(function () {
    check_name();
  });

  $("#mobile").keyup(function () {
    check_num();
  });

  $("#mail").keyup(function () {
    check_email();
  });

  $("#word").keyup(function () {
    check_pass();
  });

  $("#cword").keyup(function () {
    check_rpass();
  });

  function check_name() {
    var pattern = /^[a-zA-Z]*$/;
    var fname = $("#fullname").val();
    if (pattern.test(fname) && fname !== "") {
      $("#name_error").hide();
    } else if (fname === "") {
      $("#name_error").html("This field is required");
      $("#name_error").show();
      error_name = true;
    } else {
      $("#name_error").html("Valid name is required");
      $("#name_error").show();
      error_name = true;
    }
  }

  function check_num() {
    var numpattern = /^[6-9]\d{9}$/;
    var numM = $("#mobile").val();
    if (numpattern.test(numM) && numM !== "") {
      $("#num_error").hide();
    } else if (numM === "") {
      $("#num_error").html("This field is required");
      $("#num_error").show();
      error_num = true;
    } else {
      $("#num_error").html("Valid number is required");
      $("#num_error").show();
      error_num = true;
    }
  }

  function check_email() {
    var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    var email = $("#mail").val();
    if (pattern.test(email) && email !== "") {
      $("#email_error").hide();
    } else if (email === "") {
      $("#email_error").html("This field is required");
      $("#email_error").show();
      error_email = true;
    } else {
      $("#email_error").html("Valid email is required");
      $("#email_error").show();
      error_email = true;
    }
  }

  function check_pass() {
    var passPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
    var password = $("#word").val();
    if (passPattern.test(password) && password !== "") {
      $("#pass_error").hide();
    } else if (password === "") {
      $("#pass_error").html("This field is required");
      $("#pass_error").show();
      error_pass = true;
    } else {
      $("#pass_error").html(
        "Valid password is required <br> [ Password should be 8 character long and should contain uppercase, lowercase, number and special character ]"
      );
      $("#pass_error").show();
      error_pass = true;
    }
  }

  function check_rpass() {
    var password = $("#word").val();
    var re_password = $("#cword").val();
    if (re_password === "") {
      $("#rpass_error").html("This field is required");
      $("#rpass_error").show();
      error_rpass = true;
    } else if (password !== re_password) {
      $("#rpass_error").html("Passwords do not match");
      $("#rpass_error").show();
      error_rpass = true;
    } else {
      $("#rpass_error").hide();
    }
  }

  $("#signupForm").submit(function () {
    error_name = false;
    error_num = false;
    error_email = false;
    error_pass = false;
    error_rpass = false;

    check_name();
    check_num();
    check_email();
    check_pass();
    check_rpass();

    if (error_name === false && error_num === false && error_email === false && error_pass === false && error_rpass === false) {

      return true;
    } else {

      return false;
    }
  });
});