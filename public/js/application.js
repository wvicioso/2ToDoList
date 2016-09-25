$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.container').on('submit', '.add-list-button', function (event) {
    event.preventDefault();
    if ($('.create-list-button').length) {
      $(event.target).hide();
      $('.create-list-button').show();
    } else {
      $.ajax({
        url: $(event.target).attr('action'),
        method: $(event.target).attr('method')
      }).done (function(response) {
        $(event.target).hide();
        $(event.target).after(response);
      });
    };
  });

  $('.container').on('submit', '.create-list-button', function (event) {
    event.preventDefault();
    var newListData = $(event.target).serialize();
    $.ajax({
      url: $(event.target).attr('action'),
      method: $(event.target).attr('method'),
      data: newListData
    }).done (function(response) {
      $('#all-lists').append(response);
      $(event.target).trigger('reset');
      $(event.target).hide();
      $('.add-list-button').show();
    });
  });


});
