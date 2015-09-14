$(function() {

  function navbar_click() {
    $('*[data-load]').click(function(){
      var id = "#" + ($(this).data("load"));
      $(id).html("Loading...");
    });
  };

  navbar_click();

});