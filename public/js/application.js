$(document).ready(function() {


  // Get new list AJAX function
  $('.list-new-button a').on('click', function(event){
    event.preventDefault();

    $('.new-list-form').remove();
    $.ajax({
      method: 'GET',
      url: $('#create-new-list').find('a').attr('href')
    }).done(function(response){

      $('.container').append(response);
    });
  });

  // Post new list AJAX function
  $('.container').on('submit','.new-list-form', function(event){
    event.preventDefault();

    $.ajax({
      method: $(event.target).attr('method'),
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()
    }).done(function(response){
      $('.list-form-wrapper').remove();
      $('table').append('<tr>'+response+'</tr>');
    });
  });


// Get new task AJAX function
  $('#task-button a').on('click', function(event){
    event.preventDefault();
    // $('.new-list-form').remove();
    $.ajax({
      method: 'GET',
      url: $(event.target).attr('href')
    }).done(function(response){
      $('.container').append(response);
    });
  });

  // Post new task AJAX function
  $('.container').on('submit','.dbc', function(event){
    event.preventDefault();
    $.ajax({
      method: $(event.target).attr('method'),
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()
    }).done(function(response){
      $('.task-form-wrapper').remove();
      $('table').append('<tr>'+response+'</tr>');
    });
  });

  // Delete task AJAX function
  $('.container').on('submit','tr #delete-task', function(event) {
    event.preventDefault();
    $.ajax({
      method: $(event.target).find('input').attr('value'),
      url: $(event.target).attr('action')
    }).done(function(response){
      if (response === "true") {
        $(event.target).parent().parent().remove();
      }
    });
  });


  // Delete list task AJAX function
  $('.container').on('submit','tr #delete-list', function(event) {
    event.preventDefault();
    $.ajax({
      method: $(event.target).find('input').attr('value'),
      url: $(event.target).attr('action')
    }).done(function(response){
      if (response === "true") {
        $(event.target).parent().parent().remove();
      }
    });
  });

});
