$(document).ready(function() {
  $('#product_tag_tag_id').change(function(){
    $tagId = $(this).find('option:selected').val(),
    $productsToDisplay = $('h5.tag'+$tagId).closest('.item').parent();
    $('.display').children().hide();
    if ($productsToDisplay.length === 0) {
      $('.display').children().show();
    } else {
      $productsToDisplay.show();
    }
  });
});