$(document).ready(function() {
  // delete list
  $('.delete-list').click(function(event) {
      event.preventDefault();

      var $current_list = $(this).parent().parent();
      console.log($current_list);

      $.ajax({
        method: 'DELETE',
        url: $(this).attr('href')
      })
       .done(function() {
         $current_list.remove();
       })
  });
});
