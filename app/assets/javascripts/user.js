$(function(){
  $('#buyer').hide();
  $('#edit').hide();

  $('#order-history').click(function(){
    $('#recent_purchases').hide();
    $('#edit').hide();
    $('#buyer').show();
  });

  $('#edit-account').click(function(){
    $('#recent_purchases').hide();
    $('#buyer').hide();
    $('#edit').show();
  });

  $('#my-account').click(function(){
    $('#buyer').hide();
    $('#edit').hide();
    $('#recent_purchases').show();
  });

});