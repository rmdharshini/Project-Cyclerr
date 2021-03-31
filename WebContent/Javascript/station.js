// STATION PAGE SCRIPT
$(window).on("scroll", function () {
  if ($(window).scrollTop() > 435) {
    document.getElementById("heading-nav").style.color = "white";
    document.getElementById("state").style.color = "white";
    document.getElementById("nav").style.backgroundColor =
      "rgba(18, 18, 18, 1)";
  } else {
    document.getElementById("heading-nav").style.color = "#121212";
    document.getElementById("state").style.color = "#121212";
    document.getElementById("nav").style.backgroundColor =
      "rgba(255,255,255,1)";
  }
});

function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
function myFunction() {
  document.getElementById("addressInput").focus();
}

var elements = document.getElementsByClassName("avl-style-span");
console.log(elements.length);
for (var i = 0; i < elements.length; i++) {
  var valueText = document.getElementsByClassName("avl-style-span")[i]
    .innerHTML;
  var value = parseInt(valueText);
  if (value < 4) {
    document.getElementsByClassName("avl-style-span")[i].style.color =
      "#FF0018";
  } else if (value >= 4 && value < 7) {
    document.getElementsByClassName("avl-style-span")[i].style.color =
      "#fdbe39";
  } else {
    document.getElementsByClassName("avl-style-span")[i].style.color =
      "#388230";
  }
  console.log(value);
}
