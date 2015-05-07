function change_quantity_product(arg) {
  zzz = $('#select_name_product_'+arg+' :selected').val();
  if (parseInt($('#quantity_'+arg).val()) === 0) {
    $('#quantity_'+arg).val('1');
  }
  $("#price_product_" + arg + " :nth-child(" + zzz + ")").attr("selected", "selected");
  zzz = parseFloat($('#quantity_'+arg).val()) * parseFloat($('#price_product_'+arg+' :selected').text())
  $('.total-'+arg).text(zzz);
  total_amount_order();
}
function change_price(arg) {
  zzz = $('#size_'+arg+' :selected').val()
  $('#select_price_'+arg).val(zzz);
}
function change_value(arg) {
  size = $("#size_" + arg + " :selected").val();
  dough = $("#dough_" + arg + " :selected").val();
  sauce = $("#sauce_" + arg + " :selected").val();
  if (parseInt($('#quantity_'+arg).val()) === 0) {
    $('#quantity_'+arg).val('1');
  }
  variant = 1;
  s_v = size+'-'+dough+'-'+sauce;
  $('.total-'+arg).text('Недоступен');
  $('#select_rkeeper_'+arg+' option').each(function(){
    if (this.text === s_v) {
      zzz = parseFloat($('#quantity_'+arg).val()) * parseFloat($('#select_price_'+arg+' :selected').text())
      $('.total-'+arg).text(zzz);
    }
  });
  $('#n_rkeeper_'+arg).val(variant);
  total_amount_order();
}
function change_quantity(arg) {
  if (parseInt($('#quantity_'+arg).val()) === 0) {
    $('#quantity_'+arg).val('1');
  }
  zzz = parseFloat($('#quantity_'+arg).val()) * parseFloat($('#select_price_'+arg+' :selected').text())
  $('.total-'+arg).text(zzz);
  total_amount_order();
}
function total_amount_order() {
  a = $('.amount-to-sum');
  sum = 0;
  for (var i = 0; i < a.length; i++) {
    sum += parseFloat($(a[i]).text());
  }
  $('.amount-to-sum-total total').text(sum);
}