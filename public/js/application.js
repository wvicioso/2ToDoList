$(document).ready(function() {
  $(".new-task").submit( function(event) {
    event.preventDefault();
    var url=$(this).attr("action")
    var data = $(this).serialize();

    $.ajax({
      url: url,
      method: "POST",
      data: data
    }).done( function(response) {
      // debugger;
      $(".task-list").append(response);
      $(event.target).children("input").first().val("");
    });
  });

  $(".task-list").on("click", ".mark-complete", function(event) {
    event.preventDefault();
    var url=$(event.target).attr("href");

    $.ajax({
      url: url,
      method: "GET"
    }).done( function(response) {
      $(event.target).hide();
      $(event.target).parent().children("span").append(response);
    });
  });

  $(".task-list").on("click", ".task-delete", function(event) {
    event.preventDefault();
    var url=$(event.target).attr("href");

    $.ajax ({
      url: url,
      method: "GET"
    }).done( function(response) {
      // debugger;
      $(event.target).parent().hide();
    });
  });

  $(".new-list").submit( function(event) {
    event.preventDefault();
    var url=$(this).attr("action");
    var data = $(this).serialize();
    //   debugger;
    $.ajax({
      url: url,
      method: "POST",
      data: data
    }).done( function(response) {
      $(".user-list-titles").append(response);
      $(event.target).children("input").first().val("");
    });
  });

});
