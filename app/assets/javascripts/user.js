$(function(){
  $('#buyer').hide();
  $('#edit').hide();
  $('#seller').hide();

  $('#order-history').click(function(){
    $('#recent_purchases').hide();
    $('#edit').hide();
    $('#seller').hide();
    $('#buyer').show();
  });

  $('#edit-account').click(function(){
    $('#recent_purchases').hide();
    $('#buyer').hide();
    $('#seller').hide();
    $('#edit').show();
  });

  $('#my-account').click(function(){
    $('#buyer').hide();
    $('#edit').hide();
    $('#seller').hide();
    $('#recent_purchases').show();
  });

  $('#seller-account').click(function(){
    $('#buyer').hide();
    $('#edit').hide();
    $('#recent_purchases').hide();
    $('#seller').show();
  });

});