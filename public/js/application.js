$(document).ready(function() {

  $('.container').on('click', '#deleteButton', function() {
    
    // event.preventDefault();

    var url = $(this).attr('action');
    // debugger;

    $.ajax({
      url: url,
      method: 'DELETE'
    }).done(function(response) {

      // debugger;
    })
  });
});
