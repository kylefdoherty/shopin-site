$(document).ready(function() {
  $('#product_tag_tag_id').change(function(){
    $tagId = $(this).find('option:selected').val(),
    $productsToDisplay = $('p.tag'+$tagId);
    $('.products').children().hide();
    $productsToDisplay.show();
  });
});