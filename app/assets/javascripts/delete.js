// Deleting items from the list
// $('.glyphicon').bind('ajaxSuccess', function() {
//   $(this).parent().fadeOut();
// });
$(document).ready(function() {
  $('.glyphicon').click(function() {
    var user = $(this).data('user');
    var id = $(this).data('id');
    var $item = $(this);
    $.ajax({
      type: "DELETE",
      url: '/users/' + user + '/items/' + id,
      dataType: 'json',
      success: function(data) {
        $item.fadeOut();
      }
    });
  });
});
