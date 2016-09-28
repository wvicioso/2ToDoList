$(document).ready(function() {
  $('#completeButton').addClass('hidden');
  $('#newList').find('a').click(function(e) {
    e.preventDefault();
    var path = $(e.target).attr('href');
    var request = $.ajax({
      method: 'get',
      url: path
    })
    request.done(function(response) {
      $('#updateList').remove();
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
      $('#updateList').remove();
      $('#listDisplay').append(response);
    })
    request.fail(function() {
      alert("Please enter a title for your new list!")
    })
  })
  $('.addable').click(function(e) {
    e.preventDefault();
    var path = $(e.target).attr('href');
    var request = $.ajax({
      method: 'get',
      url: path
    })
    request.done(function(response){
      $('#updateTask').remove();
      $('#todoDisplay').after(response);
    })
  })
  $('#wrapper').on('submit', '#newTaskForm', function(e) {
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
      $('#updateTask').remove();
      $('.addable').before(response);
    })
  })
  $('#tasks').on('click', '.checkbox', function(e){
    e.preventDefault();
    var obj = {}
    var taskId = $(e.target).attr('name');
    var $thisButton = $(e.target)
    obj[taskId] = "on"
    var data = $.param(obj);
    var path = $('#tasks').attr('action');
    var request = $.ajax ({
      method: 'put',
      url: path,
      data: data
    })
    request.done(function(response) {
      $thisButton.prop('checked', true, 'disabled', true);
      $thisButton.siblings('a').remove();
      $('#' + taskId).append(response);
    })
  })
  $('#todoDisplay').on('click', '.deletable', function(e){
    e.preventDefault();
    var url = $(e.target).attr('href');
    var path = url.slice(0,-7);
    var $thisTask = $(e.target)
    var request = $.ajax({
      method: 'delete',
      url: path,
    })
    request.done(function(){
      $thisTask.closest('.taskDisplay').remove();
    })
  })
});
