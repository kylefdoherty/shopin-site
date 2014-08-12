$(function(){

  $('.edit_line_item').change(function(){
    var $updatedQuant = $(this).find('option:selected').val();
    if ($updatedQuant === '0') {
      debugger
      $('#line_item_<%=j "#{@line_item.id}" %>').remove();
    } end
    $(this).submit();
  });

});