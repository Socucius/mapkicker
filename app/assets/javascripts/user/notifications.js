$(function() {
  var counter = 0;
  var present_count = parseInt($('p[data-load="info"]').text(), 10);
  var user_id = $("#map").data("user");

  $(document).on({
    mouseenter: function() {
      counter += 1;
      present_count -= counter;
      var notification_id = $(this).data('id');
      $(this).css("background-color", "white");
      $(this).css("color", "grey");
      $('p[data-load="info"]').html(present_count + " оповещений");
      $.ajax({
        type: "PUT",
        dataType: "script",
        url: "/users/" + user_id + "/notifications/" + notification_id + "/read",
        data: notification_id
      });
    }
  }, '.new-item');
});