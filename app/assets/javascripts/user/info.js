$(function(){
  //get followers
  $('*[data-load="followers"]').click(function(){
    NProgress.start();
    var id = $('#user-panel').data('owner');
    $.ajax({
      url: id + '/followers',
      type: "GET",
      dataType: "html",
      success: function(data){
        NProgress.done();
        $('#info').html(data);
      }
    });
  });

  //get subscriptions

  $('*[data-load="subscriptions"]').click(function(){
    NProgress.start();
    var id = $('#user-panel').data('owner');
    $.ajax({
      url: id + '/subscriptions',
      type: "GET",
      dataType: "html",
      success: function(data){
        NProgress.done();
        $('#info').html(data);
      }
    });
  });

  //get norifications


  $('*[data-load="info"]').click(function(){
    NProgress.start();
    var id = $('#user-panel').data('owner');
    $.ajax({
      url: id + '/notifications',
      type: "GET",
      dataType: "html",
      success: function(data){
        NProgress.done();
        $('#info').html(data);
      }
    });
  });


})