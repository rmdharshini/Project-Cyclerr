// SEARCH-BAR AUTOCOMPLETE SCRIPT
(function ($) {
  $.fn.autocomplete = function (params) {
    //Selections
    var currentSelection = -1;
    var currentProposals = [];

    //Default parameters
    params = $.extend(
      {
        hints: [],
        placeholder: "Search City",
        width: 360,
        height: 22,
        showButton: true,
        buttonText:
          ' <form name ="myvalue" action="Daostation" method="get"> <input type="image" class="search-icon" name="submit" src="../Images/homePage/searchIcon.svg" border="0" alt="Submit" style="width: 35px;" /><br><input type="text" name="test" style="display:none;"/></form>',
        onSubmit: function (text) {},
        onBlur: function () {},
      },
      params
    );
    //Build messagess
    this.each(function () {
      //Container
      var searchContainer = $("<div></div>")
        .addClass("autocomplete-container")
        .css("height", params.height * 2);

      //Text input
      var input = $(
        '<input type="text" id="addressInput" autocomplete="off" name="query">'
      )
        .attr("placeholder", params.placeholder)
        .addClass("autocomplete-input")
        .css({
          width: params.width,
          height: params.height,
        });

      if (params.showButton) {
        input.css("border-radius", "3px 0 0 3px");
      }

      //Proposals
      var proposals = $("<div></div>")
        .addClass("proposal-box")
        .css("width", "700px")
        .css("top", "70.9%")
        .css("margin-top", "8.4px");

      var proposalList = $("<ul></ul>").addClass("proposal-list");

      proposals.append(proposalList);

      input.keydown(function (e) {
        switch (e.which) {
          case 38: // Up arrow
            e.preventDefault();
            $("ul.proposal-list li").removeClass("selected");
            if (currentSelection - 1 >= 0) {
              currentSelection--;
              $("ul.proposal-list li:eq(" + currentSelection + ")").addClass(
                "selected"
              );
            } else {
              currentSelection = -1;
            }
            break;
          case 40: // Down arrow
            e.preventDefault();
            if (currentSelection + 1 < currentProposals.length) {
              $("ul.proposal-list li").removeClass("selected");
              currentSelection++;
              $("ul.proposal-list li:eq(" + currentSelection + ")").addClass(
                "selected"
              );
            }
            break;
          case 13: // Enter
            if (currentSelection > -1) {
              var text = $(
                "ul.proposal-list li:eq(" + currentSelection + ")"
              ).html();
              input.val(text);
            }
            currentSelection = -1;
            proposalList.empty();
            params.onSubmit(input.val());
            document.myvalue.test.value = input.val();
            break;
          case 27: // Esc button
            currentSelection = -1;
            proposalList.empty();
            input.val("");
            break;
        }
      });

      input.bind("paste keyup", function (e) {
        if (e.which != 13 && e.which != 27 && e.which != 38 && e.which != 40) {
          currentProposals = [];
          currentSelection = -1;
          proposalList.empty();
          if (input.val() != "") {
            //var word = "^" + input.val() + ".*";
            var word = input.val();
            var reg = new RegExp(word);
            proposalList.empty();
            for (var test in params.hints) {
              //if(params.hints[test].match(word)){
              if (reg.test(params.hints[test])) {
                currentProposals.push(params.hints[test]);
                var element = $("<li></li>")
                  .html(params.hints[test])
                  .addClass("proposal")
                  .click(function () {
                    input.val($(this).html());
                    proposalList.empty();
                    params.onSubmit(input.val());
                    document.myvalue.test.value = input.val();
                  })
                  .mouseenter(function () {
                    $(this).addClass("selected");
                  })
                  .mouseleave(function () {
                    $(this).removeClass("selected");
                  });
                proposalList.append(element);
              }
            }
          }
        }
      });

      input.blur(function (e) {
        currentSelection = -1;
        //proposalList.empty();
        params.onBlur();
      });

      searchContainer.append(input);
      searchContainer.append(proposals);

      if (params.showButton) {
        //Search button
        var button = $("<div></div>")
          .addClass("autocomplete-button")
          .html(params.buttonText)
          .css({
            height: "71%",
            width: "55px",
            "line-height": params.height + "px",
          })
          .click(function () {
            proposalList.empty();

            params.onSubmit(input.val());
            document.myvalue.test.value = input.val();
          });
        searchContainer.append(button);
      }

      $(this).append(searchContainer);

      if (params.showButton) {
        //Width fix
        // searchContainer.css('width',0);
      } else {
        // searchContainer.css('width', 0);
      }
    });

    return this;
  };
})(jQuery);
