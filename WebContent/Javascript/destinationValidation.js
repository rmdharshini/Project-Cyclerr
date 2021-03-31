// CYCLE COUNTER AND DESTINATION ERROR SCRIPT
$(".count").counterUp({ delay: 10, time: 1400 });

function validate1() {
  var hour = document.cycle.hour.value;
  var destination = document.cycle.destination.value;
  if (hour == "") {
    document.getElementById("error").innerHTML =
      "Select the No.of Hours to ride";
    document.getElementById("error").style.color = "red";

    return false;
  }
  if (destination == "") {
    document.getElementById("error").innerHTML = "Enter the destination";
    document.getElementById("error").style.color = "red";

    return false;
  }
  return true;
}

$(function () {
  $("#errorDestination").hide();
  $("#errorTime").hide();
  var error_destination = false;
  var error_time = false;

  function check_destination() {
    var pattern = /^[a-zA-Z]*$/;
    var desti = $("#destination").val();
    if (pattern.test(desti) && desti !== "") {
      $("#errorDestination").hide();
    } else {
      $("#errorDestination").html("Destination is required");
      $("#errorDestination").show();
      error_destination = true;
    }
  }

  function check_time() {
    if (!$("input[name='hour']:checked").val()) {
      $("#errorTime").html("Select a time duration");
      $("#errorTime").show();
      error_time = true;
    } else {
      $("#errorTime").hide();
      error_time = false;
    }
  }
  $("#card").submit(function () {
    error_time = false;
    error_destination = false;

    check_time();
    check_destination();

    if (error_time === false && error_destination === false) {
      return true;
    } else {
      return false;
    }
  });
});
