$(function(){
  $('#buyer').hide();
  $('#edit').hide();
  $('#products').hide();
  $('#seller_pending_fulfillments').hide();


  $('#order-history').click(function(){
    $('#recent_purchases').hide();
    $('#edit').hide();
    $('#seller').hide();
    $('#seller_pending_fulfillments').hide();
    $('#products').hide();
    $('#buyer').show();
  });

  $('#edit-account').click(function(){
    $('#recent_purchases').hide();
    $('#buyer').hide();
    $('#seller').hide();
    $('#products').hide();
    $('#seller_pending_fulfillments').hide();
    $('#edit').show();
  });

  $('#my-account').click(function(){
    $('#buyer').hide();
    $('#edit').hide();
    $('#seller').hide();
    $('#recent_purchases').show();
  });

  $('#pending-fulfillments').click(function(){
    $('#buyer').hide();
    $('#edit').hide();
    $('#recent_purchases').hide();
    $('#products').hide();
    $('#seller_pending_fulfillments').show();
  });  

  $('#my-products').click(function(){
    $('#buyer').hide();
    $('#edit').hide();
    $('#recent_purchases').hide();
    $('#seller_pending_fulfillments').hide();
    $('#products').show(); 
  });

});