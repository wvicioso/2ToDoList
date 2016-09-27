$(document).ready(function() {
  $("#add-list-form").on('submit', function(event){
    event.preventDefault();
    // debugger;
    var data = $(this).serialize();
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    // debugger;
    $.ajax({
      type: method,
      url: url, 
      data: data
    }).done(function(response){
      // debugger;
      $(".list-list").after(response);
    }).fail(function(response){
      // debugger;
      console.log(response);
    })  

  });
});
