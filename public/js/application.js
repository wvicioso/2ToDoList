$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.container').on('submit', '.add-list-button', function (event) {
    event.preventDefault();
    if ($('.create-list-form').length) {
      $(event.target).hide();
      $('.container').find('.create-list-form').show();
    } else {
      var url = $(this).attr('action');
      var method = $(this).attr('method');
      $.ajax({
        url: url,
        method: method
      }).done( function(response) {
        $('.add-list-button').hide();
        $(event.target).after(response);
      });
    };
  });

  $('.container').on('submit', '.create-list-form', function(event) {
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serialize();
    event.preventDefault();
    $.ajax({
      url: url,
      method: method,
      data: data
    }).done( function(response) {
        $('#all-lists').prepend(response);
        $(event.target).trigger('reset');
        $(event.target).hide();
        $('.add-list-button').show();
    }).fail( function (response) {
      console.log(response);
    })
  });

  $('.container').on('submit', '.delete-task-button', function(event) {
    event.preventDefault();
    var url = $(this).attr('action');
    var method = $(this).find('.hidden-method').attr('value');
    $.ajax({
      url: url,
      method: method
    }).done( function () {
    $(event.target).parent().remove();
  });
});

$('.container').on('submit', '.edit-task-button', function(event) {
  event.preventDefault();
  var url = $(this).attr('action');
  var method = $(this).attr('method');
  $.ajax({
    url: url,
    method: method
  }).done( function (response) {
    $(event.target).hide();
    $(event.target).after(response);
  })
})


});
