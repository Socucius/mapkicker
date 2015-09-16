$(function (){
  $(document).on('click', '.btn[data-action="place_edit"]' ,function(){
    var link = $(this).data('url');
    $.ajax({
      url: link,
      dataType: 'html',
      type: "GET",
      success: function(data){
        $('#place-content').html(data);
        $('.edit-place').redactor();
      }
    });
  });
});