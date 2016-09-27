$(document).ready(function() {
  $('#newList').find('a').click(function(e) {
    e.preventDefault();
    var path = $(event.target).attr('href');
    var request = $.ajax({
      method: 'get',
      url: path
    })
    request.done(function(response) {
      $('#profile').after(response);
    })
  })
});
