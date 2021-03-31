// PAYMENT VALIDATION SCRIPT
$("input[name=card-number]").keypress(function () {
  var rawNumbers = $(this).val().replace(/-/g, "");
  var cardLength = rawNumbers.length;
  if (cardLength !== 0 && cardLength <= 12 && cardLength % 4 == 0) {
    $(this).val($(this).val() + "-");
  }
});

function showDiv() {
  if (document.getElementById("creditDebit").checked) {
    document.getElementById("check1").style.border = "1px solid #0078c8";
    document.getElementById("card1").style.display = "flex";
    document.getElementById("check1").style.backgroundColor =
      "  rgba(0, 120, 200,0.2)";
    document.getElementById("check1").style.padding = "15px";
    // -------------------------------------------------------------------------- //
    document.getElementById("check2").style.border = "none";
    document.getElementById("card2").style.display = "none";
    document.getElementById("check2").style.backgroundColor = "transparent";
    document.getElementById("check2").style.padding = "none";
  } else if (document.getElementById("upi").checked) {
    document.getElementById("check2").style.border = "1px solid #0078c8";
    document.getElementById("card2").style.display = "flex";
    document.getElementById("check2").style.backgroundColor =
      "  rgba(0, 120, 200,0.2)";
    document.getElementById("check2").style.padding = "15px";
    // -------------------------------------------------------------------------- //
    document.getElementById("check1").style.border = "none";
    document.getElementById("card1").style.display = "none";
    document.getElementById("check1").style.backgroundColor = "transparent";
    document.getElementById("check1").style.padding = "0px";
  }
}

if (document.getElementById("num").innerText === "1 ") {
  document.getElementById("nump").innerText = "hour";
} else {
  document.getElementById("nump").innerText = "hours";
}

function validate1() {
  if (document.getElementById("creditDebit").checked) {
    var name_on_card = document.getElementById("name_on_card").value;
    var card_number = document.getElementById("card-number").value;
    var month = document.getElementById("month").value;
    var year = document.getElementById("year").value;
    var cvv = document.getElementById("cvv").value;

    if (!name_on_card) {
      document.getElementById("name_on_card").style.border = "2px red solid";
      return false;
    } else {
      document.getElementById("name_on_card").style.border = "1px solid ";
    }
    if (!card_number) {
      document.getElementById("card-number").style.border = "2px red solid";

      return false;
    } else {
      document.getElementById("card-number").style.border = "1px solid ";
    }
    if (!month) {
      document.getElementById("month").style.border = "2px red solid";

      return false;
    } else {
      document.getElementById("month").style.border = "1px solid ";
    }
    if (!year) {
      document.getElementById("year").style.border = "2px red solid";

      return false;
    } else {
      document.getElementById("year").style.border = "1px solid ";
    }
    if (!cvv) {
      document.getElementById("cvv").style.border = "2px red solid";

      return false;
    } else {
      document.getElementById("cvv").style.border = "1px solid ";
    }
    return true;
  } else if (document.getElementById("upi").checked) {
    var cvv = document.getElementById("upi1").value;
    if (!cvv) {
      document.getElementById("upi1").style.border = "2px red solid";
      return false;
    } else {
      document.getElementById("upi1").style.border = "1px  solid";
    }
    return true;
  }
}
