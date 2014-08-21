$(function(){

  var hello = "cruel world";

  $('.edit_line_item').change(function(){
    var $updatedQuant = $(this).find('option:selected').val();
    if ($updatedQuant === '0') {
      $(this).parent().siblings().last().find('form').submit();
    } else {
      $(this).submit();

    }
  });

});