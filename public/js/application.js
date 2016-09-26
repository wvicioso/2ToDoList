$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.new_list_form').submit(function(event){
    event.preventDefault();
    that = this
    var formData = $(this).serialize();
    $.ajax({
      url:  $(that).attr('action'),
      method: $(that).attr('method'),
      data: formData
    }).done(function(response){
      $(that).closest('.create_list_container').next().append(response)
    })
  })
  $('.delete_list_form').submit(function(event){
    event.preventDefault();
    debugger
    that = this
    $.ajax({
      url:  $(that).attr('action'),
      method: $(that).first('input').attr('action')
    }).done(function(response){
      debugger
    })
  })
});
