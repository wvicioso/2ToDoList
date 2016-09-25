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
    })
  });

});
