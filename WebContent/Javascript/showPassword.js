// SHOW PASSWORD SCRIPT
(function ($) {
  "use strict";
  var showPass = 0;
  $(".btn-show-pass").on("click", function () {
    if (showPass == 0) {
      $(this).next("input").attr("type", "text");
      $(this).find("i").removeClass("fa-eye");
      $(this).find("i").addClass("fa-eye-slash");
      showPass = 1;
    } else {
      $(this).next("input").attr("type", "password");
      $(this).find("i").removeClass("fa-eye-slash");
      $(this).find("i").addClass("fa-eye");
      showPass = 0;
    }
  });
})(jQuery);
