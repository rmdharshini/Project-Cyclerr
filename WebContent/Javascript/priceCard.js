// PRICE CARD COLOR CHANGE SCRIPT
window.changeColour = function (value) {
  var val = parseInt(value);
  if (value === "0") {
    document.getElementsByClassName("price-card")[val].style.backgroundColor =
      "#0078c8";
    document.getElementsByClassName("price-card")[
      val + 1
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val + 2
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val + 3
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val + 4
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price")[val].style.color = "white";
    document.getElementsByClassName("price")[val + 1].style.color = "#f4511e";
    document.getElementsByClassName("price")[val + 2].style.color = "#f4511e";
    document.getElementsByClassName("price")[val + 3].style.color = "#f4511e";
    document.getElementsByClassName("price")[val + 4].style.color = "#f4511e";
    document.getElementsByClassName("priceli")[val].style.color = "white";
    document.getElementsByClassName("priceli")[val + 1].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 2].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 3].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 4].style.color = "#2d2d2d";
  }
  if (value === "1") {
    document.getElementsByClassName("price-card")[
      val - 1
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[val].style.backgroundColor =
      "#0078c8";

    document.getElementsByClassName("price-card")[
      val + 1
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val + 2
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val + 3
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price")[val - 1].style.color = "#f4511e";
    document.getElementsByClassName("price")[val].style.color = "white";

    document.getElementsByClassName("price")[val + 1].style.color = "#f4511e";
    document.getElementsByClassName("price")[val + 2].style.color = "#f4511e";
    document.getElementsByClassName("price")[val + 3].style.color = "#f4511e";
    document.getElementsByClassName("priceli")[val].style.color = "white";
    document.getElementsByClassName("priceli")[val - 1].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 1].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 2].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 3].style.color = "#2d2d2d";
  }
  if (value === "2") {
    document.getElementsByClassName("price-card")[val].style.backgroundColor =
      "#0078c8";
    document.getElementsByClassName("price-card")[
      val - 1
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val + 1
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val + 2
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val - 2
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price")[val].style.color = "white";
    document.getElementsByClassName("price")[val - 1].style.color = "#f4511e";
    document.getElementsByClassName("price")[val + 1].style.color = "#f4511e";
    document.getElementsByClassName("price")[val - 2].style.color = "#f4511e";
    document.getElementsByClassName("price")[val + 2].style.color = "#f4511e";
    document.getElementsByClassName("priceli")[val].style.color = "white";
    document.getElementsByClassName("priceli")[val - 1].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 1].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val - 2].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 2].style.color = "#2d2d2d";
  }
  if (value === "3") {
    document.getElementsByClassName("price-card")[val].style.backgroundColor =
      "#0078c8";
    document.getElementsByClassName("price-card")[
      val + 1
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val - 1
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val - 2
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val - 3
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price")[val].style.color = "white";
    document.getElementsByClassName("price")[val - 1].style.color = "#f4511e";
    document.getElementsByClassName("price")[val - 2].style.color = "#f4511e";
    document.getElementsByClassName("price")[val - 3].style.color = "#f4511e";
    document.getElementsByClassName("price")[val + 1].style.color = "#f4511e";
    document.getElementsByClassName("priceli")[val].style.color = "white";
    document.getElementsByClassName("priceli")[val - 1].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val - 2].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val - 3].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val + 1].style.color = "#2d2d2d";
  }
  if (value === "4") {
    document.getElementsByClassName("price-card")[val].style.backgroundColor =
      "#0078c8";
    document.getElementsByClassName("price-card")[
      val - 1
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val - 2
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val - 3
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price-card")[
      val - 4
    ].style.backgroundColor = "white";
    document.getElementsByClassName("price")[val].style.color = "white";
    document.getElementsByClassName("price")[val - 1].style.color = "#f4511e";
    document.getElementsByClassName("price")[val - 2].style.color = "#f4511e";
    document.getElementsByClassName("price")[val - 3].style.color = "#f4511e";
    document.getElementsByClassName("price")[val - 4].style.color = "#f4511e";

    document.getElementsByClassName("priceli")[val].style.color = "white";
    document.getElementsByClassName("priceli")[val - 1].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val - 2].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val - 3].style.color = "#2d2d2d";
    document.getElementsByClassName("priceli")[val - 4].style.color = "#2d2d2d";
  }
};
