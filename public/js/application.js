$(document).ready(function() {
  $('#newList').find('a').click(function(e) {
    e.preventDefault();
    var path = $(e.target).attr('href');
    var request = $.ajax({
      method: 'get',
      url: path
    })
    request.done(function(response) {
      $('#profile').after(response);
    })
  })
  $('#wrapper').on('submit', '#newListForm', function(e){
    e.preventDefault();
    var method = $(e.target).attr('method');
    var path = $(e.target).attr('action');
    var data = $(e.target).serialize();
    var request = $.ajax ({
      method: method,
      url: path,
      data: data
    })
    request.done(function(response) {
      $('#listDisplay').append(response);
    })
  })
});
