$( document ).ready(function() {
  $('#product_tag_tag_id').change(function(){
    $tagId = $(this).find('option:selected').val(),
    $products = $('p');
    // if ($products)
    // display only '.tag'+tagId
  });
});